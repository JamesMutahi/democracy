import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

WebSocketChannel createWebSocketChannel(String url) {
  final uri = Uri.parse(url);
  return IOWebSocketChannel.connect(uri, headers: {'Origin': url});
}