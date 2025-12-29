import 'package:democracy/app/utils/custom_text.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_detail.dart';
import 'package:democracy/post/view/widgets/buttons.dart';
import 'package:democracy/post/view/community_notes.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/image_viewer.dart';
import 'package:democracy/post/view/widgets/post_body.dart';
import 'package:democracy/post/view/widgets/post_widget_selector.dart';
import 'package:democracy/post/view/widgets/time_difference.dart';
import 'package:democracy/post/view/widgets/thread.dart';
import 'package:democracy/post/view/widgets/thread_line.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/profile.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

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
    this.showWholeThread = false,
  });

  final Post post;
  final bool checkVisibility;
  final bool isDependency;
  final bool hideBorder;
  final bool showThreadedReplies;
  final bool showTopThread;
  final bool showBottomThread;
  final bool showWholeThread;

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PostDetail(
                      key: ValueKey(post.id),
                      post: showAsRepost ? post.repostOf! : post,
                      showAsRepost: showAsRepost,
                      repost: post,
                    ),
                  ),
                );
              },
              child: showAsRepost
                  ? Column(
                      children: [
                        _repostBanner(),
                        post.repostOf!.communityNoteOf == null
                            ? _PostContainer(
                                post: post.repostOf!,
                                isDependency: false,
                              )
                            : CommunityNoteTile(
                                communityNote: post.repostOf!,
                                navigateToDetailPage: true,
                                showWholeText: false,
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
                        _PostContainer(post: post, isDependency: isDependency),
                      ],
                    ),
            ),
            if (showThreadedReplies)
              Thread(
                key: ValueKey(post.id),
                post: post,
                showWholeThread: showWholeThread,
              ),
          ],
        ),
      ),
    );
  }

  Widget _repostBanner() {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) user = state.user;
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
  const _PostContainer({required this.post, required this.isDependency});

  final Post post;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10, right: 15, top: 10, bottom: 5),
          child: post.isDeleted
              ? PostDeletedWidget()
              : Row(
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
                          PostBody(post: post),
                          if (post.image1Url != null)
                            SizedBox(
                              height: 200,
                              child: ImageViewer(post: post),
                            ),
                          if (post.repostOf != null && !isDependency)
                            DependencyContainer(
                              child: PostWidgetSelector(
                                post: post.repostOf!,
                                isDependency: true,
                              ),
                            ),
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
                          SizedBox(height: 5),
                          if (post.communityNote.isNotEmpty)
                            CommunityNote(post: post),
                          SizedBox(height: 5),
                          if (!isDependency)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ReplyButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                RepostButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                LikeButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                BookmarkButton(
                                  post: post,
                                  numberFormat: numberFormat,
                                ),
                                ViewsButton(
                                  post: post,
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
        if (!isDependency)
          Align(
            alignment: Alignment.topRight,
            child: PostPopUp(post: post),
          ),
      ],
    );
  }
}

class PostDeletedWidget extends StatelessWidget {
  const PostDeletedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('This post was deleted by the author'),
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
      margin: EdgeInsets.symmetric(vertical: 5),
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
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CommunityNotes(post: widget.post),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).disabledColor.withAlpha(30),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
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
            ),
          ],
        ),
      ),
    );
  }
}
