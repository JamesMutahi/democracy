import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_cubit.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/user/view/edit_profile.dart';
import 'package:democracy/user/view/following.dart';
import 'package:democracy/user/view/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.user});

  final User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  late User user = widget.user;
  bool failure = false;
  bool loading = true;
  bool nameIsScrolled = false;
  double expandedHeight = 200;
  bool hideTabs = true;

  @override
  void initState() {
    // Retrieve and subscribe to user
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getUser(user: widget.user),
    );
    super.initState();
    _scrollController.addListener(_handleScrolling);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  void _handleScrolling() {
    if (_scrollController.offset > expandedHeight && nameIsScrolled == false) {
      setState(() {
        nameIsScrolled = true;
      });
    }
    if (_scrollController.offset < expandedHeight && nameIsScrolled == true) {
      setState(() {
        nameIsScrolled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<UserDetailCubit, UserDetailState>(
          listener: (context, state) {
            if (state is UserLoaded) {
              if (widget.user.id == state.user.id) {
                setState(() {
                  user = state.user;
                  if (state.user.isBlocked) {
                    if (hideTabs == false) {
                      hideTabs = true;
                    }
                  } else {
                    hideTabs = false;
                  }
                });
              }
            }
            if (state is UserUpdated) {
              if (widget.user.id == state.user.id) {
                setState(() {
                  user = state.user;
                  if (state.user.isBlocked) {
                    if (hideTabs == false) {
                      hideTabs = true;
                    }
                  } else {
                    hideTabs = false;
                  }
                });
              }
            }
          },
        ),
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state is WebsocketConnected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.getUser(user: widget.user),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          late User currentUser;
          if (state is Authenticated) {
            currentUser = state.user;
          }
          bool isCurrentUser = currentUser.id == user.id;
          return BlocListener<ChatDetailCubit, ChatDetailState>(
            listener: (context, state) {
              if (state is ChatCreated) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder:
                        (context) => ChatDetail(
                          key: ValueKey(state.chat.id),
                          chat: state.chat,
                        ),
                  ),
                );
              }
            },
            child: PopScope(
              canPop: true,
              onPopInvokedWithResult: (_, __) {
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.unsubscribeUserProfilePosts(user: user),
                );
              },
              child: SafeArea(
                child: Scaffold(
                  body: DefaultTabController(
                    length: 4,
                    child: NestedScrollView(
                      controller: _scrollController,
                      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                        return [
                          SliverPersistentHeader(
                            pinned: true,
                            floating: true,
                            delegate: ProfileAppBarDelegate(
                              user: user,
                              isCurrentUser: isCurrentUser,
                              nameIsScrolled: nameIsScrolled,
                              expandedHeight: expandedHeight,
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: _UserDetails(user, isCurrentUser),
                          ),
                          if (!hideTabs || !user.isBlocked)
                            SliverPersistentHeader(
                              delegate: _TabBarAppBarDelegate(
                                TabBar(
                                  tabs: [
                                    Tab(text: 'Posts'),
                                    Tab(text: 'Replies'),
                                    Tab(text: 'Likes'),
                                    Tab(text: 'Media'),
                                  ],
                                ),
                              ),
                              pinned: true,
                            ),
                        ];
                      },
                      body:
                          (hideTabs && user.isBlocked)
                              ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '@${user.username} is blocked',
                                      style:
                                          Theme.of(
                                            context,
                                          ).textTheme.titleLarge,
                                    ),
                                    SizedBox(height: 10),
                                    OutlinedButton(
                                      onPressed: () {
                                        setState(() {
                                          hideTabs = false;
                                        });
                                      },
                                      child: Text('View posts'),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Will not unblock them',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.labelMedium?.copyWith(
                                        color:
                                            Theme.of(
                                              context,
                                            ).colorScheme.outline,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  UserPosts(key: ValueKey(user.id), user: user),
                                  UserReplies(
                                    key: ValueKey(user.id),
                                    user: user,
                                  ),
                                  Likes(key: ValueKey(user.id), user: user),
                                  Media(key: ValueKey(user.id), user: user),
                                ],
                              ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProfileAppBarDelegate extends SliverPersistentHeaderDelegate {
  final User user;
  final bool isCurrentUser;
  final double expandedHeight;
  final bool nameIsScrolled;
  final double extraHeight;

  ProfileAppBarDelegate({
    required this.user,
    required this.isCurrentUser,
    required this.expandedHeight,
    required this.nameIsScrolled,
    this.extraHeight = 50,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 2 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      // color: Colors.red,
      height: expandedHeight + extraHeight,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              elevation: 0.0,
              leading: _ButtonContainer(
                nameIsScrolled: nameIsScrolled,
                child: BackButton(),
              ),
              actions: [
                _ButtonContainer(
                  nameIsScrolled: nameIsScrolled,
                  child: _ProfilePopUpMenu(
                    user: user,
                    isCurrentUser: isCurrentUser,
                  ),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar.createSettings(
                currentExtent: 0.0,
                child: FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    duration: Duration(milliseconds: 300),
                    opacity: nameIsScrolled ? 1.0 : 0.0,
                    child: Text(user.name),
                  ),
                  background: Opacity(
                    opacity: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(user.coverPhoto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 15.0,
            // right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: -50.0,
            child: Opacity(
              opacity: percent,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                child: CircleAvatar(
                  radius: 45,
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
              ),
            ),
          ),
          Positioned(
            // left: 0.0,
            right: 15.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: -110.0,
            child: Opacity(
              opacity: percent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isCurrentUser
                      ? OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfile(user: user),
                            ),
                          );
                        },
                        child: Text('Edit profile'),
                      )
                      : Row(
                        children: [
                          user.isBlocked
                              ? OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: Colors.red),
                                ),
                                onPressed: () {
                                  context.read<WebsocketBloc>().add(
                                    WebsocketEvent.blockUser(user: user),
                                  );
                                },
                                child: Text(
                                  'Blocked',
                                  style: TextStyle(color: Colors.red),
                                ),
                              )
                              : Row(
                                children: [
                                  if (user.isMuted && !user.isBlocked)
                                    Row(
                                      children: [
                                        ProfileButton(
                                          icon: Icon(
                                            Symbols.volume_off_rounded,
                                            color: Colors.red,
                                          ),

                                          onTap: () {
                                            context.read<WebsocketBloc>().add(
                                              WebsocketEvent.muteUser(
                                                user: user,
                                              ),
                                            );
                                          },
                                        ),
                                        SizedBox(width: 7),
                                      ],
                                    ),
                                  ProfileButton(
                                    icon: Icon(Symbols.email_rounded),
                                    onTap:
                                        user.hasBlocked
                                            ? () {
                                              final snackBar = getSnackBar(
                                                context: context,
                                                message: 'Blocked',
                                                status: SnackBarStatus.failure,
                                              );
                                              ScaffoldMessenger.of(
                                                context,
                                              ).showSnackBar(snackBar);
                                            }
                                            : () {
                                              context.read<WebsocketBloc>().add(
                                                WebsocketEvent.createChat(
                                                  user: user,
                                                ),
                                              );
                                            },
                                  ),
                                  SizedBox(width: 7),
                                  OutlinedButton(
                                    onPressed: () {
                                      context.read<WebsocketBloc>().add(
                                        WebsocketEvent.followUser(user: user),
                                      );
                                    },
                                    child: Text(
                                      user.isFollowed ? 'Unfollow' : 'Follow',
                                    ),
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
    );
  }

  @override
  double get maxExtent => expandedHeight + extraHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _TabBarAppBarDelegate extends SliverPersistentHeaderDelegate {
  _TabBarAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_TabBarAppBarDelegate oldDelegate) {
    return false;
  }
}

class _ButtonContainer extends StatelessWidget {
  const _ButtonContainer({required this.child, required this.nameIsScrolled});

  final Widget child;
  final bool nameIsScrolled;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:
            nameIsScrolled
                ? Colors.transparent
                : Theme.of(
                  context,
                ).scaffoldBackgroundColor.withValues(alpha: 0.5),
      ),
      child: child,
    );
  }
}

class _ProfilePopUpMenu extends StatelessWidget {
  const _ProfilePopUpMenu({required this.user, required this.isCurrentUser});

  final User user;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    List texts =
        isCurrentUser
            ? ['Share']
            : [
              'Share',
              user.isMuted ? 'Unmute' : 'Mute',
              user.isBlocked ? 'Unblock' : 'Block',
            ];
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      menuPadding: EdgeInsets.zero,
      onSelected: (selected) {
        switch (selected) {
          case 'Share':
            //   TODO: Create link for sharing
            break;
          case 'Mute':
            showDialog(
              context: context,
              builder:
                  (context) => ProfileDialog(
                    title: 'Mute @${user.username}?',
                    content:
                        'You will not see their posts on your timeline. '
                        'You will continue receiving notifications. '
                        'They will not know they have been muted.',
                    onYesPressed: () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.muteUser(user: user),
                      );
                    },
                  ),
            );
          case 'Unmute':
            context.read<WebsocketBloc>().add(
              WebsocketEvent.muteUser(user: user),
            );
          case 'Block':
            showDialog(
              context: context,
              builder:
                  (context) => ProfileDialog(
                    title: 'Block @${user.username}?',
                    content:
                        'They will no longer be able to engage with your posts '
                        'or message you. You will also not receive '
                        'notifications from them.',
                    onYesPressed: () {
                      context.read<WebsocketBloc>().add(
                        WebsocketEvent.blockUser(user: user),
                      );
                    },
                  ),
            );
          case 'Unblock':
            context.read<WebsocketBloc>().add(
              WebsocketEvent.blockUser(user: user),
            );
        }
      },
      itemBuilder:
          (BuildContext context) => [
            ...texts.map((text) {
              return PopupMenuItem<String>(
                value: text,
                child: Text(text, textAlign: TextAlign.center),
              );
            }),
          ],
      icon: Icon(Symbols.more_vert_rounded),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key, required this.icon, required this.onTap});

  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Theme.of(context).colorScheme.outline),
        ),
        child: icon,
      ),
    );
  }
}

class _UserDetails extends StatelessWidget {
  const _UserDetails(this.user, this.isCurrentUser);

  final User user;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    var dateFormat = DateFormat('dd/MM/yyyy');
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(user.name, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 5),
          Text(
            '@${user.username}',
            style: TextStyle(color: Theme.of(context).disabledColor),
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
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
              Text(
                dateFormat.format(user.dateJoined),
                style: TextStyle(color: Theme.of(context).disabledColor),
              ),
            ],
          ),
          (user.status.isNotEmpty)
              ? Column(children: [SizedBox(height: 5), Text(user.status)])
              : SizedBox.shrink(),
          SizedBox(height: 5),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Following()),
              );
            },
            child: Row(
              children: [
                Text('${user.following} Following'),
                SizedBox(width: 10),
                Text(
                  '${user.followers} ${(user.followers == 1) ? 'Follower' : 'Followers'}',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onYesPressed,
  });

  final String title;
  final String content;
  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Text(content, textAlign: TextAlign.center),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            onYesPressed();
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}
