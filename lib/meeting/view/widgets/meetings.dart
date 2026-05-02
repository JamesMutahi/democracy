import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/meeting/bloc/meeting_detail/meeting_detail_bloc.dart';
import 'package:democracy/meeting/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/meeting/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/meeting/models/meeting.dart';
import 'package:democracy/meeting/view/widgets/meeting_tile.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
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
    return MultiBlocListener(
      listeners: [
        BlocListener<NotificationDetailBloc, NotificationDetailState>(
          listener: (context, state) {
            if (state is NotificationCreated) {
              if (state.notification.meeting != null) {
                final meetingsBloc = context.read<MeetingsBloc>();
                final meeting = state.notification.meeting;
                meetingsBloc.add(MeetingsEvent.add(meeting: meeting!));
              }
            }
          },
        ),
        BlocListener<MeetingDetailBloc, MeetingDetailState>(
          listener: (context, state) {
            final meetingsBloc = context.read<MeetingsBloc>();

            if (state is MeetingCreated) {
              meetingsBloc.add(MeetingsEvent.add(meeting: state.meeting));
            } else if (state is MeetingLoaded) {
              meetingsBloc.add(MeetingsEvent.update(meeting: state.meeting));
            } else if (state is MeetingUpdated) {
              meetingsBloc.add(MeetingsEvent.update(meeting: state.meeting));
            } else if (state is MeetingDeleted) {
              meetingsBloc.add(
                MeetingsEvent.remove(meetingId: state.meetingId),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<MeetingFilterCubit, MeetingFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<MeetingsBloc, MeetingsState>(
            builder: (context, meetingsState) {
              final meetings = meetingsState.meetings.toList();

              if (meetingsState.status == MeetingsStatus.initial ||
                  (meetingsState.status == MeetingsStatus.loading &&
                      meetings.isEmpty)) {
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

                if (meetings.isEmpty) {
                  return FailureRetryButton(
                    onPressed: () => context.read<MeetingsBloc>().add(
                      MeetingsEvent.get(searchTerm: filterState.searchTerm),
                    ),
                  );
                }
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
