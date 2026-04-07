import 'package:democracy/app/utils/custom_text.dart';
import 'package:democracy/app/utils/regex.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PostBody extends StatefulWidget {
  const PostBody({
    super.key,
    required this.post,
    this.showWholeText = false,
    this.isDependency = false,
  });

  final Post post;
  final bool showWholeText;
  final bool isDependency;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  String suffix = '...Show more';
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    String text = extractLinkFromPost(widget.post);
    return text.isEmpty
        ? SizedBox.shrink()
        : CustomText(
            text: text,
            style: Theme.of(context).textTheme.bodyMedium!,
            suffix: widget.showWholeText ? '' : suffix,
            showAllText: widget.showWholeText ? true : readMore,
            onSuffixPressed: () {
              if (widget.isDependency) {
                widget.post.communityNoteOf == null
                    ? navigateToPostDetail(
                        context: context,
                        post: widget.post,
                        showAsRepost: false,
                        repost: widget.post,
                      )
                    : navigateToCommunityNoteDetail(
                        context: context,
                        post: widget.post,
                        showAsRepost: false,
                        repost: widget.post,
                      );
              } else {
                setState(() {
                  if (readMore) {
                    suffix = '...Show more';
                    readMore = false;
                  } else {
                    suffix = '\nShow less';
                    readMore = true;
                  }
                });
              }
            },
            onUserTagPressed: (userId) {
              navigateToProfilePage(
                context: context,
                user: widget.post.taggedUsers.firstWhere(
                  (user) => user.id == int.parse(userId),
                ),
              );
            },
          );
  }
}

String extractLinkFromPost(Post post) {
  String text = post.body;

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
    if (post.repostOf != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('post')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (post.repostOf!.id == int.parse(intString)) {
            text = post.body.replaceAll(url, '');
          }
        }
      }
    }
    if (post.meeting != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('meeting')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (post.meeting!.id == int.parse(intString)) {
            text = post.body.replaceAll(url, '');
          }
        }
      }
    }
    if (post.ballot != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('ballot')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (post.ballot!.id == int.parse(intString)) {
            text = post.body.replaceAll(url, '');
          }
        }
      }
    }
    if (post.survey != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('survey')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (post.survey!.id == int.parse(intString)) {
            text = post.body.replaceAll(url, '');
          }
        }
      }
    }
    if (post.petition != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('petition')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (post.petition!.id == int.parse(intString)) {
            text = post.body.replaceAll(url, '');
          }
        }
      }
    }
    if (post.section != null) {
      for (String url in matchingLinks) {
        Uri uri = Uri.parse(url);
        if (uri.path.contains('section')) {
          String intString = uri.path.replaceAll(RegExp(r'[^0-9]'), '');
          if (post.section!.id == int.parse(intString)) {
            text = post.body.replaceAll(url, '');
          }
        }
      }
    }
  }
  return text;
}
