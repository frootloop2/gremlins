import 'dart:async';
import 'dart:html';

import 'package:gremlins/src/client/render.dart';
import 'package:gremlins/src/model/model.pb.dart';
import 'package:web_socket_channel/html.dart';

class Client {
  static final StreamTransformer<Action, String> _actionEncoder =
      StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data.writeToJson()));

  static final StreamTransformer<String, Data> _dataDecoder =
      StreamTransformer.fromHandlers(
          handleData: (data, sink) =>
              // TODO: decode data
              sink.add(Data.fromJson(data)));

  final List<Spot> _allSpots = [];
  final List<Card> _allCards = [];
  PlayerStateViewData _playerStateView;
  final Render _render = Render();

  Client() {
    final StreamController<Action> controller = StreamController.broadcast();
    final ButtonElement button = querySelector('#button');
    button.onClick.listen((_) {
      if (_playerStateView.nextActionType == Action_Type.MOVE) {
        controller.add(Action()
          ..type = Action_Type.MOVE
          ..move = (MoveAction()
            ..cardId = _playerStateView.self.handCardIds.first
            ..pathSpotIds.addAll([0, 1])));
      } else if (_playerStateView.nextActionType == Action_Type.PLAY) {
        controller.add(Action()
          ..type = Action_Type.PLAY
          ..play =
              (PlayAction()..cardId = _playerStateView.self.handCardIds.first));
      }
    });

    final HtmlWebSocketChannel webSocketChannel =
        HtmlWebSocketChannel.connect('ws://localhost:8080');
    webSocketChannel.stream
        .cast<String>()
        .transform(_dataDecoder)
        .listen(_handleData);
    webSocketChannel.sink
        .addStream(controller.stream.transform(_actionEncoder));
  }

  void _handleData(Data data) {
    print(data);
    if (data.hasInitialData()) {
      _allSpots
        ..clear()
        ..addAll(data.initialData.map);
      _allCards
        ..clear()
        ..addAll(data.initialData.cards);
    } else if (data.hasPlayerStateView()) {
      _playerStateView = data.playerStateView;
      _render.update(_playerStateView);
    }
  }
}
