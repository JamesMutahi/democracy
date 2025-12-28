import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_detail.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CommunityNoteTile extends StatelessWidget {
  const CommunityNoteTile({super.key, required this.communityNote});

  final Post communityNote;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");

    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                CommunityNoteDetail(communityNote: communityNote),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(right: 15, top: 10, bottom: 5),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).disabledColor.withAlpha(30),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    size: 40,
                    color: communityNote.isUpvoted ? Colors.greenAccent : null,
                  ),
                  onPressed: () {
                    context.read<PostDetailBloc>().add(
                      PostDetailEvent.upvote(post: communityNote),
                    );
                  },
                ),
                Text(
                  '${communityNote.upvotes - communityNote.downvotes}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 40,
                    color: communityNote.isDownvoted ? Colors.redAccent : null,
                  ),
                  onPressed: () {
                    context.read<PostDetailBloc>().add(
                      PostDetailEvent.downvote(post: communityNote),
                    );
                  },
                ),
              ],
            ),
            SizedBox(width: 10),
            Flexible(
              child: Column(
                children: [
                  Text(communityNote.body),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ReplyButton(
                        post: communityNote,
                        numberFormat: numberFormat,
                      ),
                      RepostButton(
                        post: communityNote,
                        numberFormat: numberFormat,
                      ),
                      BookmarkButton(
                        post: communityNote,
                        numberFormat: numberFormat,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
