import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  late WebSocketChannel _channel;
  final StreamController<Map<String, dynamic>> _messageController =
      StreamController.broadcast();

  Stream<Map<String, dynamic>> get messages => _messageController.stream;

  Future<void> connect(String url, String token) async {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', 'Origin': url},
    );
    await _channel.ready;
    _channel.stream.listen(
      (message) => _messageController.add(jsonDecode(message)),
      onDone: () => _reconnect(url, token),
      onError: (error) => _reconnect(url, token),
    );
  }

  void send(Map<String, dynamic> message) {
    _channel.sink.add(jsonEncode(message));
  }

  Future<void> disconnect() async {
    await _channel.sink.close();
  }

  void _reconnect(String url, String token) {
    Future.delayed(Duration(seconds: 10), () => connect(url, token));
  }
}
