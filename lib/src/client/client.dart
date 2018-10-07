import 'dart:async';
import 'dart:html';

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

  final List<Spot> allSpots = [];
  final List<Card> allCards = [];
  PlayerStateViewData playerStateView;

  Client() {
    final StreamController<Action> controller = StreamController.broadcast();
    final ButtonElement button = querySelector('#button');
    button.onClick.listen((_) {
      if (playerStateView.nextActionType == Action_Type.MOVE) {
        controller.add(Action()
          ..type = Action_Type.MOVE
          ..move = (MoveAction()
            ..cardId = playerStateView.self.handCardIds.first
            ..pathSpotIds.add(0)));
      } else if (playerStateView.nextActionType == Action_Type.PLAY) {
        controller.add(Action()
          ..type = Action_Type.PLAY
          ..play =
              (PlayAction()..cardId = playerStateView.self.handCardIds.first));
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
      allSpots
        ..clear()
        ..addAll(data.initialData.map);
      allCards
        ..clear()
        ..addAll(data.initialData.cards);
    } else if (data.hasPlayerStateView()) {
      playerStateView = data.playerStateView;
    }
  }
}
