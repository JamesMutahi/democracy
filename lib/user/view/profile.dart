import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/petition/bloc/user_petitions/user_petitions_bloc.dart';
import 'package:democracy/post/bloc/likes/likes_bloc.dart';
import 'package:democracy/post/bloc/user_community_notes/user_community_notes_bloc.dart';
import 'package:democracy/post/bloc/user_posts/user_posts_bloc.dart';
import 'package:democracy/post/bloc/user_replies/user_replies_bloc.dart';
import 'package:democracy/user/bloc/profile/profile_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_buttons.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/tabs.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

const List<Tab> tabs = <Tab>[
  Tab(text: 'Posts'),
  Tab(text: 'Replies'),
  Tab(text: 'Community notes'),
  Tab(text: 'Petitions'),
];

const List<Tab> userTabs = <Tab>[
  Tab(text: 'Posts'),
  Tab(text: 'Replies'),
  Tab(text: 'Likes'),
  Tab(text: 'Community notes'),
  Tab(text: 'Petitions'),
];

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, @PathParam('username') required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfileBloc(webSocketService: context.read<WebSocketService>())
            ..add(ProfileEvent.load(username: username)),
      child: MainContainer(
        child: Scaffold(
          body: BlocBuilder<ProfileBloc, ProfileState>(
            buildWhen: (previous, current) => current.username == username,
            builder: (context, state) {
              if (state.status == ProfileStatus.initial ||
                  (state.status == ProfileStatus.loading &&
                      state.user == null)) {
                return const BottomLoader();
              }
              if (state.status == ProfileStatus.failure && state.user == null) {
                return Scaffold(
                  appBar: AppBar(
                    leading: const AutoLeadingButton(),
                    title: const Text('Profile'),
                  ),
                  body: FailureRetryButton(
                    onPressed: () {
                      context.read<ProfileBloc>().add(
                        ProfileEvent.load(username: username),
                      );
                    },
                  ),
                );
              }
              if (state.status == ProfileStatus.notFound) {
                return Scaffold(
                  appBar: AppBar(
                    leading: const AutoLeadingButton(),
                    title: const Text('Profile'),
                  ),
                  body: const Center(
                    child: Text('This account does not exist'),
                  ),
                );
              }
              return _Profile(user: state.user!);
            },
          ),
        ),
      ),
    );
  }
}

class _Profile extends StatefulWidget {
  const _Profile({required this.user});

  final User user;

  @override
  State<_Profile> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<_Profile>
    with SingleTickerProviderStateMixin {
  final ScrollController _mobileScrollController = ScrollController();
  final ScrollController _webScrollController = ScrollController();

  bool _nameIsScrolled = false;
  final double _expandedHeight = 200;
  bool _hideTabs = true;

  @override
  void initState() {
    super.initState();
    final me = context.read<AuthBloc>().state.user!;
    if (me.id != widget.user.id) {
      context.read<UserDetailBloc>().add(
        UserDetailEvent.addVisit(user: widget.user),
      );
    }

    _mobileScrollController.addListener(_handleScrolling);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        final isWebLayout =
            kIsWeb && ResponsiveBreakpoints.of(context).largerThan(MOBILE);
        if (isWebLayout) {
          ActiveScrollController.activate(_webScrollController);
        }
      }
    });
  }

  void _loadUser() {
    context.read<ProfileBloc>().add(
      ProfileEvent.load(username: widget.user.username),
    );
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_webScrollController);
    _mobileScrollController.removeListener(_handleScrolling);
    _webScrollController.dispose();
    _mobileScrollController.dispose();
    super.dispose();
  }

  void _handleScrolling() {
    if (!_mobileScrollController.hasClients) return;
    if (_mobileScrollController.offset > _expandedHeight &&
        _nameIsScrolled == false) {
      setState(() => _nameIsScrolled = true);
    }
    if (_mobileScrollController.offset < _expandedHeight &&
        _nameIsScrolled == true) {
      setState(() => _nameIsScrolled = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    User currentUser = context.read<AuthBloc>().state.user!;
    bool isCurrentUser = currentUser.id == widget.user.id;

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              UserPostsBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (_) => UserRepliesBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
        BlocProvider(
          create: (_) =>
              LikesBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (_) => UserCommunityNotesBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
        BlocProvider(
          create: (_) => UserPetitionsBloc(
            webSocketService: context.read<WebSocketService>(),
          ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserDetailBloc, UserDetailState>(
            listener: (context, state) {
              if (state is UserSubscribed && widget.user.id == state.user.id) {
                context.read<ProfileBloc>().add(
                  ProfileEvent.updated(user: state.user),
                );
                setState(() => _hideTabs = state.user.isBlocked);
              }
              if (state is UserUpdated && widget.user.id == state.user.id) {
                context.read<ProfileBloc>().add(
                  ProfileEvent.updated(user: state.user),
                );
                setState(() => _hideTabs = state.user.isBlocked);
              }
            },
          ),
          BlocListener<WebsocketBloc, WebsocketState>(
            listener: (context, state) {
              if (state.status == WebsocketStatus.connected) _loadUser();
            },
          ),
          BlocListener<ChatDetailBloc, ChatDetailState>(
            listener: (context, state) {
              if (state is ChatCreated && state.userId == widget.user.id) {
                context.router.push(ChatDetail(chatId: state.chat.id));
              }
            },
          ),
        ],
        child: PopScope(
          canPop: true,
          onPopInvokedWithResult: (_, _) {
            context.read<UserDetailBloc>().add(
              UserDetailEvent.unsubscribe(user: widget.user),
            );
          },
          child: isWebLayout
              ? _buildWebLayout()
              : _buildMobileLayout(isCurrentUser),
        ),
      ),
    );
  }

  Widget _buildWebLayout() {
    User currentUser = context.read<AuthBloc>().state.user!;
    bool isCurrentUser = currentUser.id == widget.user.id;

    final activeRoutes = isCurrentUser
        ? const [
            ProfilePostsTab(),
            ProfileRepliesTab(),
            ProfileLikesTab(),
            ProfileNotesTab(),
            ProfilePetitionsTab(),
          ]
        : const [
            ProfilePostsTab(),
            ProfileRepliesTab(),
            ProfileNotesTab(),
            ProfilePetitionsTab(),
          ];

    final activeTabs = isCurrentUser ? userTabs : tabs;

    return Scaffold(
      appBar: AppBar(
        leading: const AutoLeadingButton(),
        title: Text(
          widget.user.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        actions: [
          _ProfilePopUpMenu(
            user: widget.user,
            isCurrentUser: isCurrentUser,
            nameIsScrolled: true,
          ),
        ],
      ),
      body: !_hideTabs || !widget.user.isBlocked
          ? AutoTabsRouter.tabBar(
              routes: activeRoutes,
              builder: (context, child, controller) {
                return NestedScrollView(
                  controller: _webScrollController,
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      SliverToBoxAdapter(
                        child: Column(
                          children: [
                            _ProfileHeader(
                              user: widget.user,
                              isCurrentUser: isCurrentUser,
                            ),
                            _UserDetails(widget.user, isCurrentUser),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        delegate: _SliverAppBarDelegate(
                          child: Container(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            child: TabBar(
                              controller: controller,
                              isScrollable: true,
                              tabAlignment: TabAlignment.center,
                              labelStyle: Theme.of(
                                context,
                              ).textTheme.titleMedium,
                              dividerColor: Theme.of(
                                context,
                              ).colorScheme.outlineVariant,
                              tabs: activeTabs,
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  body: child,
                );
              },
            )
          : Column(
              children: [
                _ProfileHeader(user: widget.user, isCurrentUser: isCurrentUser),
                _UserDetails(widget.user, isCurrentUser),
                Expanded(child: _buildBlockedView()),
              ],
            ),
    );
  }

  Widget _buildMobileLayout(bool isCurrentUser) {
    return SafeArea(
      bottom: false,
      child: DefaultTabController(
        length: isCurrentUser ? userTabs.length : tabs.length,
        child: NestedScrollView(
          controller: _mobileScrollController,
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: ProfileAppBarDelegate(
                  user: widget.user,
                  isCurrentUser: isCurrentUser,
                  nameIsScrolled: _nameIsScrolled,
                  expandedHeight: _expandedHeight,
                ),
              ),
              SliverToBoxAdapter(
                child: _UserDetails(widget.user, isCurrentUser),
              ),
              if (!_hideTabs || !widget.user.isBlocked)
                SliverPersistentHeader(
                  delegate: _TabBarAppBarDelegate(
                    TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.center,
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      dividerColor: Theme.of(
                        context,
                      ).colorScheme.outlineVariant,
                      tabs: isCurrentUser ? userTabs : tabs,
                    ),
                  ),
                  pinned: true,
                ),
            ];
          },
          body: _buildTabBarView(isCurrentUser),
        ),
      ),
    );
  }

  Widget _buildTabBarView(bool isCurrentUser) {
    if (_hideTabs && widget.user.isBlocked) return _buildBlockedView();

    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        UserPosts(key: ValueKey(widget.user.id), user: widget.user),
        UserReplies(key: ValueKey(widget.user.id), user: widget.user),
        if (isCurrentUser)
          Likes(key: ValueKey(widget.user.id), user: widget.user),
        UserCommunityNotes(key: ValueKey(widget.user.id), user: widget.user),
        UserPetitions(key: ValueKey(widget.user.id), user: widget.user),
      ],
    );
  }

  Widget _buildBlockedView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '@${widget.user.username} is blocked',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          OutlinedButton(
            onPressed: () => setState(() => _hideTabs = false),
            child: const Text('View posts'),
          ),
          const SizedBox(height: 10),
          Text(
            'Will not unblock them',
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverAppBarDelegate({required this.child});

  @override
  double get minExtent => 48.0; // Standard TabBar height
  @override
  double get maxExtent => 48.0;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}

// ──────────────────────────────────────────────
// Profile Header Widget (for web)
// ──────────────────────────────────────────────
class _ProfileHeader extends StatelessWidget {
  final User user;
  final bool isCurrentUser;

  const _ProfileHeader({required this.user, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  user.coverPhoto,
                  cacheKey: 'cover ${user.id}',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(bottom: -5, left: 16, child: _ProfileImage(user: user)),
          Positioned(
            right: 15.0,
            bottom: 0,
            child: _ProfileButtons(user: user, isCurrentUser: isCurrentUser),
          ),
        ],
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
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: nameIsScrolled
                      ? Colors.transparent
                      : Theme.of(
                          context,
                        ).colorScheme.tertiaryContainer.withValues(alpha: 0.6),
                ),
                child: const AutoLeadingButton(),
              ),
              actions: [
                _ProfilePopUpMenu(
                  user: user,
                  isCurrentUser: isCurrentUser,
                  nameIsScrolled: nameIsScrolled,
                ),
              ],
              flexibleSpace: FlexibleSpaceBar.createSettings(
                currentExtent: 0.0,
                child: FlexibleSpaceBar(
                  title: AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: nameIsScrolled ? 1.0 : 0.0,
                    child: Text(user.name),
                  ),
                  background: Opacity(
                    opacity: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            user.coverPhoto,
                            cacheKey: 'cover ${user.id}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (!nameIsScrolled)
            Positioned(
              left: 15.0,
              top: cardTopPosition > 0 ? cardTopPosition : 0,
              bottom: -50.0,
              child: Opacity(
                opacity: percent,
                child: _ProfileImage(user: user),
              ),
            ),
          if (!nameIsScrolled)
            Positioned(
              right: 15.0,
              top: cardTopPosition > 0 ? cardTopPosition : 0,
              bottom: -110.0,
              child: Opacity(
                opacity: percent,
                child: _ProfileButtons(
                  user: user,
                  isCurrentUser: isCurrentUser,
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
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 50,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: ProfileImage(
        userId: user.id,
        username: user.username,
        imageUrl: user.image,
        radius: 47,
      ),
    );
  }
}

class _ProfileButtons extends StatelessWidget {
  const _ProfileButtons({required this.user, required this.isCurrentUser});

  final User user;
  final bool isCurrentUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isCurrentUser
            ? OutlinedButton.icon(
                onPressed: () => context.router.push(const EditProfile()),
                icon: const Icon(Symbols.edit_rounded, size: 18),
                label: const Text('Edit Profile'),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                ),
              )
            : Row(
                children: [
                  if (user.isBlocked)
                    BlockedButton(user: user)
                  else ...[
                    if (user.isMuted) ...[
                      MutedButton(user: user),
                      const SizedBox(width: 8),
                    ],
                    MessageButton(user: user),
                    const SizedBox(width: 8),
                    if (user.isFollowed) ...[
                      NotificationButton(user: user),
                      const SizedBox(width: 8),
                    ],
                    FollowButton(user: user),
                  ],
                ],
              ),
      ],
    );
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
  bool shouldRebuild(_TabBarAppBarDelegate oldDelegate) => false;
}

class _ProfilePopUpMenu extends StatelessWidget {
  const _ProfilePopUpMenu({
    required this.user,
    required this.isCurrentUser,
    required this.nameIsScrolled,
  });

  final User user;
  final bool isCurrentUser;
  final bool nameIsScrolled;

  @override
  Widget build(BuildContext context) {
    List<String> texts = isCurrentUser
        ? ['Share', 'Drafts']
        : [
            'Share',
            user.isMuted ? 'Unmute' : 'Mute',
            user.isBlocked ? 'Unblock' : 'Block',
          ];
    return PopupMenuButton<String>(
      useRootNavigator: true,
      menuPadding: EdgeInsets.zero,
      splashRadius: 50,
      borderRadius: BorderRadius.circular(50),
      onSelected: (selected) {
        switch (selected) {
          case 'Share':
            break;
          case 'Drafts':
            context.router.push(const DraftPosts());
          case 'Mute':
            showDialog(
              context: context,
              builder: (context) => MuteDialog(user: user),
            );
          case 'Unmute':
            context.read<UserDetailBloc>().add(
              UserDetailEvent.mute(user: user),
            );
          case 'Block':
            showDialog(
              context: context,
              builder: (context) => BlockDialog(user: user),
            );
          case 'Unblock':
            context.read<UserDetailBloc>().add(
              UserDetailEvent.block(user: user),
            );
        }
      },
      itemBuilder: (BuildContext context) => [
        ...texts.map((text) {
          return PopupMenuItem<String>(
            value: text,
            child: Text(text, textAlign: TextAlign.center),
          );
        }),
      ],
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: nameIsScrolled
              ? Colors.transparent
              : Theme.of(
                  context,
                ).colorScheme.tertiaryContainer.withValues(alpha: 0.6),
        ),
        child: const Icon(Icons.more_vert_rounded, size: 25),
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
      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(user.name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 5),
          Text(
            '@${user.username}',
            style: TextStyle(color: Theme.of(context).disabledColor),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Symbols.calendar_month_rounded,
                size: 17,
                color: Theme.of(context).disabledColor,
              ),
              const SizedBox(width: 5),
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
          if (user.bio.isNotEmpty) ...[
            const SizedBox(height: 5),
            CustomText(
              text: user.bio,
              style: Theme.of(context).textTheme.bodyMedium!,
            ),
          ],
          const SizedBox(height: 5),
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {
              context.router.push(
                FollowingRoute(userId: user.id, userName: user.name),
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${user.following} Following'),
                const SizedBox(width: 10),
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
