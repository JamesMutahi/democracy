import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/meet/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meet/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/meet/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Meetings extends StatefulWidget {
  const Meetings({super.key});

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<MeetingsBloc>().add(
      MeetingsEvent.get(isActive: true, filterByRegion: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MeetingDetailBloc, MeetingDetailState>(
      listener: (context, state) {
        final meetingsBloc = context.read<MeetingsBloc>();

        if (state is MeetingCreated) {
          meetingsBloc.add(MeetingsEvent.add(meeting: state.meeting));
        } else if (state is MeetingLoaded) {
          meetingsBloc.add(MeetingsEvent.update(meeting: state.meeting));
        } else if (state is MeetingUpdated) {
          meetingsBloc.add(MeetingsEvent.update(meeting: state.meeting));
        } else if (state is MeetingDeleted) {
          meetingsBloc.add(MeetingsEvent.remove(meetingId: state.meetingId));
        }
      },
      child: BlocBuilder<MeetingFilterCubit, MeetingFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<MeetingsBloc, MeetingsState>(
            builder: (context, meetingsState) {
              final meetings = meetingsState.meetings;

              if (meetingsState.status == MeetingsStatus.loading) {
                return const BottomLoader();
              }

              if (meetingsState.status == MeetingsStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (meetingsState.status == MeetingsStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
                return FailureRetryButton(
                  onPressed: () => context.read<MeetingsBloc>().add(
                    MeetingsEvent.get(searchTerm: filterState.searchTerm),
                  ),
                );
              }

              void getMeetings({List<Meeting>? previousMeetings}) {
                context.read<MeetingsBloc>().add(
                  MeetingsEvent.get(
                    previousMeetings: previousMeetings,
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
                enablePullUp: meetingsState.hasNext,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: getMeetings,
                onLoading: () {
                  getMeetings(previousMeetings: meetings);
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemBuilder: (BuildContext context, int index) {
                    Meeting meeting = meetings[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: MeetingTile(
                        key: ValueKey(meeting.id),
                        meeting: meeting,
                        isDependency: false,
                      ),
                    );
                  },
                  itemCount: meetings.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
