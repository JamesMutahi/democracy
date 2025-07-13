import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/post/bloc/likes/likes_cubit.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_cubit.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_cubit.dart';
import 'package:democracy/post/view/post_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd/MM/yyyy');
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User currentUser;
        if (state is Authenticated) {
          currentUser = state.user;
        }
        return BlocListener<ChatDetailCubit, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) => ChatDetail(
                        chat: state.chat,
                        currentUser: currentUser,
                        otherUser: user,
                      ),
                ),
              );
            }
          },
          child: Scaffold(
            appBar: AppBar(title: Text('Profile')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 40,
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(user.image),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          (currentUser.id == user.id)
                              ? InkWell(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                onTap: () {
                                  //   TODO:
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(Symbols.edit_rounded),
                                ),
                              )
                              : InkWell(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(50),
                                ),
                                onTap: () {
                                  context.read<WebsocketBloc>().add(
                                    WebsocketEvent.createChat(user: user),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Icon(Symbols.email_rounded),
                                ),
                              ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text(
                        user.displayName,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      SizedBox(height: 5),
                      Text(
                        user.name,
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Symbols.calendar_month_rounded,
                            size: 17,
                            color: Theme.of(context).disabledColor,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Joined ',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                          Text(
                            dateFormat.format(user.dateJoined),
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ],
                      ),
                      (user.status.isNotEmpty)
                          ? Column(
                            children: [SizedBox(height: 5), Text(user.status)],
                          )
                          : SizedBox.shrink(),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          // TODO: Open page to view following and followers
                          Text('${user.following} Following'),
                          SizedBox(width: 10),
                          Text(
                            '${user.followers} ${(user.followers == 1) ? 'Follower' : 'Followers'}',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 3,
                  child: Expanded(
                    child: Column(
                      children: [
                        const TabBar(
                          tabs: [
                            Tab(text: 'Posts'),
                            Tab(text: 'Replies'),
                            Tab(text: 'Likes'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                          child: TabBarView(
                            children: [
                              UserPosts(key: UniqueKey(), user: user),
                              UserReplies(key: UniqueKey(), user: user),
                              Likes(key: UniqueKey(), user: user),
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
        );
      },
    );
  }
}

class UserPosts extends StatefulWidget {
  const UserPosts({super.key, required this.user});

  final User user;

  @override
  State<UserPosts> createState() => _UserPostsState();
}

class _UserPostsState extends State<UserPosts> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.loadUserPosts(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPostsCubit, UserPostsState>(
      builder: (context, state) {
        switch (state) {
          case UserPostsLoaded(:final posts):
            return PostList(key: UniqueKey(), posts: posts);
          case UserPostsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.loadUserPosts(user: widget.user),
                );
              },
            );
          default:
            return LoadingIndicator();
        }
      },
    );
  }
}

class UserReplies extends StatefulWidget {
  const UserReplies({super.key, required this.user});

  final User user;

  @override
  State<UserReplies> createState() => _UserRepliesState();
}

class _UserRepliesState extends State<UserReplies> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.loadUserReplies(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserRepliesCubit, UserRepliesState>(
      builder: (context, state) {
        switch (state) {
          case UserRepliesLoaded(:final posts):
            return PostList(key: UniqueKey(), posts: posts);
          case UserPostsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.loadUserPosts(user: widget.user),
                );
              },
            );
          default:
            return LoadingIndicator();
        }
      },
    );
  }
}

class Likes extends StatefulWidget {
  const Likes({super.key, required this.user});

  final User user;

  @override
  State<Likes> createState() => _LikesState();
}

class _LikesState extends State<Likes> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.loadLikedPosts(user: widget.user),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikesCubit, LikesState>(
      builder: (context, state) {
        switch (state) {
          case LikesLoaded(:final posts):
            return PostList(key: UniqueKey(), posts: posts);
          case UserPostsFailure():
            return FailureRetryButton(
              onPressed: () {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.loadUserPosts(user: widget.user),
                );
              },
            );
          default:
            return LoadingIndicator();
        }
      },
    );
  }
}
