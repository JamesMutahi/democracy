import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/hub_filter/hub_filter_cubit.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/app/view/router/router.gr.dart' as router_gr;
import 'package:democracy/app/view/widgets/hub_filter.dart';
import 'package:democracy/app/view/widgets/results_search_bar.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/broadcast/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/broadcast/view/widgets/broadcast_selector.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

@RoutePage()
class HubResults extends StatefulWidget {
  const HubResults({
    super.key,
    @QueryParam() this.searchTerm = '',
    @QueryParam() this.filterByRegion = true,
    @QueryParam() this.sortBy = 'recent',
    @QueryParam() this.startDate,
    @QueryParam() this.endDate,
    @QueryParam() this.filterCount = 0,
  });

  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;
  final int filterCount;

  @override
  State<HubResults> createState() => _HubResultsState();
}

class _HubResultsState extends State<HubResults>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.searchTerm;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HubFilterCubit()
            ..initialize(
              onHubPage: false,
              searchTerm: widget.searchTerm,
              filterByRegion: widget.filterByRegion,
              sortBy: widget.sortBy,
              startDate: widget.startDate,
              endDate: widget.endDate,
            ),
        ),
        BlocProvider(
          create: (context) =>
              BallotsBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (context) =>
              SurveysBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (context) =>
              MeetingsBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(
          create: (context) =>
              PetitionsBloc(webSocketService: context.read<WebSocketService>()),
        ),
      ],
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: SafeArea(
            child: BlocBuilder<HubFilterCubit, HubFilterState>(
              buildWhen: (previous, current) {
                return current.searchTerm == widget.searchTerm;
              },
              builder: (context, state) {
                final cubit = context.read<HubFilterCubit>();
                return NestedScrollView(
                  headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                    return [
                      SliverAppBar(
                        floating: true,
                        snap: true,
                        forceElevated: true,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Builder(
                          builder: (context) {
                            return SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  BackButton(),
                                  _buildSearchBar(
                                    cubit: cubit,
                                    filterByRegion: state.filterByRegion,
                                    sortBy: state.sortBy,
                                    startDate: state.startDate,
                                    endDate: state.endDate,
                                    filterCount: state.count,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        bottom: TabBar(
                          dividerColor: Theme.of(
                            context,
                          ).colorScheme.outlineVariant,
                          labelStyle: Theme.of(context).textTheme.titleMedium,
                          tabs: [
                            Tab(text: 'Ballots'),
                            Tab(text: 'Surveys'),
                            Tab(text: 'Meetings'),
                            Tab(text: 'Petitions'),
                          ],
                        ),
                      ),
                    ];
                  },
                  body: MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => BallotsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => SurveysBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => MeetingsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(
                        create: (context) => PetitionsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                    ],
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        _BallotsTab(
                          searchTerm: widget.searchTerm,
                          filterByRegion: state.filterByRegion,
                          sortBy: state.sortBy,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _SurveysTab(
                          searchTerm: widget.searchTerm,
                          filterByRegion: state.filterByRegion,
                          sortBy: state.sortBy,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _MeetingsTab(
                          searchTerm: widget.searchTerm,
                          filterByRegion: state.filterByRegion,
                          sortBy: state.sortBy,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                        _PetitionsTab(
                          searchTerm: widget.searchTerm,
                          filterByRegion: state.filterByRegion,
                          sortBy: state.sortBy,
                          startDate: state.startDate,
                          endDate: state.endDate,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar({
    required HubFilterCubit cubit,
    required bool filterByRegion,
    required String sortBy,
    required DateTime? startDate,
    required DateTime? endDate,
    required int filterCount,
  }) {
    return ResultsSearchBar(
      controller: _controller,
      filterCount: filterCount,
      filterModal: BlocProvider.value(
        value: cubit,
        child: HubFilters(
          onHubPage: false,
          filterByRegion: filterByRegion,
          sortBy: sortBy,
          startDate: startDate,
          endDate: endDate,
          cubit: cubit,
        ),
      ),
      onSubmitted: (value) async {
        if (_controller.text.isNotEmpty &&
            widget.searchTerm != _controller.text) {
          final route = router_gr.HubResults(
            searchTerm: _controller.text,
            filterByRegion: filterByRegion,
            sortBy: sortBy,
            startDate: startDate,
            endDate: endDate,
            filterCount: filterCount,
          );
          await context.router.push(route);
          _controller.text = widget.searchTerm;
        }
      },
    );
  }
}

class _BallotsTab extends StatefulWidget {
  const _BallotsTab({
    required this.searchTerm,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_BallotsTab> createState() => _BallotsTabState();
}

class _BallotsTabState extends State<_BallotsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _getBallots();
  }

  void _getBallots({List<Ballot>? previousBallots}) {
    context.read<BallotsBloc>().add(
      BallotsEvent.get(
        previousBallots: previousBallots,
        searchTerm: widget.searchTerm,
        filterByRegion: widget.filterByRegion,
        sortBy: widget.sortBy,
        startDate: widget.startDate,
        endDate: widget.endDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<HubFilterCubit, HubFilterState>(
      listener: (context, state) {
        if (state.searchTerm == widget.searchTerm) {
          context.read<BallotsBloc>().add(
            BallotsEvent.get(
              searchTerm: widget.searchTerm,
              filterByRegion: state.filterByRegion,
              sortBy: state.sortBy,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          );
        }
      },
      child: BlocBuilder<BallotsBloc, BallotsState>(
        buildWhen: (previous, current) {
          return widget.searchTerm == current.searchTerm;
        },
        builder: (context, state) {
          final ballots = state.ballots.toList();

          if (state.status == BallotsStatus.initial) {
            return const BottomLoader();
          }

          if (state.status == BallotsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == BallotsStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
            if (state.ballots.isEmpty) {
              return FailureRetryButton(
                onPressed: () => context.read<BallotsBloc>().add(
                  BallotsEvent.get(searchTerm: state.searchTerm),
                ),
              );
            }
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            controller: _refreshController,
            onRefresh: _getBallots,
            onLoading: () {
              _getBallots(previousBallots: ballots);
            },
            footer: ClassicFooter(),
            child: ballots.isEmpty
                ? NoResults(text: 'No ballots')
                : ListView.builder(
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
      ),
    );
  }
}

class _SurveysTab extends StatefulWidget {
  const _SurveysTab({
    required this.searchTerm,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_SurveysTab> createState() => _SurveysTabState();
}

class _SurveysTabState extends State<_SurveysTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _getSurveys();
  }

  void _getSurveys({List<Survey>? previousSurveys}) {
    context.read<SurveysBloc>().add(
      SurveysEvent.get(
        previousSurveys: previousSurveys,
        searchTerm: widget.searchTerm,
        filterByRegion: widget.filterByRegion,
        sortBy: widget.sortBy,
        startDate: widget.startDate,
        endDate: widget.endDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<HubFilterCubit, HubFilterState>(
      listener: (context, state) {
        if (state.searchTerm == widget.searchTerm) {
          context.read<SurveysBloc>().add(
            SurveysEvent.get(
              searchTerm: widget.searchTerm,
              filterByRegion: state.filterByRegion,
              sortBy: state.sortBy,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          );
        }
      },
      child: BlocBuilder<SurveysBloc, SurveysState>(
        buildWhen: (previous, current) {
          return widget.searchTerm == current.searchTerm;
        },
        builder: (context, state) {
          final surveys = state.surveys.toList();

          if (state.status == SurveysStatus.initial) {
            return const BottomLoader();
          }

          if (state.status == SurveysStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == SurveysStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
            if (state.surveys.isEmpty) {
              return FailureRetryButton(
                onPressed: () => context.read<SurveysBloc>().add(
                  SurveysEvent.get(searchTerm: state.searchTerm),
                ),
              );
            }
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            controller: _refreshController,
            onRefresh: _getSurveys,
            onLoading: () {
              _getSurveys(previousSurveys: surveys);
            },
            footer: ClassicFooter(),
            child: surveys.isEmpty
                ? NoResults(text: 'No surveys')
                : ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemBuilder: (BuildContext context, int index) {
                      Survey survey = surveys[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: SurveyTile(
                          key: ValueKey(survey.id),
                          survey: survey,
                          isDependency: false,
                        ),
                      );
                    },
                    itemCount: surveys.length,
                  ),
          );
        },
      ),
    );
  }
}

class _MeetingsTab extends StatefulWidget {
  const _MeetingsTab({
    required this.searchTerm,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_MeetingsTab> createState() => _MeetingsTabState();
}

class _MeetingsTabState extends State<_MeetingsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _getMeetings();
  }

  void _getMeetings({List<Broadcast>? previousBroadcasts}) {
    context.read<MeetingsBloc>().add(
      MeetingsEvent.get(
        previousBroadcasts: previousBroadcasts,
        searchTerm: widget.searchTerm,
        filterByRegion: widget.filterByRegion,
        sortBy: widget.sortBy,
        startDate: widget.startDate,
        endDate: widget.endDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<HubFilterCubit, HubFilterState>(
      listener: (context, state) {
        if (state.searchTerm == widget.searchTerm) {
          context.read<MeetingsBloc>().add(
            MeetingsEvent.get(
              searchTerm: widget.searchTerm,
              filterByRegion: state.filterByRegion,
              sortBy: state.sortBy,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          );
        }
      },
      child: BlocBuilder<MeetingsBloc, MeetingsState>(
        buildWhen: (previous, current) {
          return widget.searchTerm == current.searchTerm;
        },
        builder: (context, state) {
          final broadcasts = state.broadcasts.toList();

          if (state.status == MeetingsStatus.initial) {
            return const BottomLoader();
          }

          if (state.status == MeetingsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == MeetingsStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
            if (state.broadcasts.isEmpty) {
              return FailureRetryButton(
                onPressed: () => context.read<MeetingsBloc>().add(
                  MeetingsEvent.get(searchTerm: state.searchTerm),
                ),
              );
            }
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            controller: _refreshController,
            onRefresh: _getMeetings,
            onLoading: () {
              _getMeetings(previousBroadcasts: broadcasts);
            },
            footer: ClassicFooter(),
            child: broadcasts.isEmpty
                ? NoResults(text: 'No meetings')
                : ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemBuilder: (BuildContext context, int index) {
                      Broadcast broadcast = broadcasts[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: BroadcastSelector(
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
      ),
    );
  }
}

class _PetitionsTab extends StatefulWidget {
  const _PetitionsTab({
    required this.searchTerm,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_PetitionsTab> createState() => _PetitionsTabState();
}

class _PetitionsTabState extends State<_PetitionsTab>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    _getBallots();
  }

  void _getBallots({List<Petition>? previousPetitions}) {
    context.read<PetitionsBloc>().add(
      PetitionsEvent.get(
        previousPetitions: previousPetitions,
        searchTerm: widget.searchTerm,
        filterByRegion: widget.filterByRegion,
        sortBy: widget.sortBy,
        startDate: widget.startDate,
        endDate: widget.endDate,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<HubFilterCubit, HubFilterState>(
      listener: (context, state) {
        if (state.searchTerm == widget.searchTerm) {
          context.read<PetitionsBloc>().add(
            PetitionsEvent.get(
              searchTerm: widget.searchTerm,
              filterByRegion: state.filterByRegion,
              sortBy: state.sortBy,
              startDate: state.startDate,
              endDate: state.endDate,
            ),
          );
        }
      },
      child: BlocBuilder<PetitionsBloc, PetitionsState>(
        buildWhen: (previous, current) {
          return widget.searchTerm == current.searchTerm;
        },
        builder: (context, state) {
          final petitions = state.petitions.toList();

          if (state.status == PetitionsStatus.initial) {
            return const BottomLoader();
          }

          if (state.status == PetitionsStatus.success) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshCompleted();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadComplete();
            }
          }

          if (state.status == PetitionsStatus.failure) {
            if (_refreshController.headerStatus == RefreshStatus.refreshing) {
              _refreshController.refreshFailed();
            }
            if (_refreshController.footerStatus == LoadStatus.loading) {
              _refreshController.loadFailed();
            }
            if (state.petitions.isEmpty) {
              return FailureRetryButton(
                onPressed: () => context.read<PetitionsBloc>().add(
                  PetitionsEvent.get(searchTerm: state.searchTerm),
                ),
              );
            }
          }

          return SmartRefresher(
            enablePullDown: true,
            enablePullUp: state.hasNext,
            header: ClassicHeader(),
            controller: _refreshController,
            onRefresh: _getBallots,
            onLoading: () {
              _getBallots(previousPetitions: petitions);
            },
            footer: ClassicFooter(),
            child: petitions.isEmpty
                ? NoResults(text: 'No petitions')
                : ListView.builder(
                    padding: EdgeInsets.all(15),
                    itemBuilder: (BuildContext context, int index) {
                      Petition petition = petitions[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: PetitionTile(
                          key: ValueKey(petition.id),
                          petition: petition,
                          isDependency: false,
                        ),
                      );
                    },
                    itemCount: petitions.length,
                  ),
          );
        },
      ),
    );
  }
}
