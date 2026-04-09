import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/ballot/bloc/ballot_detail/ballot_detail_bloc.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/ballot_tile.dart';
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
      BallotsEvent.get(isActive: true, filterByRegion: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<BallotDetailBloc, BallotDetailState>(
      listener: (context, state) {
        final ballotsBloc = context.read<BallotsBloc>();

        if (state is BallotCreated) {
          ballotsBloc.add(BallotsEvent.add(ballot: state.ballot));
        } else if (state is BallotLoaded) {
          ballotsBloc.add(BallotsEvent.update(ballot: state.ballot));
        } else if (state is BallotUpdated) {
          ballotsBloc.add(BallotsEvent.update(ballot: state.ballot));
        } else if (state is BallotDeleted) {
          ballotsBloc.add(BallotsEvent.remove(ballotId: state.ballotId));
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
                    isActive: filterState.isActive,
                    sortBy: filterState.sortBy,
                    filterByRegion: filterState.filterByRegion,
                    startDate: filterState.startDate,
                    endDate: filterState.endDate,
                  ),
                );
              }

              return SmartRefresher(
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
              );
            },
          );
        },
      ),
    );
  }
}
