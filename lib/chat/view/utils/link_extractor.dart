import 'package:democracy/app/shared/constants/regex.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String extractLinkFromMessage(Message message) {
  String text = message.text;
  // Find all matches in the text
  final Iterable<RegExpMatch> urlMatches = linkRegExp.allMatches(text);

  // Extract the actual URL strings from the matches
  List<String> urls = urlMatches
      .map((urlMatch) => text.substring(urlMatch.start, urlMatch.end))
      .toList();

  // Get all links using base url
  String baseUrl = dotenv.env['BASE_URL']!;
  List<String> matchingLinks = [];
  for (String url in urls) {
    if (url.contains(baseUrl)) {
      matchingLinks.add(url);
    }
  }

  // Extract link from text and return text if related object is present
  if (matchingLinks.isNotEmpty) {
    if (message.post != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('post')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (message.post!.id == int.parse(intString)) {
            text = message.text.replaceAll(url, '');
          }
        }
      }
    }
    if (message.meeting != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('meeting')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (message.meeting!.id == int.parse(intString)) {
            text = message.text.replaceAll(url, '');
          }
        }
      }
    }
    if (message.ballot != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('ballot')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (message.ballot!.id == int.parse(intString)) {
            text = message.text.replaceAll(url, '');
          }
        }
      }
    }
    if (message.survey != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('survey')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (message.survey!.id == int.parse(intString)) {
            text = message.text.replaceAll(url, '');
          }
        }
      }
    }
    if (message.petition != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('petition')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (message.petition!.id == int.parse(intString)) {
            text = message.text.replaceAll(url, '');
          }
        }
      }
    }
    if (message.section != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('section')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (message.section!.id == int.parse(intString)) {
            text = message.text.replaceAll(url, '');
          }
        }
      }
    }
  }
  return text;
}
