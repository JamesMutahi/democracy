import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_loader.dart';
import 'package:democracy/app/utils/view/failure_retry_button.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:democracy/poll/bloc/poll_detail/poll_detail_cubit.dart';
import 'package:democracy/poll/bloc/polls/polls_cubit.dart';
import 'package:democracy/poll/models/poll.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Polls extends StatefulWidget {
  const Polls({super.key});

  @override
  State<Polls> createState() => _PollsState();
}

class _PollsState extends State<Polls> {
  bool loading = true;
  bool failure = false;
  List<Poll> _polls = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPolls());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.resubscribePolls(polls: _polls),
              );
            }
          },
        ),
        BlocListener<PollsCubit, PollsState>(
          listener: (context, state) {
            if (state.status == PollsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _polls = state.polls;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == PollsStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
        BlocListener<NotificationDetailCubit, NotificationDetailState>(
          listener: (context, state) {
            if (state is NotificationCreated) {
              if (!_polls.any(
                (poll) => poll.id == state.notification.poll?.id,
              )) {
                setState(() {
                  _polls.add(state.notification.poll!);
                  _polls.sort((a, b) => a.startTime.compareTo(b.endTime));
                });
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.subscribePoll(poll: state.notification.poll!),
                );
              }
            }
          },
        ),
        BlocListener<PollDetailCubit, PollDetailState>(
          listener: (context, state) {
            if (state is PollCreated) {
              if (!_polls.any((poll) => poll.id == state.poll.id)) {
                setState(() {
                  _polls.add(state.poll);
                  _polls.sort((a, b) => a.startTime.compareTo(b.endTime));
                });
              }
            }
            if (state is PollUpdated) {
              if (_polls.any((poll) => poll.id == state.poll.id)) {
                setState(() {
                  int index = _polls.indexWhere(
                    (poll) => poll.id == state.poll.id,
                  );
                  _polls[index] = state.poll;
                });
              }
            }
            if (state is PollDeleted) {
              if (_polls.any((poll) => poll.id == state.pollId)) {
                setState(() {
                  _polls.removeWhere((poll) => poll.id == state.pollId);
                });
              }
            }
          },
        ),
      ],
      child:
          loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(
                onPressed: () {
                  context.read<WebsocketBloc>().add(WebsocketEvent.getPolls());
                },
              )
              : SmartRefresher(
                enablePullDown: true,
                enablePullUp: hasNextPage,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<WebsocketBloc>().add(WebsocketEvent.getPolls());
                },
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getPolls(lastPoll: _polls.last),
                  );
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Poll poll = _polls[index];
                    return PollTile(
                      key: ValueKey(poll.id),
                      poll: poll,
                      isDependency: false,
                    );
                  },
                  itemCount: _polls.length,
                ),
              ),
    );
  }
}
