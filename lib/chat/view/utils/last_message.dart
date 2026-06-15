import 'package:democracy/app/models/asset.dart';
import 'package:democracy/app/shared/utils/link_extractor.dart';
import 'package:democracy/chat/models/message.dart';

String getLastMessageText(Message message, String prefix) {
  String text = extractLink(
    text: message.text,
    post: message.post,
    ballot: message.ballot,
    broadcast: message.broadcast,
    survey: message.survey,
    petition: message.petition,
    section: message.section,
  );

  if (text.isNotEmpty) {
    return '$prefix${message.text}';
  }

  if (message.post != null) return '${prefix}Shared a post';
  if (message.ballot != null) return '${prefix}Shared a ballot';
  if (message.survey != null) return '${prefix}Shared a survey';
  if (message.petition != null) return '${prefix}Shared a petition';
  if (message.section != null) return '${prefix}Shared the constitution';
  if (message.assets.isNotEmpty) {
    return message.assets.first.contentType == ContentType.image
        ? '${prefix}Shared an image'
        : message.assets.first.contentType == ContentType.video
        ? '${prefix}Shared a video'
        : '${prefix}Shared a document';
  }

  if (message.location != null) return '${prefix}Shared a location';

  return '${prefix}Shared something';
}
