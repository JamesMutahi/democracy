import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/utils/link_extractor.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/post/models/post.dart';
import 'package:flutter/material.dart';

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
    String text = extractLink(
      text: widget.post.body,
      post: widget.post.repostOf,
      ballot: widget.post.ballot,
      broadcast: widget.post.broadcast,
      survey: widget.post.survey,
      petition: widget.post.petition,
      section: widget.post.section,
    );
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
                    ? context.router.push(PostDetail(postId: widget.post.id))
                    : context.router.push(
                        CommunityNoteDetail(postId: widget.post.id),
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
              context.router.push(
                ProfileRoute(
                  userId: widget.post.taggedUsers
                      .firstWhere((user) => user.id == userId)
                      .id,
                ),
              );
            },
            onHashtagPressed: (hashtag) {
              context.router.push(
                SearchResults(
                  searchTerm: hashtag,
                  startDate: null,
                  endDate: null,
                  filterCount: 0,
                ),
              );
            },
          );
  }
}
