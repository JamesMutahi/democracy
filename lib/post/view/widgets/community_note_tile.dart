import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_detail.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
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
    required this.isDependency,
  });

  final Post communityNote;
  final bool navigateToDetailPage;
  final bool showWholeText;
  final bool isDependency;

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
            decoration: BoxDecoration(
              border: Border(
                bottom: isDependency
                    ? BorderSide.none
                    : BorderSide(
                        color: Theme.of(context).disabledColor.withAlpha(30),
                      ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    if (!navigateToDetailPage)
                      ThreadLine(showBottomThread: false, showTopThread: true),
                    if (!isDependency)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              size: 52,
                              color: communityNote.isUpvoted
                                  ? Colors.blue
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
                              size: 52,
                              color: communityNote.isDownvoted
                                  ? Colors.blue
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
                  ],
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(right: 15, top: 10, bottom: 5),
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
                            Text(
                              '${numberFormat.format(communityNote.replies)} ${communityNote.replies == 1 ? 'Comment' : 'Comments'}',
                              style: TextStyle(
                                color: communityNote.author.hasBlocked
                                    ? Theme.of(context).disabledColor
                                    : Theme.of(context).colorScheme.outline,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                RepostButton(
                                  post: communityNote,
                                  numberFormat: numberFormat,
                                ),
                                SizedBox(width: 20),
                                BookmarkButton(
                                  post: communityNote,
                                  numberFormat: numberFormat,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
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
