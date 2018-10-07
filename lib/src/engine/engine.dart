import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:gremlins/src/data/cards.json.dart' show cardData;
import 'package:gremlins/src/data/spots.json.dart' show spotData;
import 'package:gremlins/src/engine/player_channel.dart';
import 'package:gremlins/src/model/model.pb.dart';

class Engine {
  static final List<Spot> allSpots =
      spotData.map((json) => Spot.fromJson(jsonEncode(json))).toList();
  static final List<Card> allCards =
      cardData.map((json) => Card.fromJson(jsonEncode(json))).toList();

  final State _state;
  final List<PlayerChannel> playerChannels = [];

  Engine()
      : _state = State()
          ..drawDeckCardIds.addAll(
              List.from(allCards.map((card) => card.id))..shuffle(Random(0)))
          ..turnOrderedPlayers.addAll([
            Player()
              ..id = 0
              ..currentSpotId = allSpots[Random().nextInt(allSpots.length)].id
              ..resources = (Resources()
                ..points = 0
                ..gold = 0
                ..votes = 0
                ..evil = 0)
              ..income = 30
              ..bribe = 20,
            Player()
              ..id = 1
              ..currentSpotId = allSpots[Random().nextInt(allSpots.length)].id
              ..resources = (Resources()
                ..points = 0
                ..gold = 0
                ..votes = 0
                ..evil = 0)
              ..income = 30
              ..bribe = 20
          ]) {
    _state.turnOrderedPlayers
        .forEach((player) => player.handCardIds.addAll(_drawCards(6)));
  }

  PlayerChannel registerPlayer() {
    playerChannels.add(PlayerChannel(playerChannels.length));
    return playerChannels.last;
  }

  Future<void> run() async {
    _emitInitialData();

    // TODO: loop turns
    await Future.forEach(_state.turnOrderedPlayers, _takeTurn);
  }

  Future<void> _takeTurn(Player player) async {
    final PlayerChannel playerChannel = getPlayerChannel(player.id);
    _move(player, await _getMove(playerChannel));
    _play(player, await _getPlay(playerChannel));
  }

  List<int> _drawCards(int count) {
    final List<int> cards = _state.drawDeckCardIds.sublist(0, count);
    _state.drawDeckCardIds.removeRange(0, count);
    return cards;
  }

  void _move(Player player, MoveAction moveAction) {
    final Card moveCard = allCards[moveAction.cardId];
    final List<Spot> movePath =
        moveAction.pathSpotIds.map((id) => allSpots[id]).toList();

    player.resources = _add(player.resources, moveCard.moveReward);
    player.handCardIds.remove(moveCard.id);
    _state.discardDeckCardIds.add(moveCard.id);
    player.handCardIds.addAll(_drawCards(1));

    for (int i = 0; i < movePath.length - 1; i++) {
      player.currentSpotId = movePath[i].id;
      // TODO: pass over effect

      _emitPlayerStateViewData(player.id, Action_Type.NONE);
    }
    player.currentSpotId = movePath.last.id;
    // TODO: land effect
  }

  void _play(Player player, PlayAction playAction) {
    final Card playCard = allCards[playAction.cardId];

    player.resources = _subtract(
        _add(player.resources, playCard.playReward), playCard.playCost);
    player.handCardIds.remove(playCard.id);
    _state.discardDeckCardIds.add(playCard.id);
    // TODO: play effect
    player.handCardIds.addAll(_drawCards(1));
  }

  Future<MoveAction> _getMove(PlayerChannel playerChannel) async {
    _emitPlayerStateViewData(playerChannel.playerId, Action_Type.MOVE);
    return (await playerChannel.actionStream
            .firstWhere((action) => action.type == Action_Type.MOVE))
        .move;
  }

  Future<PlayAction> _getPlay(PlayerChannel playerChannel) async {
    _emitPlayerStateViewData(playerChannel.playerId, Action_Type.PLAY);
    return (await playerChannel.actionStream
            .firstWhere((action) => action.type == Action_Type.PLAY))
        .play;
  }

  void _emitInitialData() => playerChannels.forEach((playerChannel) =>
      playerChannel.dataSink.add(Data()
        ..initialData =
            (InitialData()..map.addAll(allSpots)..cards.addAll(allCards))));

  void _emitPlayerStateViewData(
          int currentPlayerId, Action_Type nextActionType) =>
      playerChannels.forEach((playerChannel) => playerChannel.dataSink.add(
          Data()
            ..playerStateView = (PlayerStateViewData()
              ..currentPlayerId = currentPlayerId
              ..nextActionType = nextActionType
              ..self = _state.turnOrderedPlayers
                  .singleWhere((player) => player.id == playerChannel.playerId)
              ..others.addAll(_toViewData(_state.turnOrderedPlayers
                  .where((player) => player.id != playerChannel.playerId))))));

  PlayerChannel getPlayerChannel(int playerId) => playerChannels
      .singleWhere((playerChannel) => playerChannel.playerId == playerId);

  static Iterable<PlayerView> _toViewData(Iterable<Player> players) =>
      players.map((player) => PlayerView()
        ..currentSpotId = player.currentSpotId
        ..resources = player.resources
        ..income = player.income
        ..bribe = player.bribe);

  static Resources _add(Resources a, Resources b) => Resources()
    ..points = a.points + b.points
    ..gold = a.gold + b.gold
    ..votes = a.votes + b.votes
    ..evil = a.evil + b.evil;

  static Resources _subtract(Resources a, Resources b) => Resources()
    ..points = a.points - b.points
    ..gold = a.gold - b.gold
    ..votes = a.votes - b.votes
    ..evil = a.evil - b.evil;
}
