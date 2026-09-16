import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/shared/widgets/dialog_container.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/chat/bloc/chat_detail/chat_detail_bloc.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:democracy/user/view/widgets/users_listview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class CreateMessage extends StatefulWidget {
  const CreateMessage({super.key});

  @override
  State<CreateMessage> createState() => _CreateMessageState();
}

class _CreateMessageState extends State<CreateMessage> {
  final TextEditingController _controller = TextEditingController();
  final RefreshController _refreshController = RefreshController();
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return BlocProvider(
      create: (context) =>
          UsersBloc(webSocketService: context.read<WebSocketService>())
            ..add(UsersEvent.get()),
      child: BlocListener<ChatDetailBloc, ChatDetailState>(
        listener: (context, state) {
          if (state is ChatCreated) {
            if (kIsWeb && responsive.largerOrEqualTo(expandSidePanel)) {
              Navigator.pop(context);
            } else {
              context.router.popTop();
              context.router.push(ChatDetail(chatId: state.chat.id));
            }
          }
        },
        child: kIsWeb ? _buildWeb(context) : _buildMobile(context),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('New Message'),
          leading: IconButton(
            icon: const Icon(Icons.close_rounded),
            onPressed: () => context.router.popTop(),
            tooltip: 'Close',
          ),
          backgroundColor: colorScheme.surface,
          elevation: 0,
          scrolledUnderElevation: 1,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildWeb(BuildContext context) {
    return DialogContainer(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Message',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => context.router.popTop(),
                tooltip: 'Close',
              ),
            ],
          ),
        ),
        const Divider(height: 1),

        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: _buildBody(context),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        _buildSearchBar(colorScheme),

        Divider(
          height: 1,
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),

        Expanded(
          child: BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) {
              final users = state.users.toList();

              if (state.status == UsersStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              } else if (state.status == UsersStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
              }

              if (state.status == UsersStatus.success && users.isEmpty) {
                return _buildEmptyState();
              }

              bool loading =
                  state.status == UsersStatus.initial ||
                  (state.status == UsersStatus.loading && users.isEmpty);

              return UsersListView(
                users: users,
                loading: loading,
                failure: users.isNotEmpty
                    ? false
                    : state.status == UsersStatus.failure,
                refreshController: _refreshController,
                enablePullUp: state.hasNext,
                onUserTap: (user) {
                  context.read<ChatDetailBloc>().add(
                    ChatDetailEvent.create(user: user),
                  );
                },
                onLoading: () {
                  context.read<UsersBloc>().add(
                    UsersEvent.get(
                      searchTerm: _controller.text,
                      lastUser: users.isNotEmpty ? users.last : null,
                    ),
                  );
                },
                onFailure: () {
                  context.read<UsersBloc>().add(
                    UsersEvent.get(
                      searchTerm: _controller.text,
                      lastUser: users.isNotEmpty ? users.last : null,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar(ColorScheme colorScheme) {
    return Container(
      color: colorScheme.surface,
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: ValueListenableBuilder<TextEditingValue>(
        valueListenable: _controller,
        builder: (context, value, child) {
          return TextField(
            controller: _controller,
            focusNode: _focusNode,
            autofocus: true,
            onChanged: (value) {
              context.read<UsersBloc>().add(UsersEvent.get(searchTerm: value));
            },
            onTapOutside: (_) => FocusManager.instance.primaryFocus?.unfocus(),
            decoration: InputDecoration(
              hintText: 'Search people...',
              hintStyle: TextStyle(color: colorScheme.onSurfaceVariant),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: colorScheme.onSurfaceVariant,
              ),
              suffixIcon: value.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear_rounded, size: 20),
                      onPressed: () {
                        _controller.clear();
                        context.read<UsersBloc>().add(
                          UsersEvent.get(searchTerm: ''),
                        );
                      },
                    )
                  : null,
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    final isSearching = _controller.text.isNotEmpty;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSearching ? Icons.person_off_rounded : Icons.forum_outlined,
              size: 64,
              color: Theme.of(context).colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              isSearching ? 'No users found' : 'Start a conversation',
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              isSearching
                  ? 'Try a different name or username'
                  : 'Search for friends to send a message',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.outline,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
