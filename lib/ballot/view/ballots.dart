import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_cubit.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Ballots extends StatefulWidget {
  const Ballots({super.key});

  @override
  State<Ballots> createState() => _BallotsState();
}

class _BallotsState extends State<Ballots> {
  bool loading = true;
  bool failure = false;
  List<Ballot> _ballots = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getBallots());
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
                WebsocketEvent.resubscribeBallots(ballots: _ballots),
              );
            }
          },
        ),
        BlocListener<BallotsCubit, BallotsState>(
          listener: (context, state) {
            if (state.status == BallotsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _ballots = state.ballots;
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
            if (state.status == BallotsStatus.failure) {
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
              if (!_ballots.any(
                (ballot) => ballot.id == state.notification.ballot?.id,
              )) {
                setState(() {
                  _ballots.add(state.notification.ballot!);
                  _ballots.sort((a, b) => a.startTime.compareTo(b.endTime));
                });
                context.read<WebsocketBloc>().add(
                  WebsocketEvent.subscribeBallot(
                    ballot: state.notification.ballot!,
                  ),
                );
              }
            }
          },
        ),
        BlocListener<BallotDetailCubit, BallotDetailState>(
          listener: (context, state) {
            if (state is BallotCreated) {
              if (!_ballots.any((ballot) => ballot.id == state.ballot.id)) {
                setState(() {
                  _ballots.add(state.ballot);
                  _ballots.sort((a, b) => a.startTime.compareTo(b.endTime));
                });
              }
            }
            if (state is BallotUpdated) {
              if (_ballots.any((ballot) => ballot.id == state.ballot.id)) {
                setState(() {
                  int index = _ballots.indexWhere(
                    (ballot) => ballot.id == state.ballot.id,
                  );
                  _ballots[index] = state.ballot;
                });
              }
            }
            if (state is BallotDeleted) {
              if (_ballots.any((ballot) => ballot.id == state.ballotId)) {
                setState(() {
                  _ballots.removeWhere((ballot) => ballot.id == state.ballotId);
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
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getBallots(),
                  );
                },
              )
              : SmartRefresher(
                enablePullDown: true,
                enablePullUp: hasNextPage,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getBallots(),
                  );
                },
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getBallots(lastBallot: _ballots.last),
                  );
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Ballot ballot = _ballots[index];
                    return BallotTile(
                      key: ValueKey(ballot.id),
                      ballot: ballot,
                      isDependency: false,
                    );
                  },
                  itemCount: _ballots.length,
                ),
              ),
    );
  }
}
