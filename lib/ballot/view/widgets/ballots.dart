import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Ballots extends StatefulWidget {
  const Ballots({super.key});

  @override
  State<Ballots> createState() => _BallotsState();
}

class _BallotsState extends State<Ballots> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<BallotsBloc>().add(
      BallotsEvent.get(
        isOpen: defaultIsOpen,
        filterByRegion: defaultFilterByRegion,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotificationDetailBloc, NotificationDetailState>(
      listener: (context, state) {
        if (state is NotificationCreated) {
          if (state.notification.ballot != null) {
            final ballotsBloc = context.read<BallotsBloc>();
            final ballot = state.notification.ballot;
            ballotsBloc.add(BallotsEvent.add(ballot: ballot!));
          }
        }
      },
      child: BlocBuilder<BallotFilterCubit, BallotFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<BallotsBloc, BallotsState>(
            builder: (context, ballotsState) {
              final ballots = ballotsState.ballots.toList();

              if (ballotsState.status == BallotsStatus.initial ||
                  (ballots.isEmpty &&
                      ballotsState.status == BallotsStatus.loading)) {
                return const BottomLoader();
              }

              if (ballotsState.status == BallotsStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (ballotsState.status == BallotsStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
                if (ballotsState.ballots.isEmpty) {
                  return FailureRetryButton(
                    onPressed: () => context.read<BallotsBloc>().add(
                      BallotsEvent.get(searchTerm: filterState.searchTerm),
                    ),
                  );
                }
              }

              void getBallots({List<Ballot>? previousBallots}) {
                context.read<BallotsBloc>().add(
                  BallotsEvent.get(
                    previousBallots: previousBallots,
                    searchTerm: filterState.searchTerm,
                    isOpen: filterState.isOpen,
                    sortBy: filterState.sortBy,
                    filterByRegion: filterState.filterByRegion,
                    startDate: filterState.startDate,
                    endDate: filterState.endDate,
                  ),
                );
              }

              return BlocListener<BallotDetailBloc, BallotDetailState>(
                listener: (context, state) {
                  final ballotsBloc = context.read<BallotsBloc>();

                  switch (state) {
                    case BallotCreated():
                      ballotsBloc.add(BallotsEvent.add(ballot: state.ballot));
                    case BallotLoaded():
                      if (ballots.any(
                        (element) => element.id == state.ballot.id,
                      )) {
                        int petitionIndex = ballots.indexWhere(
                          (element) => element.id == state.ballot.id,
                        );
                        ballots[petitionIndex] = state.ballot;
                        ballotsBloc.add(BallotsEvent.update(ballots: ballots));
                      }
                    case BallotUpdated():
                      if (ballots.any(
                        (element) => element.id == state.ballotId,
                      )) {
                        int ballotIndex = ballots.indexWhere(
                          (element) => element.id == state.ballotId,
                        );
                        ballots[ballotIndex] = ballots[ballotIndex].copyWith(
                          title: state.title,
                          description: state.description,
                          county: state.county,
                          constituency: state.constituency,
                          ward: state.ward,
                          startTime: state.startTime,
                          endTime: state.endTime,
                          hasStarted: state.hasStarted,
                          hasEnded: state.hasEnded,
                          totalVotes: state.totalVotes,
                          options: state.options,
                          isActive: state.isActive,
                        );
                        ballotsBloc.add(BallotsEvent.update(ballots: ballots));
                      }
                    case BallotVoted():
                      if (ballots.any(
                        (element) => element.id == state.ballotId,
                      )) {
                        int ballotIndex = ballots.indexWhere(
                          (element) => element.id == state.ballotId,
                        );
                        ballots[ballotIndex] = ballots[ballotIndex].copyWith(
                          votedOption: state.optionId,
                        );
                        ballotsBloc.add(BallotsEvent.update(ballots: ballots));
                      }
                    case BallotReasonSubmitted():
                      if (ballots.any(
                        (element) => element.id == state.ballotId,
                      )) {
                        int ballotIndex = ballots.indexWhere(
                          (element) => element.id == state.ballotId,
                        );
                        ballots[ballotIndex] = ballots[ballotIndex].copyWith(
                          reason: state.reason,
                        );
                        ballotsBloc.add(BallotsEvent.update(ballots: ballots));
                      }
                    case BallotDeleted():
                      ballotsBloc.add(
                        BallotsEvent.remove(ballotId: state.ballotId),
                      );
                  }
                },
                child: SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: ballotsState.hasNext,
                  header: ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: getBallots,
                  onLoading: () {
                    getBallots(previousBallots: ballots);
                  },
                  footer: ClassicFooter(),
                  child: ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemBuilder: (BuildContext context, int index) {
                      Ballot ballot = ballots[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: BallotTile(
                          key: ValueKey(ballot.id),
                          ballot: ballot,
                          isDependency: false,
                        ),
                      );
                    },
                    itemCount: ballots.length,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
