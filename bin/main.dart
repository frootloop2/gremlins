import 'package:gremlins/src/server/server.dart';

/// server entrypoint. running this will create the game server that clients can
/// connect to. runs on dart VM.
void main() async {
  Server().start();
}
