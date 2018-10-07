import 'dart:async';

import 'package:gremlins/src/model/model.pb.dart';

class PlayerChannel {
  final int playerId;

  final StreamController<Action> _actions = StreamController.broadcast();
  final StreamController<Data> _data = StreamController.broadcast();

  PlayerChannel(this.playerId);

  /// client facing to receive engine output and send user input
  Stream<Data> get dataStream => _data.stream;

  StreamSink<Action> get actionSink => _actions.sink;

  /// engine facing to process user input and emit data
  StreamSink<Data> get dataSink => _data.sink;

  Stream<Action> get actionStream => _actions.stream;
}
