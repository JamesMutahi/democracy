import 'dart:async';
import 'dart:convert';

import 'package:democracy/app/core/app_logger.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:flutter/foundation.dart'; // For kIsWeb
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/html.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

enum WebsocketStatus { initial, loading, connected, disconnected, failure }

class WebSocketService {
  WebSocketService();

  late WebSocketChannel _channel;
  final StreamController<Map<String, dynamic>> _messageController =
      StreamController.broadcast();

  Stream<Map<String, dynamic>> get messages => _messageController.stream;

  bool isConnected = false;

  Future<void> connect({required String url, required String ticket}) async {
    try {
      final uri = Uri.parse(url);

      if (kIsWeb) {
        _channel = HtmlWebSocketChannel.connect(uri);
      } else {
        _channel = IOWebSocketChannel.connect(uri, headers: {'Origin': url});
      }

      await _channel.ready;
      isConnected = true;
      _setStatus(WebsocketStatus.connected);

      _channel.stream.listen(
        (message) {
          try {
            if (message is String) {
              _messageController.add(
                jsonDecode(message) as Map<String, dynamic>,
              );
            } else {
              _messageController.add(message as Map<String, dynamic>);
            }
          } catch (e) {
            AppLogger.error('Failed to parse WebSocket message: $e');
          }
        },
        onDone: () async {
          isConnected = false;
          _setStatus(WebsocketStatus.disconnected);
        },
        onError: (error, stackTrace) {
          AppLogger.error('WebSocket error: $error\n$stackTrace');
          isConnected = false;
          _setStatus(WebsocketStatus.failure);
        },
      );
    } catch (e, stack) {
      AppLogger.error('WebSocket connection failed: $e\n$stack');
      isConnected = false;
      _setStatus(WebsocketStatus.failure);
      rethrow;
    }
  }

  void _setStatus(WebsocketStatus status) {
    _messageController.add({websocket: status});
  }

  void send(Map<String, dynamic> message) {
    if (isConnected) {
      _channel.sink.add(jsonEncode(message));
    } else {
      AppLogger.warning('Attempted to send message while disconnected');
    }
  }

  Future<void> disconnect() async {
    await _channel.sink.close();
    isConnected = false;
  }
}
