import 'dart:async';
import 'dart:html';

import 'package:gremlins/src/data/map_points.dart' show mapPoints;
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
  CanvasRenderingContext2D renderer;
  final ImageElement image = ImageElement(src: 'map.png');

  Client() {
    final CanvasElement canvas = querySelector('#canvas');
    canvas
      ..width = 1531
      ..height = 861
      ..style.backgroundColor = '0';
    renderer = canvas.context2D;
    image.onLoad.first.then((_) => renderer.drawImage(image, 0, 0));

    final StreamController<Action> controller = StreamController.broadcast();
    final ButtonElement button = querySelector('#button');
    button.onClick.listen((_) {
      if (playerStateView.nextActionType == Action_Type.MOVE) {
        controller.add(Action()
          ..type = Action_Type.MOVE
          ..move = (MoveAction()
            ..cardId = playerStateView.self.handCardIds.first
            ..pathSpotIds.addAll([0, 1])));
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

      renderer
        ..clearRect(0, 0, 1531, 861)
        ..drawImage(image, 0, 0);
      _drawPlayer(playerStateView.self.currentSpotId, '#F00');
      playerStateView.others.forEach(
          (playerView) => _drawPlayer(playerView.currentSpotId, '#0F0'));

      querySelector('#resources').text =
          playerStateView.self.resources.toString();
      querySelector('#cards').text = playerStateView.self.handCardIds
          .map((id) => allCards[id].name)
          .join(',');
      querySelector('#other-resources').text =
          playerStateView.others.first.resources.toString();
    }
  }

  void _drawPlayer(int spotId, String color) {
    final List<int> drawPoint = mapPoints[spotId];
    renderer
      ..fillStyle = color
      ..fillRect(drawPoint.first, drawPoint.last, 50, 50);
  }
}
