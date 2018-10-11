import 'dart:async';
import 'dart:html';

import 'package:gremlins/src/client/data/map_points.dart';
import 'package:gremlins/src/model/model.pb.dart';

class Render {
  static final StreamTransformer<MouseEvent, int> _clickToSpotId =
      StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(mapPoints.indexWhere(
              (topLeftCoordinate) =>
                  data.client.y - topLeftCoordinate.last <= height &&
                  data.client.y - topLeftCoordinate.last >= 0 &&
                  data.client.x - topLeftCoordinate.first <= width &&
                  data.client.x - topLeftCoordinate.first >= 0)));

  Stream<int> spotClicks;

  final ImageElement _image = ImageElement(src: 'map.png');
  final CanvasElement _canvas = querySelector('#canvas');
  CanvasRenderingContext2D _renderer;

  Render() {
    querySelector('body').style.margin = '0';
    _canvas
      ..width = 1531
      ..height = 861
      ..style.backgroundColor = '0';
    _renderer = _canvas.context2D;
    _image.onLoad.first.then((_) => _renderer.drawImage(_image, 0, 0));
    spotClicks =
        _canvas.onClick.transform(_clickToSpotId).where((id) => id >= 0);
  }

  void update(PlayerStateViewData playerStateView) {
    _renderer
      ..clearRect(0, 0, 1531, 861)
      ..drawImage(_image, 0, 0);
    _drawPlayer(playerStateView.self.currentSpotId, '#0FF');
    playerStateView.others
        .forEach((playerView) => _drawPlayer(playerView.currentSpotId, '#F00'));

    querySelector('#resources').text =
        playerStateView.self.resources.toString();
    //querySelector('#cards').text = playerStateView.self.handCardIds
    //  .map((id) => allCards[id].name)
    //.join(',');
    querySelector('#other-resources').text =
        playerStateView.others.first.resources.toString();
  }

  void _drawPlayer(int spotId, String color) {
    final List<int> drawPoint = mapPoints[spotId];
    _renderer
      ..fillStyle = color
      ..fillRect(drawPoint.first, drawPoint.last, 50, 50);
  }
}
