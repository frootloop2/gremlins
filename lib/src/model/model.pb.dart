///
//  Generated code. Do not modify.
//  source: lib/src/model/model.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

// ignore: UNUSED_SHOWN_NAME
import 'dart:core' show int, bool, double, String, List, override;

import 'package:protobuf/protobuf.dart' as $pb;

import 'model.pbenum.dart';

export 'model.pbenum.dart';

class State extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('State')
    ..pp<Player>(3, 'turnOrderedPlayers', $pb.PbFieldType.PM, Player.$checkItem, Player.create)
    ..p<int>(4, 'drawDeckCardIds', $pb.PbFieldType.P3)
    ..p<int>(5, 'discardDeckCardIds', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  State() : super();
  State.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  State.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  State clone() => new State()..mergeFromMessage(this);
  State copyWith(void Function(State) updates) => super.copyWith((message) => updates(message as State));
  $pb.BuilderInfo get info_ => _i;
  static State create() => new State();
  static $pb.PbList<State> createRepeated() => new $pb.PbList<State>();
  static State getDefault() => _defaultInstance ??= create()..freeze();
  static State _defaultInstance;
  static void $checkItem(State v) {
    if (v is! State) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<Player> get turnOrderedPlayers => $_getList(0);

  List<int> get drawDeckCardIds => $_getList(1);

  List<int> get discardDeckCardIds => $_getList(2);
}

class Action extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Action')
    ..e<Action_Type>(1, 'type', $pb.PbFieldType.OE, Action_Type.NONE, Action_Type.valueOf, Action_Type.values)
    ..a<MoveAction>(2, 'move', $pb.PbFieldType.OM, MoveAction.getDefault, MoveAction.create)
    ..a<PlayAction>(3, 'play', $pb.PbFieldType.OM, PlayAction.getDefault, PlayAction.create)
    ..hasRequiredFields = false
  ;

  Action() : super();
  Action.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Action.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Action clone() => new Action()..mergeFromMessage(this);
  Action copyWith(void Function(Action) updates) => super.copyWith((message) => updates(message as Action));
  $pb.BuilderInfo get info_ => _i;
  static Action create() => new Action();
  static $pb.PbList<Action> createRepeated() => new $pb.PbList<Action>();
  static Action getDefault() => _defaultInstance ??= create()..freeze();
  static Action _defaultInstance;
  static void $checkItem(Action v) {
    if (v is! Action) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  Action_Type get type => $_getN(0);
  set type(Action_Type v) { setField(1, v); }
  bool hasType() => $_has(0);
  void clearType() => clearField(1);

  MoveAction get move => $_getN(1);
  set move(MoveAction v) { setField(2, v); }
  bool hasMove() => $_has(1);
  void clearMove() => clearField(2);

  PlayAction get play => $_getN(2);
  set play(PlayAction v) { setField(3, v); }
  bool hasPlay() => $_has(2);
  void clearPlay() => clearField(3);
}

class MoveAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('MoveAction')
    ..a<int>(1, 'cardId', $pb.PbFieldType.O3)
    ..p<int>(2, 'pathSpotIds', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  MoveAction() : super();
  MoveAction.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  MoveAction.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  MoveAction clone() => new MoveAction()..mergeFromMessage(this);
  MoveAction copyWith(void Function(MoveAction) updates) => super.copyWith((message) => updates(message as MoveAction));
  $pb.BuilderInfo get info_ => _i;
  static MoveAction create() => new MoveAction();
  static $pb.PbList<MoveAction> createRepeated() => new $pb.PbList<MoveAction>();
  static MoveAction getDefault() => _defaultInstance ??= create()..freeze();
  static MoveAction _defaultInstance;
  static void $checkItem(MoveAction v) {
    if (v is! MoveAction) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get cardId => $_get(0, 0);
  set cardId(int v) { $_setSignedInt32(0, v); }
  bool hasCardId() => $_has(0);
  void clearCardId() => clearField(1);

  List<int> get pathSpotIds => $_getList(1);
}

class PlayAction extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('PlayAction')
    ..a<int>(1, 'cardId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  PlayAction() : super();
  PlayAction.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  PlayAction.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  PlayAction clone() => new PlayAction()..mergeFromMessage(this);
  PlayAction copyWith(void Function(PlayAction) updates) => super.copyWith((message) => updates(message as PlayAction));
  $pb.BuilderInfo get info_ => _i;
  static PlayAction create() => new PlayAction();
  static $pb.PbList<PlayAction> createRepeated() => new $pb.PbList<PlayAction>();
  static PlayAction getDefault() => _defaultInstance ??= create()..freeze();
  static PlayAction _defaultInstance;
  static void $checkItem(PlayAction v) {
    if (v is! PlayAction) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get cardId => $_get(0, 0);
  set cardId(int v) { $_setSignedInt32(0, v); }
  bool hasCardId() => $_has(0);
  void clearCardId() => clearField(1);
}

class Data extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Data')
    ..a<InitialData>(1, 'initialData', $pb.PbFieldType.OM, InitialData.getDefault, InitialData.create)
    ..a<PlayerStateViewData>(2, 'playerStateView', $pb.PbFieldType.OM, PlayerStateViewData.getDefault, PlayerStateViewData.create)
    ..hasRequiredFields = false
  ;

  Data() : super();
  Data.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Data.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Data clone() => new Data()..mergeFromMessage(this);
  Data copyWith(void Function(Data) updates) => super.copyWith((message) => updates(message as Data));
  $pb.BuilderInfo get info_ => _i;
  static Data create() => new Data();
  static $pb.PbList<Data> createRepeated() => new $pb.PbList<Data>();
  static Data getDefault() => _defaultInstance ??= create()..freeze();
  static Data _defaultInstance;
  static void $checkItem(Data v) {
    if (v is! Data) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  InitialData get initialData => $_getN(0);
  set initialData(InitialData v) { setField(1, v); }
  bool hasInitialData() => $_has(0);
  void clearInitialData() => clearField(1);

  PlayerStateViewData get playerStateView => $_getN(1);
  set playerStateView(PlayerStateViewData v) { setField(2, v); }
  bool hasPlayerStateView() => $_has(1);
  void clearPlayerStateView() => clearField(2);
}

class InitialData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('InitialData')
    ..pp<Spot>(1, 'map', $pb.PbFieldType.PM, Spot.$checkItem, Spot.create)
    ..pp<Card>(2, 'cards', $pb.PbFieldType.PM, Card.$checkItem, Card.create)
    ..hasRequiredFields = false
  ;

  InitialData() : super();
  InitialData.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  InitialData.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  InitialData clone() => new InitialData()..mergeFromMessage(this);
  InitialData copyWith(void Function(InitialData) updates) => super.copyWith((message) => updates(message as InitialData));
  $pb.BuilderInfo get info_ => _i;
  static InitialData create() => new InitialData();
  static $pb.PbList<InitialData> createRepeated() => new $pb.PbList<InitialData>();
  static InitialData getDefault() => _defaultInstance ??= create()..freeze();
  static InitialData _defaultInstance;
  static void $checkItem(InitialData v) {
    if (v is! InitialData) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  List<Spot> get map => $_getList(0);

  List<Card> get cards => $_getList(1);
}

class PlayerStateViewData extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('PlayerStateViewData')
    ..a<int>(1, 'currentPlayerId', $pb.PbFieldType.O3)
    ..e<Action_Type>(2, 'nextActionType', $pb.PbFieldType.OE, Action_Type.NONE, Action_Type.valueOf, Action_Type.values)
    ..a<Player>(3, 'self', $pb.PbFieldType.OM, Player.getDefault, Player.create)
    ..pp<PlayerView>(4, 'others', $pb.PbFieldType.PM, PlayerView.$checkItem, PlayerView.create)
    ..hasRequiredFields = false
  ;

  PlayerStateViewData() : super();
  PlayerStateViewData.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  PlayerStateViewData.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  PlayerStateViewData clone() => new PlayerStateViewData()..mergeFromMessage(this);
  PlayerStateViewData copyWith(void Function(PlayerStateViewData) updates) => super.copyWith((message) => updates(message as PlayerStateViewData));
  $pb.BuilderInfo get info_ => _i;
  static PlayerStateViewData create() => new PlayerStateViewData();
  static $pb.PbList<PlayerStateViewData> createRepeated() => new $pb.PbList<PlayerStateViewData>();
  static PlayerStateViewData getDefault() => _defaultInstance ??= create()..freeze();
  static PlayerStateViewData _defaultInstance;
  static void $checkItem(PlayerStateViewData v) {
    if (v is! PlayerStateViewData) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get currentPlayerId => $_get(0, 0);
  set currentPlayerId(int v) { $_setSignedInt32(0, v); }
  bool hasCurrentPlayerId() => $_has(0);
  void clearCurrentPlayerId() => clearField(1);

  Action_Type get nextActionType => $_getN(1);
  set nextActionType(Action_Type v) { setField(2, v); }
  bool hasNextActionType() => $_has(1);
  void clearNextActionType() => clearField(2);

  Player get self => $_getN(2);
  set self(Player v) { setField(3, v); }
  bool hasSelf() => $_has(2);
  void clearSelf() => clearField(3);

  List<PlayerView> get others => $_getList(3);
}

class PlayerView extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('PlayerView')
    ..a<int>(1, 'playerId', $pb.PbFieldType.O3)
    ..a<int>(2, 'currentSpotId', $pb.PbFieldType.O3)
    ..a<Resources>(3, 'resources', $pb.PbFieldType.OM, Resources.getDefault, Resources.create)
    ..a<int>(4, 'income', $pb.PbFieldType.O3)
    ..a<int>(5, 'bribe', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  PlayerView() : super();
  PlayerView.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  PlayerView.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  PlayerView clone() => new PlayerView()..mergeFromMessage(this);
  PlayerView copyWith(void Function(PlayerView) updates) => super.copyWith((message) => updates(message as PlayerView));
  $pb.BuilderInfo get info_ => _i;
  static PlayerView create() => new PlayerView();
  static $pb.PbList<PlayerView> createRepeated() => new $pb.PbList<PlayerView>();
  static PlayerView getDefault() => _defaultInstance ??= create()..freeze();
  static PlayerView _defaultInstance;
  static void $checkItem(PlayerView v) {
    if (v is! PlayerView) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get playerId => $_get(0, 0);
  set playerId(int v) { $_setSignedInt32(0, v); }
  bool hasPlayerId() => $_has(0);
  void clearPlayerId() => clearField(1);

  int get currentSpotId => $_get(1, 0);
  set currentSpotId(int v) { $_setSignedInt32(1, v); }
  bool hasCurrentSpotId() => $_has(1);
  void clearCurrentSpotId() => clearField(2);

  Resources get resources => $_getN(2);
  set resources(Resources v) { setField(3, v); }
  bool hasResources() => $_has(2);
  void clearResources() => clearField(3);

  int get income => $_get(3, 0);
  set income(int v) { $_setSignedInt32(3, v); }
  bool hasIncome() => $_has(3);
  void clearIncome() => clearField(4);

  int get bribe => $_get(4, 0);
  set bribe(int v) { $_setSignedInt32(4, v); }
  bool hasBribe() => $_has(4);
  void clearBribe() => clearField(5);
}

class Player extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Player')
    ..a<int>(1, 'id', $pb.PbFieldType.O3)
    ..a<int>(2, 'currentSpotId', $pb.PbFieldType.O3)
    ..p<int>(3, 'handCardIds', $pb.PbFieldType.P3)
    ..a<Resources>(4, 'resources', $pb.PbFieldType.OM, Resources.getDefault, Resources.create)
    ..a<int>(5, 'income', $pb.PbFieldType.O3)
    ..a<int>(6, 'bribe', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Player() : super();
  Player.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Player.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Player clone() => new Player()..mergeFromMessage(this);
  Player copyWith(void Function(Player) updates) => super.copyWith((message) => updates(message as Player));
  $pb.BuilderInfo get info_ => _i;
  static Player create() => new Player();
  static $pb.PbList<Player> createRepeated() => new $pb.PbList<Player>();
  static Player getDefault() => _defaultInstance ??= create()..freeze();
  static Player _defaultInstance;
  static void $checkItem(Player v) {
    if (v is! Player) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get id => $_get(0, 0);
  set id(int v) { $_setSignedInt32(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);

  int get currentSpotId => $_get(1, 0);
  set currentSpotId(int v) { $_setSignedInt32(1, v); }
  bool hasCurrentSpotId() => $_has(1);
  void clearCurrentSpotId() => clearField(2);

  List<int> get handCardIds => $_getList(2);

  Resources get resources => $_getN(3);
  set resources(Resources v) { setField(4, v); }
  bool hasResources() => $_has(3);
  void clearResources() => clearField(4);

  int get income => $_get(4, 0);
  set income(int v) { $_setSignedInt32(4, v); }
  bool hasIncome() => $_has(4);
  void clearIncome() => clearField(5);

  int get bribe => $_get(5, 0);
  set bribe(int v) { $_setSignedInt32(5, v); }
  bool hasBribe() => $_has(5);
  void clearBribe() => clearField(6);
}

class Spot extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Spot')
    ..a<int>(1, 'id', $pb.PbFieldType.O3)
    ..e<SpotType>(2, 'type', $pb.PbFieldType.OE, SpotType.JAIL, SpotType.valueOf, SpotType.values)
    ..p<int>(3, 'fromSpotIds', $pb.PbFieldType.P3)
    ..p<int>(4, 'toSpotIds', $pb.PbFieldType.P3)
    ..hasRequiredFields = false
  ;

  Spot() : super();
  Spot.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Spot.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Spot clone() => new Spot()..mergeFromMessage(this);
  Spot copyWith(void Function(Spot) updates) => super.copyWith((message) => updates(message as Spot));
  $pb.BuilderInfo get info_ => _i;
  static Spot create() => new Spot();
  static $pb.PbList<Spot> createRepeated() => new $pb.PbList<Spot>();
  static Spot getDefault() => _defaultInstance ??= create()..freeze();
  static Spot _defaultInstance;
  static void $checkItem(Spot v) {
    if (v is! Spot) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get id => $_get(0, 0);
  set id(int v) { $_setSignedInt32(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);

  SpotType get type => $_getN(1);
  set type(SpotType v) { setField(2, v); }
  bool hasType() => $_has(1);
  void clearType() => clearField(2);

  List<int> get fromSpotIds => $_getList(2);

  List<int> get toSpotIds => $_getList(3);
}

class Card extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Card')
    ..a<int>(1, 'id', $pb.PbFieldType.O3)
    ..aOS(2, 'name')
    ..e<SpotType>(3, 'playSpotType', $pb.PbFieldType.OE, SpotType.JAIL, SpotType.valueOf, SpotType.values)
    ..a<int>(4, 'moveAmount', $pb.PbFieldType.O3)
    ..a<Resources>(5, 'moveReward', $pb.PbFieldType.OM, Resources.getDefault, Resources.create)
    ..a<Resources>(6, 'playCost', $pb.PbFieldType.OM, Resources.getDefault, Resources.create)
    ..a<Resources>(7, 'playReward', $pb.PbFieldType.OM, Resources.getDefault, Resources.create)
    ..hasRequiredFields = false
  ;

  Card() : super();
  Card.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Card.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Card clone() => new Card()..mergeFromMessage(this);
  Card copyWith(void Function(Card) updates) => super.copyWith((message) => updates(message as Card));
  $pb.BuilderInfo get info_ => _i;
  static Card create() => new Card();
  static $pb.PbList<Card> createRepeated() => new $pb.PbList<Card>();
  static Card getDefault() => _defaultInstance ??= create()..freeze();
  static Card _defaultInstance;
  static void $checkItem(Card v) {
    if (v is! Card) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get id => $_get(0, 0);
  set id(int v) { $_setSignedInt32(0, v); }
  bool hasId() => $_has(0);
  void clearId() => clearField(1);

  String get name => $_getS(1, '');
  set name(String v) { $_setString(1, v); }
  bool hasName() => $_has(1);
  void clearName() => clearField(2);

  SpotType get playSpotType => $_getN(2);
  set playSpotType(SpotType v) { setField(3, v); }
  bool hasPlaySpotType() => $_has(2);
  void clearPlaySpotType() => clearField(3);

  int get moveAmount => $_get(3, 0);
  set moveAmount(int v) { $_setSignedInt32(3, v); }
  bool hasMoveAmount() => $_has(3);
  void clearMoveAmount() => clearField(4);

  Resources get moveReward => $_getN(4);
  set moveReward(Resources v) { setField(5, v); }
  bool hasMoveReward() => $_has(4);
  void clearMoveReward() => clearField(5);

  Resources get playCost => $_getN(5);
  set playCost(Resources v) { setField(6, v); }
  bool hasPlayCost() => $_has(5);
  void clearPlayCost() => clearField(6);

  Resources get playReward => $_getN(6);
  set playReward(Resources v) { setField(7, v); }
  bool hasPlayReward() => $_has(6);
  void clearPlayReward() => clearField(7);
}

class Resources extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = new $pb.BuilderInfo('Resources')
    ..a<int>(1, 'points', $pb.PbFieldType.O3)
    ..a<int>(2, 'gold', $pb.PbFieldType.O3)
    ..a<int>(3, 'votes', $pb.PbFieldType.O3)
    ..a<int>(4, 'evil', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  Resources() : super();
  Resources.fromBuffer(List<int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromBuffer(i, r);
  Resources.fromJson(String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) : super.fromJson(i, r);
  Resources clone() => new Resources()..mergeFromMessage(this);
  Resources copyWith(void Function(Resources) updates) => super.copyWith((message) => updates(message as Resources));
  $pb.BuilderInfo get info_ => _i;
  static Resources create() => new Resources();
  static $pb.PbList<Resources> createRepeated() => new $pb.PbList<Resources>();
  static Resources getDefault() => _defaultInstance ??= create()..freeze();
  static Resources _defaultInstance;
  static void $checkItem(Resources v) {
    if (v is! Resources) $pb.checkItemFailed(v, _i.qualifiedMessageName);
  }

  int get points => $_get(0, 0);
  set points(int v) { $_setSignedInt32(0, v); }
  bool hasPoints() => $_has(0);
  void clearPoints() => clearField(1);

  int get gold => $_get(1, 0);
  set gold(int v) { $_setSignedInt32(1, v); }
  bool hasGold() => $_has(1);
  void clearGold() => clearField(2);

  int get votes => $_get(2, 0);
  set votes(int v) { $_setSignedInt32(2, v); }
  bool hasVotes() => $_has(2);
  void clearVotes() => clearField(3);

  int get evil => $_get(3, 0);
  set evil(int v) { $_setSignedInt32(3, v); }
  bool hasEvil() => $_has(3);
  void clearEvil() => clearField(4);
}

