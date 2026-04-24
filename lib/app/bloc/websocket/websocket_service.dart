import 'dart:async';
import 'dart:convert';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketService();
  late WebSocketChannel _channel;
  final StreamController<Map<String, dynamic>> _messageController =
      StreamController.broadcast();

  Stream<Map<String, dynamic>> get messages => _messageController.stream;

  bool isConnected = false;

  Future<void> connect({required String url, required String token}) async {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', 'Origin': url},
    );
    await _channel.ready;
    isConnected = true;
    _setStatus(WebsocketStatus.connected);
    _channel.stream.listen(
      (message) => _messageController.add(jsonDecode(message)),
      onDone: () async {
        isConnected = false;
        _setStatus(WebsocketStatus.disconnected);
      },
      onError: (error) {
        isConnected = false;
        _setStatus(WebsocketStatus.failure);
      },
    );
  }

  void _setStatus(WebsocketStatus status) {
    _messageController.add({websocket: status});
  }

  void send(Map<String, dynamic> message) {
    _channel.sink.add(jsonEncode(message));
  }

  Future<void> disconnect() async {
    await _channel.sink.close();
  }
}
