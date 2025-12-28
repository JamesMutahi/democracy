import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_detail.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CommunityNoteTile extends StatelessWidget {
  const CommunityNoteTile({
    super.key,
    required this.communityNote,
    required this.navigateToDetailPage,
    required this.showWholeText,
  });

  final Post communityNote;
  final bool navigateToDetailPage;
  final bool showWholeText;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');

    return InkWell(
      onTap: !navigateToDetailPage
          ? null
          : () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CommunityNoteDetail(communityNote: communityNote),
                ),
              );
            },
      child: Stack(
        children: [
          Container(
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
                        color: communityNote.isUpvoted
                            ? Colors.greenAccent
                            : null,
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
                        color: communityNote.isDownvoted
                            ? Colors.redAccent
                            : null,
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
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ProfileImage(
                              user: communityNote.author,
                              navigateToProfile: true,
                            ),
                            SizedBox(width: 10),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileName(user: communityNote.author),
                                Text(
                                  '${timeFormat.format(communityNote.publishedAt)} • '
                                  '${dateFormat.format(communityNote.publishedAt)}',
                                  style: TextStyle(
                                    color: Theme.of(context).disabledColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10),
                      PostBody(
                        post: communityNote,
                        showWholeText: showWholeText,
                      ),
                      SizedBox(height: 10),
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
          Align(
            alignment: Alignment.topRight,
            child: PostPopUp(post: communityNote),
          ),
        ],
      ),
    );
  }
}
