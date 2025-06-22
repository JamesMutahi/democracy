import 'package:democracy/app/bloc/profile/profile_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/models/profile.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/app/utils/view/loading_indicator.dart';
import 'package:democracy/auth/models/user.dart';
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
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          switch (state) {
            case ProfileLoaded():
              Profile profile = state.profile;
              return Column(
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
                            InkWell(
                              borderRadius: BorderRadius.all(
                                Radius.circular(50),
                              ),
                              onTap: () {
                                //   TODO:
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Icon(Symbols.edit_rounded),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text('${user.firstName} ${user.lastName}'),
                        SizedBox(height: 10),
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
                              children: [
                                SizedBox(height: 10),
                                Text(user.status),
                              ],
                            )
                            : SizedBox.shrink(),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            // TODO: Open page to view following and followers
                            Text('${profile.following.length} Following'),
                            SizedBox(width: 10),
                            Text(
                              '${profile.followers.length} ${(profile.followers.length == 1) ? 'Follower' : 'Followers'}',
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
                                PostList(
                                  key: UniqueKey(),
                                  posts: profile.posts,
                                ),
                                PostList(
                                  key: UniqueKey(),
                                  posts: profile.replies,
                                ),
                                PostList(
                                  key: UniqueKey(),
                                  posts: profile.likedPosts,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            case ProfileFailure():
              return FailureRetryButton(
                onPressed: () {
                  context.read<ProfileCubit>().retryButtonPressed();
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.loadProfile(user: user),
                  );
                },
              );
            default:
              return const LoadingIndicator();
          }
        },
      ),
    );
  }
}
