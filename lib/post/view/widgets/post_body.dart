import 'package:democracy/app/utils/custom_text.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_detail.dart';
import 'package:democracy/post/view/post_detail.dart';
import 'package:democracy/user/view/profile.dart';
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
    return CustomText(
      text: widget.post.body,
      style: Theme.of(context).textTheme.bodyMedium!,
      suffix: widget.showWholeText ? '' : suffix,
      showAllText: widget.showWholeText ? true : readMore,
      onSuffixPressed: () {
        if (widget.isDependency) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => widget.post.communityNoteOf == null
                  ? PostDetail(
                      post: widget.post,
                      showAsRepost: false,
                      repost: widget.post,
                    )
                  : CommunityNoteDetail(communityNote: widget.post),
            ),
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
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ProfilePage(
              user: widget.post.taggedUsers.firstWhere(
                (user) => user.id == int.parse(userId),
              ),
            ),
          ),
        );
      },
    );
  }
}
