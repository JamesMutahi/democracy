import 'dart:async';
import 'dart:convert';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketService({required this.storage});

  final FlutterSecureStorage storage;

  late WebSocketChannel _channel;
  final StreamController<Map<String, dynamic>> _messageController =
      StreamController.broadcast();

  Stream<Map<String, dynamic>> get messages => _messageController.stream;

  Future<void> connect({required String url, required String token}) async {
    _channel = IOWebSocketChannel.connect(
      Uri.parse(url),
      headers: {'Authorization': 'Token $token', 'Origin': url},
    );
    await _channel.ready;
    _setStatus(WebsocketStatus.connected);
    _channel.stream.listen(
      (message) => _messageController.add(jsonDecode(message)),
      onDone: () async {
        String? token = await storage.read(key: 'token');
        if (token != null) {
          _setStatus(WebsocketStatus.disconnected);
          _reconnect(url, token);
        } else {
          _setStatus(WebsocketStatus.initial);
        }
      },
      onError: (error) {
        _setStatus(WebsocketStatus.failure);
        _reconnect(url, token);
      },
    );
  }

  void _setStatus(WebsocketStatus status) {
    _messageController.add({'websocket': status});
  }

  void send(Map<String, dynamic> message) {
    _channel.sink.add(jsonEncode(message));
  }

  Future<void> disconnect() async {
    await _channel.sink.close();
  }

  void _reconnect(String url, String token) {
    Future.delayed(
      Duration(seconds: 10),
      () => connect(url: url, token: token),
    );
  }
}
