import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/broadcast/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/meeting_tile.dart';
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
              if (state.notification.broadcast != null) {
                final broadcastsBloc = context.read<MeetingsBloc>();
                final broadcast = state.notification.broadcast;
                broadcastsBloc.add(MeetingsEvent.add(broadcast: broadcast!));
              }
            }
          },
        ),
        BlocListener<BroadcastDetailBloc, BroadcastDetailState>(
          listener: (context, state) {
            final broadcastsBloc = context.read<MeetingsBloc>();

            if (state is BroadcastCreated) {
              broadcastsBloc.add(MeetingsEvent.add(broadcast: state.broadcast));
            } else if (state is BroadcastLoaded) {
              broadcastsBloc.add(MeetingsEvent.update(broadcast: state.broadcast));
            } else if (state is BroadcastUpdated) {
              broadcastsBloc.add(MeetingsEvent.update(broadcast: state.broadcast));
            } else if (state is BroadcastDeleted) {
              broadcastsBloc.add(
                MeetingsEvent.remove(broadcastId: state.broadcastId),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<MeetingFilterCubit, MeetingFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<MeetingsBloc, MeetingsState>(
            builder: (context, broadcastsState) {
              final broadcasts = broadcastsState.broadcasts.toList();

              if (broadcastsState.status == MeetingsStatus.initial ||
                  (broadcastsState.status == MeetingsStatus.loading &&
                      broadcasts.isEmpty)) {
                return const BottomLoader();
              }

              if (broadcastsState.status == MeetingsStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (broadcastsState.status == MeetingsStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }

                if (broadcasts.isEmpty) {
                  return FailureRetryButton(
                    onPressed: () => context.read<MeetingsBloc>().add(
                      MeetingsEvent.get(searchTerm: filterState.searchTerm),
                    ),
                  );
                }
              }

              void getMeetings({List<Broadcast>? previousBroadcasts}) {
                context.read<MeetingsBloc>().add(
                  MeetingsEvent.get(
                    previousBroadcasts: previousBroadcasts,
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
                enablePullUp: broadcastsState.hasNext,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: getMeetings,
                onLoading: () {
                  getMeetings(previousBroadcasts: broadcasts);
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemBuilder: (BuildContext context, int index) {
                    Broadcast broadcast = broadcasts[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: MeetingTile(
                        key: ValueKey(broadcast.id),
                        broadcast: broadcast,
                        isDependency: false,
                      ),
                    );
                  },
                  itemCount: broadcasts.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
