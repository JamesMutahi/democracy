import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/broadcast/bloc/broadcast_detail/broadcast_detail_bloc.dart';
import 'package:democracy/broadcast/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/broadcast/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_tile.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Meetings extends StatefulWidget {
  const Meetings({super.key});

  @override
  State<Meetings> createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  final RefreshController _refreshController = RefreshController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<MeetingsBloc>().add(
      MeetingsEvent.get(
        isOpen: defaultIsOpen,
        filterByRegion: defaultFilterByRegion,
      ),
    );
    // Register the active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

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
              if (state.broadcast.type == BroadcastType.meeting) {
                broadcastsBloc.add(
                  MeetingsEvent.add(broadcast: state.broadcast),
                );
              }
            } else if (state is BroadcastLoaded) {
              broadcastsBloc.add(
                MeetingsEvent.update(broadcast: state.broadcast),
              );
            } else if (state is BroadcastUpdated) {
              broadcastsBloc.add(
                MeetingsEvent.update(broadcast: state.broadcast),
              );
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
                    isOpen: filterState.isOpen,
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
                  controller: isWebLayout ? _scrollController : null,
                  physics: isWebLayout ? NeverScrollableScrollPhysics() : null,
                  padding: EdgeInsets.all(15),
                  itemBuilder: (BuildContext context, int index) {
                    Broadcast broadcast = broadcasts[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: BroadcastTile(
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
