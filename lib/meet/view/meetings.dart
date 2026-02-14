import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
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
  bool loading = true;
  bool failure = false;
  List<Meeting> _meetings = [];
  bool hasNextPage = false;
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
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<MeetingsBloc>().add(
                MeetingsEvent.resubscribe(meetings: _meetings),
              );
            }
          },
        ),
        BlocListener<MeetingsBloc, MeetingsState>(
          listener: (context, state) {
            if (state.status == MeetingsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _meetings = state.meetings;
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
            if (state.status == MeetingsStatus.failure) {
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
        BlocListener<MeetingDetailBloc, MeetingDetailState>(
          listener: (context, state) {
            if (state is MeetingCreated) {
              if (!_meetings.any((meeting) => meeting.id == state.meeting.id)) {
                setState(() {
                  _meetings.add(state.meeting);
                  _meetings.sort((a, b) => a.startTime.compareTo(b.endTime));
                });
              }
            }
            if (state is MeetingUpdated) {
              if (_meetings.any((meeting) => meeting.id == state.meeting.id)) {
                setState(() {
                  int index = _meetings.indexWhere(
                    (meeting) => meeting.id == state.meeting.id,
                  );
                  _meetings[index] = state.meeting;
                });
              }
            }
            if (state is MeetingDeleted) {
              if (_meetings.any((meeting) => meeting.id == state.meetingId)) {
                setState(() {
                  _meetings.removeWhere(
                    (meeting) => meeting.id == state.meetingId,
                  );
                });
              }
            }
          },
        ),
      ],
      child: BlocBuilder<MeetingFilterCubit, MeetingFilterState>(
        builder: (context, state) {
          void getMeetings({Meeting? lastMeeting}) {
            context.read<MeetingsBloc>().add(
              MeetingsEvent.get(
                lastMeeting: lastMeeting,
                searchTerm: state.searchTerm,
                isActive: state.isActive,
                sortBy: state.sortBy,
                filterByRegion: state.filterByRegion,
                startDate: state.startDate,
                endDate: state.endDate,
              ),
            );
          }

          return loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(onPressed: getMeetings)
              : SmartRefresher(
                  enablePullDown: true,
                  enablePullUp: hasNextPage,
                  header: ClassicHeader(),
                  controller: _refreshController,
                  onRefresh: getMeetings,
                  onLoading: () {
                    getMeetings(lastMeeting: _meetings.last);
                  },
                  footer: ClassicFooter(),
                  child: ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemBuilder: (BuildContext context, int index) {
                      Meeting meeting = _meetings[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: MeetingTile(
                          key: ValueKey(meeting.id),
                          meeting: meeting,
                          isDependency: false,
                        ),
                      );
                    },
                    itemCount: _meetings.length,
                  ),
                );
        },
      ),
    );
  }
}
