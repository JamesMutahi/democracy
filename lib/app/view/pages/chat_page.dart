import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat/chat_bloc.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/direct_message/direct_message_bloc.dart';
import 'package:democracy/chat/bloc/inbox/inbox_bloc.dart';
import 'package:democracy/chat/bloc/requests/requests_bloc.dart';
import 'package:democracy/chat/view/chat_detail.dart';
import 'package:democracy/chat/view/create_message.dart';
import 'package:democracy/chat/view/widgets/inbox.dart';
import 'package:democracy/chat/view/widgets/requests.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _inboxScrollController = ScrollController();
  final ScrollController _requestsScrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    context.read<InboxBloc>().add(InboxEvent.get());
    context.read<RequestsBloc>().add(RequestsEvent.get());

    super.initState();

    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_activeScrollController!);
    });
  }

  void _onTabChanged() {
    _deactivateTabScrollControllers();
    ActiveScrollController.activate(_activeScrollController!);
  }

  void _deactivateTabScrollControllers() {
    ActiveScrollController.deactivate(_inboxScrollController);
    ActiveScrollController.deactivate(_requestsScrollController);
  }

  @override
  void dispose() {
    _deactivateTabScrollControllers();
    _controller.dispose();
    _tabController.removeListener(_onTabChanged);
    _inboxScrollController.dispose();
    _requestsScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  ScrollController? get _activeScrollController {
    return _tabController.index == 0
        ? _inboxScrollController
        : _requestsScrollController;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return MultiBlocListener(
      listeners: [
        BlocListener<ChatDetailBloc, ChatDetailState>(
          listener: (context, state) {
            if (state is ChatCreated ||
                state is ChatLoaded ||
                state is ChatUpdated ||
                state is ChatDeleted) {
              context.read<InboxBloc>().add(const InboxEvent.update());
              context.read<RequestsBloc>().add(const RequestsEvent.update());
            } else if (state is ChatDetailFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                getSnackBar(
                  context: context,
                  message: state.error,
                  status: SnackBarStatus.failure,
                ),
              );
            }
          },
        ),
        BlocListener<DirectMessageBloc, DirectMessageState>(
          listener: (context, state) {
            if (state.status == DirectMessageStatus.success) {
              context.read<InboxBloc>().add(const InboxEvent.update());
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: kIsWeb && responsive.largerThan(MOBILE)
              ? _buildWeb(responsive)
              : _buildMobile(responsive),
        ),
      ),
    );
  }

  Widget _buildWeb(ResponsiveBreakpointsData responsive) {
    final borderColor = Theme.of(context).disabledColor.withAlpha(30);

    return BlocProvider(
      create: (context) =>
          ChatBloc(webSocketService: context.read<WebSocketService>()),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            child: Container(
              constraints: BoxConstraints(maxWidth: 600),
              padding: const EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: borderColor),
                  right: BorderSide(color: borderColor),
                ),
              ),
              child: Column(
                children: [
                  _buildSearchBar(),
                  _buildTabBar(),
                  Expanded(child: _buildTabBarView()),
                ],
              ),
            ),
          ),
          if (responsive.largerOrEqualTo(expandSidePanel))
            BlocListener<ChatDetailBloc, ChatDetailState>(
              listener: (context, state) {
                if (state is ChatCreated) {
                  context.read<ChatBloc>().add(
                    ChatEvent.load(chatId: state.chat.id),
                  );
                }
              },
              child: Flexible(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: borderColor)),
                  ),
                  child: BlocBuilder<ChatBloc, ChatState>(
                    builder: (context, state) {
                      if (state.status == ChatStatus.initial &&
                          state.chatId == null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: SvgPicture.asset(
                                  'assets/icons/chat.svg',
                                  height: 35,
                                  width: 35,
                                  colorFilter: ColorFilter.mode(
                                    Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                    BlendMode.srcIn,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              ElevatedButton(
                                onPressed: () {
                                  showCreateMessage(context);
                                },
                                child: Text(
                                  'New chat',
                                  style: TextStyle(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                      if (state.status == ChatStatus.loading &&
                          state.chat == null) {
                        return const Scaffold(
                          body: Center(child: BottomLoader()),
                        );
                      }
                      if (state.status == ChatStatus.failure &&
                          state.chat == null) {
                        return Scaffold(
                          body: Center(
                            child: FailureRetryButton(
                              onPressed: () {
                                context.read<ChatBloc>().add(
                                  ChatEvent.load(chatId: state.chatId!),
                                );
                              },
                            ),
                          ),
                        );
                      }

                      final me = context.read<AuthBloc>().state.user!;
                      final otherUser = state.chat!.users.length > 1
                          ? state.chat!.users.firstWhere((u) => u.id != me.id)
                          : me;

                      return ChatDetailView(
                        key: ValueKey(state.chat!.id),
                        chat: state.chat!,
                        me: me,
                        otherUser: otherUser,
                      );
                    },
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMobile(ResponsiveBreakpointsData responsive) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CustomAppBar(
            key: ValueKey('chat page'),
            middle: Text('Chat', style: Theme.of(context).textTheme.titleLarge),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(112.0),
              child: Column(children: [_buildSearchBar(), _buildTabBar()]),
            ),
          ),
        ];
      },
      body: Stack(
        children: [
          _buildTabBarView(),
          Positioned(
            bottom: 24,
            right: 24,
            child: FloatingActionButton(
              heroTag: 'new_message',
              elevation: 4,
              onPressed: () {
                showCreateMessage(context);
              },
              child: const Icon(Icons.edit_rounded, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return BlocConsumer<ChatFilterCubit, ChatFilterState>(
      listener: (context, state) {
        context.read<InboxBloc>().add(
          InboxEvent.get(searchTerm: state.searchTerm),
        );
      },
      builder: (context, state) {
        return CustomSearchBar(
          controller: _controller,
          hintText: 'Search',
          onChanged: (value) {
            context.read<ChatFilterCubit>().searchTermChanged(
              searchTerm: value,
            );
          },
        );
      },
    );
  }

  PreferredSizeWidget _buildTabBar() {
    final theme = Theme.of(context);
    final requestsTitle = Text('Requests');
    return TabBar(
      controller: _tabController,
      dividerColor: theme.disabledColor.withAlpha(30),
      labelStyle: theme.textTheme.titleMedium,
      tabs: [
        Tab(text: 'Inbox'),
        Tab(
          child: BlocBuilder<RequestsBloc, RequestsState>(
            builder: (context, state) {
              return state.chats.isEmpty
                  ? requestsTitle
                  : Badge(
                      offset: Offset(17, -5),
                      backgroundColor: theme.primaryColor,
                      label: Text(state.chats.length.toString()),
                      child: requestsTitle,
                    );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Inbox(scrollController: _inboxScrollController),
        Requests(scrollController: _requestsScrollController),
      ],
    );
  }
}

void showCreateMessage(BuildContext context) {
  if (kIsWeb) {
    showDialog(context: context, builder: (context) => CreateMessage());
  } else {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CreateMessage(),
    );
  }
}
