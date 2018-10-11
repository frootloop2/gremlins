import 'dart:async';

import 'package:gremlins/src/model/model.pb.dart';
import 'package:gremlins/src/server/engine/engine.dart';
import 'package:gremlins/src/server/engine/player_channel.dart';
import 'package:shelf/shelf_io.dart' as shelf;
import 'package:shelf_web_socket/shelf_web_socket.dart' show webSocketHandler;
import 'package:web_socket_channel/web_socket_channel.dart';

class Server {
  static final StreamTransformer<Data, String> _dataEncoder =
      StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(data.writeToJson()));

  static final StreamTransformer<String, Action> _actionDecoder =
      StreamTransformer.fromHandlers(
          handleData: (data, sink) => sink.add(Action.fromJson(data)));

  final Engine engine = Engine();

  void start() => shelf
      .serve(webSocketHandler(_onConnection), 'localhost', 8080)
      .then((server) =>
          print('serving at ws://${server.address.host}:${server.port}'));

  // registers a player channel with the engine and pipes it to/from the web
  // socket channel
  void _onConnection(WebSocketChannel webSocketChannel) {
    // TODO: reject too many connections
    final PlayerChannel playerChannel = engine.registerPlayer();

    playerChannel.actionSink.addStream(
        webSocketChannel.stream.cast<String>().transform(_actionDecoder));
    webSocketChannel.sink
        .addStream(playerChannel.dataStream.transform(_dataEncoder));

    if (engine.playerChannels.length == 2) {
      engine.run();
    }
  }
}
