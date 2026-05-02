import 'package:democracy/app/shared/widgets/asset_viewer.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/map_widget.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/constitution/view/section_tile.dart';
import 'package:democracy/meeting/view/widgets/meeting_tile.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/post/view/widgets/time_difference.dart';
import 'package:democracy/post/view/widgets/thread.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/utils/profile_navigator.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.post,
    this.checkVisibility = false,
    this.isDependency = false,
    this.hideBorder = false,
    this.showThreadedReplies = false,
    this.showTopThread = false,
    this.showBottomThread = false,
    this.onViewed,
    this.isExpanded,
    this.onExpand,
    this.onThreadUpdated,
  });

  final Post post;
  final bool checkVisibility;
  final bool isDependency;
  final bool hideBorder;
  final bool showThreadedReplies;
  final bool showTopThread;
  final bool showBottomThread;
  final VoidCallback? onViewed;
  final bool? isExpanded;
  final Function(Post)? onExpand;
  final Function(Post)? onThreadUpdated;

  @override
  Widget build(BuildContext context) {
    bool showAsRepost = post.body.isEmpty && post.repostOf != null;
    bool visible = true;
    if (checkVisibility && !isDependency) {
      if (post.author.isBlocked || post.author.isMuted) {
        visible = false;
      }
    }
    return Visibility(
      visible: visible,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: isDependency || hideBorder
                ? BorderSide.none
                : BorderSide(
                    color: Theme.of(context).disabledColor.withAlpha(30),
                  ),
          ),
        ),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                post.repostOf?.communityNoteOf == null
                    ? navigateToPostDetail(
                        context: context,
                        post: showAsRepost ? post.repostOf! : post,
                        showAsRepost: showAsRepost,
                        repost: post,
                      )
                    : navigateToCommunityNoteDetail(
                        context: context,
                        post: showAsRepost ? post.repostOf! : post,
                        showAsRepost: showAsRepost,
                        repost: post,
                      );
              },
              child: showAsRepost
                  ? Column(
                      children: [
                        _repostBanner(),
                        PostWidgetSelector(
                          post: post.repostOf!,
                          isDependency: false,
                        ),
                      ],
                    )
                  : Stack(
                      children: [
                        ThreadLine(
                          showBottomThread: showBottomThread,
                          showTopThread: showTopThread,
                        ),
                        _PostContainer(
                          post: post,
                          isDependency: isDependency,
                          onViewed: onViewed,
                        ),
                      ],
                    ),
            ),
            if (showThreadedReplies)
              Thread(
                reply: post,
                isExpanded: isExpanded!,
                onExpand: onExpand!,
                onThreadUpdated: onThreadUpdated!,
              ),
          ],
        ),
      ),
    );
  }

  Widget _repostBanner() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        User user = state.user!;
        String text = user.id == post.author.id
            ? 'You reposted'
            : '${post.author.name} reposted';
        if (post.repostOf!.communityNoteOf != null) {
          text = '$text a community note';
        }
        return Container(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Row(
            children: [
              Icon(
                Symbols.loop_rounded,
                color: Theme.of(context).colorScheme.outline,
                size: 17,
              ),
              const SizedBox(width: 5),
              Text(
                text,
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PostContainer extends StatelessWidget {
  const _PostContainer({
    required this.post,
    required this.isDependency,
    required this.onViewed,
  });

  final Post post;
  final bool isDependency;
  final VoidCallback? onViewed;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${post.id}'),
      onVisibilityChanged: (visibilityInfo) {
        var visibilityPercentage = visibilityInfo.visibleFraction * 100;
        if (visibilityPercentage == 100) {
          onViewed?.call();
        }
      },
      child: Stack(
        children: [
          post.isDeleted
              ? PostDeletedWidget()
              : Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 15,
                    top: 10,
                    bottom: isDependency ? 10 : 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PostAuthorProfile(
                        isDependency: isDependency,
                        author: post.author,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileName(user: post.author),
                                if (!isDependency)
                                  Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: TimeDifferenceInfo(
                                      publishedAt: post.publishedAt,
                                    ),
                                  ),
                              ],
                            ),
                            PostBody(post: post, isDependency: isDependency),
                            if (post.assets.isNotEmpty)
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: AssetViewer(
                                  key: ValueKey(post.id),
                                  assets: post.assets,
                                  onTap: () {
                                    context.read<PostDetailBloc>().add(
                                      PostDetailEvent.addClick(post: post),
                                    );
                                  },
                                ),
                              ),
                            if (post.location != null)
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: MapWidget(mapCenter: post.location!),
                              ),
                            if (post.repostOf != null && !isDependency)
                              PostDependency(post: post),
                            if (post.ballot != null)
                              DependencyContainer(
                                child: BallotTile(
                                  ballot: post.ballot!,
                                  isDependency: true,
                                ),
                              ),
                            if (post.survey != null)
                              DependencyContainer(
                                child: SurveyTile(
                                  survey: post.survey!,
                                  isDependency: true,
                                ),
                              ),
                            if (post.petition != null)
                              DependencyContainer(
                                child: PetitionTile(
                                  petition: post.petition!,
                                  isDependency: true,
                                ),
                              ),
                            if (post.meeting != null)
                              DependencyContainer(
                                child: MeetingTile(
                                  meeting: post.meeting!,
                                  isDependency: true,
                                ),
                              ),
                            if (post.section != null)
                              DependencyContainer(
                                child: SectionTile(
                                  section: post.section!,
                                  isDependency: true,
                                ),
                              ),
                            if (post.communityNote.isNotEmpty)
                              CommunityNote(post: post),
                            if (!isDependency)
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ReplyButton(post: post),
                                    RepostButton(post: post),
                                    LikeButton(post: post),
                                    BookmarkButton(post: post),
                                    ViewsButton(post: post),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
          if (!isDependency && !post.isDeleted)
            Align(
              alignment: Alignment.topRight,
              child: PostPopUp(post: post),
            ),
        ],
      ),
    );
  }
}

class PostDeletedWidget extends StatelessWidget {
  const PostDeletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        child: Text('This post was deleted by the author'),
      ),
    );
  }
}

class PostDependency extends StatelessWidget {
  const PostDependency({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return DependencyContainer(
      child: post.repostOf!.isDeleted
          ? PostDeletedWidget()
          : PostWidgetSelector(
              key: ValueKey('repost ${post.repostOf!.id}'),
              post: post.repostOf!,
              isDependency: true,
            ),
    );
  }
}

class DependencyContainer extends StatelessWidget {
  const DependencyContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor.withAlpha(30),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }
}

class CommunityNote extends StatefulWidget {
  const CommunityNote({super.key, required this.post});

  final Post post;

  @override
  State<CommunityNote> createState() => _CommunityNoteState();
}

class _CommunityNoteState extends State<CommunityNote> {
  String suffix = '...Show more';
  bool readMore = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).disabledColor.withAlpha(30),
        ),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: InkWell(
        onTap: () {
          navigateToCommunityNotes(context: context, post: widget.post);
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.people_rounded, color: Colors.blueAccent),
                  SizedBox(width: 5),
                  Text(
                    'Community note',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(),
              CustomText(
                text: widget.post.communityNote,
                style: Theme.of(context).textTheme.bodyMedium!,
                suffix: suffix,
                showAllText: readMore,
                onSuffixPressed: () {
                  setState(() {
                    if (readMore) {
                      suffix = '...Show more';
                      readMore = false;
                    } else {
                      suffix = '\nShow less';
                      readMore = true;
                    }
                  });
                },
                onUserTagPressed: (userId) {
                  navigateToProfilePage(
                    context: context,
                    user: widget.post.taggedUsers.firstWhere(
                      (user) => user.id == int.parse(userId),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
