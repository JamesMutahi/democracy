import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class PostWidgetSelector extends StatelessWidget {
  const PostWidgetSelector({
    super.key,
    required this.post,
    this.isDependency = false,
    this.checkVisibility = false,
    this.hideBorder = false,
    this.showTopThread = false,
    this.showBottomThread = false,
  });

  final Post post;
  final bool isDependency;
  final bool checkVisibility;
  final bool hideBorder;
  final bool showTopThread;
  final bool showBottomThread;

  @override
  Widget build(BuildContext context) {
    return post.communityNoteOf == null
        ? PostTile(
            post: post,
            isDependency: isDependency,
            checkVisibility: checkVisibility,
            hideBorder: hideBorder,
            showTopThread: showTopThread,
            showBottomThread: showBottomThread,
          )
        : CommunityNoteTile(
            communityNote: post,
            navigateToDetailPage: true,
            showWholeText: false,
            isDependency: isDependency,
            hideBorder: hideBorder,
            showTopThread: showTopThread,
            showBottomThread: showBottomThread,
          );
  }
}
