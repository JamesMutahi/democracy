import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/post_tile.dart';
import 'package:flutter/material.dart';

class PostWidgetSelector extends StatelessWidget {
  const PostWidgetSelector({
    super.key,
    required this.post,
    required this.isDependency,
    this.checkVisibility = false,
  });

  final Post post;
  final bool isDependency;
  final bool checkVisibility;

  @override
  Widget build(BuildContext context) {
    return post.communityNoteOf == null
        ? PostTile(
            post: post,
            isDependency: isDependency,
            checkVisibility: checkVisibility,
          )
        : CommunityNoteTile(
            communityNote: post,
            navigateToDetailPage: true,
            showWholeText: false,
            isDependency: isDependency,
          );
  }
}
