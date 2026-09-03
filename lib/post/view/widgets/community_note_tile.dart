import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:visibility_detector/visibility_detector.dart';

class CommunityNoteTile extends StatelessWidget {
  const CommunityNoteTile({
    super.key,
    required this.communityNote,
    this.navigateToDetailPage = true,
    this.showWholeText = false,
    this.isDependency = false,
    this.hideBorder = false,
    this.showTopThread = false,
    this.showBottomThread = false,
    this.onViewed,
  });

  final Post communityNote;
  final bool navigateToDetailPage;
  final bool showWholeText;
  final bool isDependency;
  final bool hideBorder;
  final bool showTopThread;
  final bool showBottomThread;
  final VoidCallback? onViewed;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');

    return VisibilityDetector(
      key: Key('${communityNote.id}'),
      onVisibilityChanged: (visibilityInfo) {
        var visibilityPercentage = visibilityInfo.visibleFraction * 100;
        if (visibilityPercentage > 100) {
          onViewed?.call();
        }
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: isDependency || hideBorder
                    ? BorderSide.none
                    : BorderSide(
                        color: Theme.of(context).disabledColor.withAlpha(30),
                      ),
              ),
            ),
            child: InkWell(
              onTap: !navigateToDetailPage
                  ? null
                  : () {
                      context.router.push(
                        CommunityNoteDetail(postId: communityNote.id),
                      );
                    },
              child: Padding(
                padding: EdgeInsets.only(top: showTopThread ? 0 : 10),
                child: Stack(
                  children: [
                    ThreadLine(
                      showBottomThread: showBottomThread,
                      showTopThread: showTopThread,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isDependency)
                            Container(
                              margin: EdgeInsets.only(
                                top: showTopThread ? 20 : 0,
                                left: 5,
                              ),
                              child: _VoteColumn(
                                communityNote: communityNote,
                                numberFormat: numberFormat,
                              ),
                            ),
                          SizedBox(width: 10),
                          Flexible(
                            child: Container(
                              margin: EdgeInsets.only(
                                top: showTopThread ? 20 : 0,
                                right: 15,
                                bottom: 10,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            ProfileImage(
                                              userId: communityNote.author.id,
                                              username:
                                                  communityNote.author.username,
                                              imageUrl:
                                                  communityNote.author.image,
                                              navigateToProfile: true,
                                            ),
                                            SizedBox(width: 10),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ProfileName(
                                                  name:
                                                      communityNote.author.name,
                                                  username: communityNote
                                                      .author
                                                      .username,
                                                ),
                                                Text(
                                                  '${timeFormat.format(communityNote.publishedAt)} • '
                                                  '${dateFormat.format(communityNote.publishedAt)}',
                                                  style: TextStyle(
                                                    color: Theme.of(
                                                      context,
                                                    ).disabledColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      PostBody(
                                        post: communityNote,
                                        showWholeText: showWholeText,
                                        isDependency: isDependency,
                                      ),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                  if (!isDependency)
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '${numberFormat.format(communityNote.replies)} ${communityNote.replies == 1 ? 'Comment' : 'Comments'}',
                                            style: TextStyle(
                                              color:
                                                  communityNote
                                                      .author
                                                      .hasBlocked
                                                  ? Theme.of(
                                                      context,
                                                    ).disabledColor
                                                  : Theme.of(
                                                      context,
                                                    ).colorScheme.outline,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              RepostButton(post: communityNote),
                                              SizedBox(width: 20),
                                              BookmarkButton(
                                                post: communityNote,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (!isDependency)
            Align(
              alignment: Alignment.topRight,
              child: PostPopUp(post: communityNote),
            ),
        ],
      ),
    );
  }
}

class _VoteColumn extends StatelessWidget {
  const _VoteColumn({required this.communityNote, required this.numberFormat});

  final Post communityNote;
  final NumberFormat numberFormat;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final score = communityNote.upvotes - communityNote.downvotes;

    return Container(
      margin: EdgeInsets.only(left: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _VoteButton(
            icon: Icons.keyboard_arrow_up_rounded,
            isActive: communityNote.isUpvoted,
            activeColor: Colors.blue,
            onTap: () {
              context.read<PostDetailBloc>().add(
                PostDetailEvent.upvote(post: communityNote),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              numberFormat.format(score),
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: score > 0
                    ? Colors.blue
                    : score < 0
                    ? Colors.orange
                    : colorScheme.onSurface,
              ),
            ),
          ),
          _VoteButton(
            icon: Icons.keyboard_arrow_down_rounded,
            isActive: communityNote.isDownvoted,
            activeColor: Colors.orange,
            onTap: () {
              context.read<PostDetailBloc>().add(
                PostDetailEvent.downvote(post: communityNote),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _VoteButton extends StatelessWidget {
  const _VoteButton({
    required this.icon,
    required this.isActive,
    required this.activeColor,
    required this.onTap,
  });

  final IconData icon;
  final bool isActive;
  final Color activeColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: isActive
              ? activeColor.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 28,
          color: isActive ? activeColor : colorScheme.onSurfaceVariant,
        ),
      ),
    );
  }
}
