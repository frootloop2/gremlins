///
//  Generated code. Do not modify.
//  source: lib/src/model/model.proto
///
// ignore_for_file: non_constant_identifier_names,library_prefixes,unused_import

const SpotType$json = const {
  '1': 'SpotType',
  '2': const [
    const {'1': 'JAIL', '2': 0},
    const {'1': 'INFERNO', '2': 1},
    const {'1': 'CASINO', '2': 2},
    const {'1': 'COURT', '2': 3},
    const {'1': 'TREASURE', '2': 4},
    const {'1': 'ASTRAL_PLANE', '2': 5},
    const {'1': 'BANK', '2': 6},
    const {'1': 'OFFICE', '2': 7},
    const {'1': 'PLANT', '2': 8},
    const {'1': 'DUMP', '2': 9},
    const {'1': 'MARKETPLACE', '2': 10},
    const {'1': 'INCOME', '2': 11},
    const {'1': 'BRIBE', '2': 12},
    const {'1': 'RISK', '2': 13},
    const {'1': 'MISFORTUNE', '2': 14},
    const {'1': 'TRIBUNE', '2': 15},
    const {'1': 'GAMBLE', '2': 16},
    const {'1': 'POLICE', '2': 17},
  ],
};

const State$json = const {
  '1': 'State',
  '2': const [
    const {'1': 'turn_ordered_players', '3': 3, '4': 3, '5': 11, '6': '.Player', '10': 'turnOrderedPlayers'},
    const {'1': 'draw_deck_card_ids', '3': 4, '4': 3, '5': 5, '10': 'drawDeckCardIds'},
    const {'1': 'discard_deck_card_ids', '3': 5, '4': 3, '5': 5, '10': 'discardDeckCardIds'},
  ],
};

const Action$json = const {
  '1': 'Action',
  '2': const [
    const {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.Action.Type', '10': 'type'},
    const {'1': 'move', '3': 2, '4': 1, '5': 11, '6': '.MoveAction', '10': 'move'},
    const {'1': 'play', '3': 3, '4': 1, '5': 11, '6': '.PlayAction', '10': 'play'},
  ],
  '4': const [Action_Type$json],
};

const Action_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'NONE', '2': 0},
    const {'1': 'MOVE', '2': 1},
    const {'1': 'PLAY', '2': 2},
  ],
};

const MoveAction$json = const {
  '1': 'MoveAction',
  '2': const [
    const {'1': 'card_id', '3': 1, '4': 1, '5': 5, '10': 'cardId'},
    const {'1': 'path_spot_ids', '3': 2, '4': 3, '5': 5, '10': 'pathSpotIds'},
  ],
};

const PlayAction$json = const {
  '1': 'PlayAction',
  '2': const [
    const {'1': 'card_id', '3': 1, '4': 1, '5': 5, '10': 'cardId'},
  ],
};

const Data$json = const {
  '1': 'Data',
  '2': const [
    const {'1': 'initial_data', '3': 1, '4': 1, '5': 11, '6': '.InitialData', '9': 0, '10': 'initialData'},
    const {'1': 'player_state_view', '3': 2, '4': 1, '5': 11, '6': '.PlayerStateViewData', '9': 0, '10': 'playerStateView'},
  ],
  '8': const [
    const {'1': 'kind'},
  ],
};

const InitialData$json = const {
  '1': 'InitialData',
  '2': const [
    const {'1': 'map', '3': 1, '4': 3, '5': 11, '6': '.Spot', '10': 'map'},
    const {'1': 'cards', '3': 2, '4': 3, '5': 11, '6': '.Card', '10': 'cards'},
  ],
};

const PlayerStateViewData$json = const {
  '1': 'PlayerStateViewData',
  '2': const [
    const {'1': 'current_player_id', '3': 1, '4': 1, '5': 5, '10': 'currentPlayerId'},
    const {'1': 'next_action_type', '3': 2, '4': 1, '5': 14, '6': '.Action.Type', '10': 'nextActionType'},
    const {'1': 'self', '3': 3, '4': 1, '5': 11, '6': '.Player', '10': 'self'},
    const {'1': 'others', '3': 4, '4': 3, '5': 11, '6': '.PlayerView', '10': 'others'},
  ],
};

const PlayerView$json = const {
  '1': 'PlayerView',
  '2': const [
    const {'1': 'player_id', '3': 1, '4': 1, '5': 5, '10': 'playerId'},
    const {'1': 'current_spot_id', '3': 2, '4': 1, '5': 5, '10': 'currentSpotId'},
    const {'1': 'resources', '3': 3, '4': 1, '5': 11, '6': '.Resources', '10': 'resources'},
    const {'1': 'income', '3': 4, '4': 1, '5': 5, '10': 'income'},
    const {'1': 'bribe', '3': 5, '4': 1, '5': 5, '10': 'bribe'},
  ],
};

const Player$json = const {
  '1': 'Player',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'current_spot_id', '3': 2, '4': 1, '5': 5, '10': 'currentSpotId'},
    const {'1': 'hand_card_ids', '3': 3, '4': 3, '5': 5, '10': 'handCardIds'},
    const {'1': 'resources', '3': 4, '4': 1, '5': 11, '6': '.Resources', '10': 'resources'},
    const {'1': 'income', '3': 5, '4': 1, '5': 5, '10': 'income'},
    const {'1': 'bribe', '3': 6, '4': 1, '5': 5, '10': 'bribe'},
  ],
};

const Spot$json = const {
  '1': 'Spot',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.SpotType', '10': 'type'},
    const {'1': 'from_spot_ids', '3': 3, '4': 3, '5': 5, '10': 'fromSpotIds'},
    const {'1': 'to_spot_ids', '3': 4, '4': 3, '5': 5, '10': 'toSpotIds'},
  ],
};

const Card$json = const {
  '1': 'Card',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'playSpotType', '3': 3, '4': 1, '5': 14, '6': '.SpotType', '10': 'playSpotType'},
    const {'1': 'move_amount', '3': 4, '4': 1, '5': 5, '10': 'moveAmount'},
    const {'1': 'move_reward', '3': 5, '4': 1, '5': 11, '6': '.Resources', '10': 'moveReward'},
    const {'1': 'play_cost', '3': 6, '4': 1, '5': 11, '6': '.Resources', '10': 'playCost'},
    const {'1': 'play_reward', '3': 7, '4': 1, '5': 11, '6': '.Resources', '10': 'playReward'},
  ],
};

const Resources$json = const {
  '1': 'Resources',
  '2': const [
    const {'1': 'points', '3': 1, '4': 1, '5': 5, '10': 'points'},
    const {'1': 'gold', '3': 2, '4': 1, '5': 5, '10': 'gold'},
    const {'1': 'votes', '3': 3, '4': 1, '5': 5, '10': 'votes'},
    const {'1': 'evil', '3': 4, '4': 1, '5': 5, '10': 'evil'},
  ],
};

