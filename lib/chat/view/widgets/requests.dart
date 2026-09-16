import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/requests/requests_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/view/widgets/chat_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Requests extends StatefulWidget {
  const Requests({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  State<Requests> createState() => _InboxState();
}

class _InboxState extends State<Requests> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final colorScheme = Theme.of(context).colorScheme;
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocBuilder<ChatFilterCubit, ChatFilterState>(
      builder: (context, filterState) {
        return BlocBuilder<RequestsBloc, RequestsState>(
          builder: (context, chatsState) {
            List<Chat> chats = chatsState.chats.toList();

            if (chatsState.status == RequestsStatus.initial ||
                (chatsState.status == RequestsStatus.loading &&
                    chats.isEmpty)) {
              return const Center(child: BottomLoader());
            }

            if (chatsState.status == RequestsStatus.success) {
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshCompleted();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadComplete();
              }
            }

            if (chatsState.status == RequestsStatus.failure) {
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
              if (chats.isEmpty) {
                return Center(
                  child: FailureRetryButton(
                    onPressed: () => context.read<RequestsBloc>().add(
                      RequestsEvent.get(searchTerm: filterState.searchTerm),
                    ),
                  ),
                );
              }
            }

            if (chats.isEmpty) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wechat_outlined,
                        size: 64,
                        color: colorScheme.onSurfaceVariant.withValues(
                          alpha: 0.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        filterState.searchTerm.isNotEmpty
                            ? 'No matching chats'
                            : 'No requests',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              );
            }

            final me = context.read<AuthBloc>().state.user!;

            return SmartRefresher(
              enablePullDown: true,
              enablePullUp: chatsState.hasNext,
              header: const ClassicHeader(),
              footer: const ClassicFooter(),
              controller: _refreshController,
              onRefresh: () => context.read<RequestsBloc>().add(
                RequestsEvent.get(searchTerm: filterState.searchTerm),
              ),
              onLoading: () {
                if (chats.isNotEmpty) {
                  context.read<RequestsBloc>().add(
                    RequestsEvent.get(
                      lastChat: chats.last,
                      searchTerm: filterState.searchTerm,
                    ),
                  );
                }
              },
              child: ListView.separated(
                controller: isWebLayout ? widget.scrollController : null,
                physics: isWebLayout ? BouncingScrollPhysics() : null,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 80,
                ), // Bottom padding for FAB
                itemCount: chats.length,
                separatorBuilder: (_, _) => Divider(
                  height: 5,
                  color: colorScheme.outlineVariant.withValues(alpha: 0.1),
                ),
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  final otherUser = chat.users.length > 1
                      ? chat.users.firstWhere(
                          (u) => u.id != me.id,
                          orElse: () => me,
                        )
                      : me;
                  return ChatTile(
                    key: ValueKey(chat.id),
                    chat: chat,
                    currentUser: me,
                    otherUser: otherUser,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
