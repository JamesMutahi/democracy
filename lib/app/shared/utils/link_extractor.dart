import 'package:democracy/app/shared/constants/regex.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';

String extractLink({
  required String text,
  required Post? post,
  required Ballot? ballot,
  required Broadcast? broadcast,
  required Survey? survey,
  required Petition? petition,
  required Section? section,
}) {
  // Find all matches in the text
  final Iterable<RegExpMatch> urlMatches = linkRegExp.allMatches(text);

  // Extract the actual URL strings from the matches
  List<String> urls = urlMatches
      .map((urlMatch) => text.substring(urlMatch.start, urlMatch.end))
      .toList();

  // Get all links using base url
  String baseUrl = const String.fromEnvironment('LINK_URL');
  List<String> matchingLinks = urls
      .where((url) => url.contains(baseUrl))
      .toList();

  int? extractId(Uri uri) {
    // 1. First check query parameters (e.g., ?id=3)
    if (uri.queryParameters.containsKey('id')) {
      return int.tryParse(uri.queryParameters['id'] ?? '');
    }

    // 2. Fallback to extracting the last numeric path segment safely
    // Splits segments and finds the first one that is purely digits
    for (String segment in uri.pathSegments.reversed) {
      if (RegExp(r'^\d+$').hasMatch(segment)) {
        return int.tryParse(segment);
      }
    }
    return null;
  }

  for (String url in matchingLinks) {
    // Use tryParse to prevent the entire app from crashing on bad URLs
    Uri? uri = Uri.tryParse(url);
    if (uri == null) continue;

    int? extractedId = extractId(uri);
    if (extractedId == null) continue;

    bool shouldRemove = false;

    // Check matches based on path type and ID verification
    if (post != null && uri.path.contains('post') && post.id == extractedId) {
      shouldRemove = true;
    } else if (broadcast != null &&
        (uri.path.contains('meeting') || uri.path.contains('live-stream')) &&
        broadcast.id == extractedId) {
      shouldRemove = true;
    } else if (ballot != null &&
        uri.path.contains('ballot') &&
        ballot.id == extractedId) {
      shouldRemove = true;
    } else if (survey != null &&
        uri.path.contains('survey') &&
        survey.id == extractedId) {
      shouldRemove = true;
    } else if (petition != null &&
        uri.path.contains('petition') &&
        petition.id == extractedId) {
      shouldRemove = true;
    } else if (section != null &&
        uri.path.contains('constitution') &&
        section.id == extractedId) {
      shouldRemove = true;
    }

    if (shouldRemove) {
      // Remove the URL text
      text = text.replaceAll(url, '');
    }
  }

  // Clean up any remaining double spaces or trailing gaps left by removed links
  return text.replaceAll(RegExp(r' +'), ' ').trim();
}
