import 'package:democracy/app/bloc/hub_filter/hub_filter_cubit.dart';
import 'package:democracy/app/bloc/websocket/websocket_service.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/no_results.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/app/view/widgets/results_search_bar.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/ballot/view/ballot_page.dart';
import 'package:democracy/ballot/view/widgets/ballot_tile.dart';
import 'package:democracy/meet/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/meet/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/meet/models/meeting.dart';
import 'package:democracy/meet/view/meeting_page.dart';
import 'package:democracy/meet/view/widgets/meeting_tile.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_page.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/survey/view/survey_page.dart';
import 'package:democracy/survey/view/widgets/survey_tile.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Hub extends StatefulWidget {
  const Hub({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  final TextEditingController _controller = TextEditingController();
  double padding = 15;

  bool filterByRegion = true;
  String sortBy = 'recent';
  DateTime? startDate;
  DateTime? endDate;
  int filterCount = 0;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text('Hub', style: Theme.of(context).textTheme.titleLarge),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: BlocConsumer<HubFilterCubit, HubFilterState>(
                listener: (context, state) {
                  if (state.onHubPage) {
                    if (filterByRegion != state.filterByRegion ||
                        sortBy != state.sortBy ||
                        startDate != startDate ||
                        state.endDate != endDate) {
                      setState(() {
                        filterByRegion = state.filterByRegion;
                        sortBy = state.sortBy;
                        startDate = state.startDate;
                        endDate = state.endDate;
                        filterCount = state.count;
                      });
                    }
                  }
                },
                builder: (context, state) {
                  return CustomSearchBar(
                    controller: _controller,
                    hintText: 'Search',
                    filterCount: 0,
                    onSubmitted: (value) {
                      if (_controller.text.trim().isNotEmpty) {
                        context.read<HubFilterCubit>().searchTermChanged(
                          onHubPage: true,
                          searchTerm: _controller.text,
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) => BallotsBloc(
                                    webSocketService: context
                                        .read<WebSocketService>(),
                                  ),
                                ),
                                BlocProvider(
                                  create: (context) => SurveysBloc(
                                    webSocketService: context
                                        .read<WebSocketService>(),
                                  ),
                                ),
                                BlocProvider(
                                  create: (context) => MeetingsBloc(
                                    webSocketService: context
                                        .read<WebSocketService>(),
                                  ),
                                ),
                                BlocProvider(
                                  create: (context) => PetitionsBloc(
                                    webSocketService: context
                                        .read<WebSocketService>(),
                                  ),
                                ),
                              ],
                              child: _ResultsPage(
                                searchTerm: _controller.text,
                                filterByRegion: filterByRegion,
                                sortBy: sortBy,
                                startDate: startDate,
                                endDate: endDate,
                                filterCount: filterCount,
                              ),
                            ),
                          ),
                        ).whenComplete(() {
                          _controller.clear();
                          setState(() {
                            startDate = null;
                            endDate = null;
                            filterCount = 0;
                          });
                        });
                      }
                    },
                    onFilterTap: () {
                      final filterCubit = context.read<HubFilterCubit>();
                      showGeneralDialog(
                        context: context,
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return BlocProvider.value(
                            value: filterCubit,
                            child: _FiltersModal(
                              onHubPage: true,
                              filterByRegion: filterByRegion,
                              sortBy: sortBy,
                              startDate: startDate,
                              endDate: endDate,
                            ),
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: GridView.count(
        padding: EdgeInsets.all(padding),
        crossAxisCount: 2,
        mainAxisSpacing: padding,
        crossAxisSpacing: padding,
        children: [
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => BallotsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(create: (context) => BallotFilterCubit()),
                    ],
                    child: BallotPage(),
                  ),
                ),
              );
            },
            asset: 'assets/icons/ballot-box.svg',
            text: 'Ballots',
          ),
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => SurveysBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(create: (context) => SurveyFilterCubit()),
                    ],
                    child: SurveyPage(),
                  ),
                ),
              );
            },
            asset: 'assets/icons/question.svg',
            text: 'Surveys',
          ),
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => MeetingsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(create: (context) => MeetingFilterCubit()),
                    ],
                    child: MeetingPage(),
                  ),
                ),
              );
            },
            asset: 'assets/icons/meeting.svg',
            text: 'Meetings',
          ),
          _HubCard(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (context) => PetitionsBloc(
                          webSocketService: context.read<WebSocketService>(),
                        ),
                      ),
                      BlocProvider(create: (context) => PetitionFilterCubit()),
                    ],
                    child: PetitionPage(),
                  ),
                ),
              );
            },
            asset: 'assets/icons/signature.svg',
            text: 'Petitions',
          ),
        ],
      ),
    );
  }
}

class _HubCard extends StatelessWidget {
  const _HubCard({
    required this.onTap,
    required this.asset,
    required this.text,
  });

  final VoidCallback onTap;
  final String asset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.filled(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(asset, width: 60, height: 60),
            SizedBox(height: 10),
            Text(text, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _ResultsPage extends StatefulWidget {
  const _ResultsPage({
    required this.searchTerm,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
    required this.filterCount,
  });

  final String searchTerm;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;
  final int filterCount;

  @override
  State<_ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<_ResultsPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _controller = TextEditingController();
  late bool filterByRegion = widget.filterByRegion;
  late String sortBy = widget.sortBy;
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;
  late int filterCount = widget.filterCount;

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
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: SafeArea(
          child: BlocListener<HubFilterCubit, HubFilterState>(
            listener: (context, state) {
              if (state.searchTerm == widget.searchTerm) {
                setState(() {
                  filterByRegion = state.filterByRegion;
                  sortBy = state.sortBy;
                  startDate = state.startDate;
                  endDate = state.endDate;
                  filterCount = state.count;
                });
              }
            },
            child: NestedScrollView(
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
                            children: [BackButton(), _buildSearchBar()],
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
                      filterByRegion: filterByRegion,
                      sortBy: sortBy,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                    _SurveysTab(
                      searchTerm: widget.searchTerm,
                      filterByRegion: filterByRegion,
                      sortBy: sortBy,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                    _MeetingsTab(
                      searchTerm: widget.searchTerm,
                      filterByRegion: filterByRegion,
                      sortBy: sortBy,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                    _PetitionsTab(
                      searchTerm: widget.searchTerm,
                      filterByRegion: filterByRegion,
                      sortBy: sortBy,
                      startDate: startDate,
                      endDate: endDate,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    final filterCubit = context.read<HubFilterCubit>();
    return ResultsSearchBar(
      controller: _controller,
      filterCount: filterCount,
      filterModal: BlocProvider.value(
        value: filterCubit,
        child: _FiltersModal(
          onHubPage: false,
          filterByRegion: filterByRegion,
          sortBy: sortBy,
          startDate: startDate,
          endDate: endDate,
        ),
      ),
      onSubmitted: (value) {
        if (_controller.text.isNotEmpty &&
            widget.searchTerm != _controller.text) {
          context.read<HubFilterCubit>().searchTermChanged(
            onHubPage: false,
            searchTerm: _controller.text,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => _ResultsPage(
                searchTerm: _controller.text,
                filterByRegion: filterByRegion,
                sortBy: sortBy,
                startDate: startDate,
                endDate: endDate,
                filterCount: filterCount,
              ),
            ),
          ).whenComplete(() {
            _controller.text = widget.searchTerm;
          });
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

  void _getMeetings({List<Meeting>? previousMeetings}) {
    context.read<MeetingsBloc>().add(
      MeetingsEvent.get(
        previousMeetings: previousMeetings,
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
          final meetings = state.meetings.toList();

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
            if (state.meetings.isEmpty) {
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
              _getMeetings(previousMeetings: meetings);
            },
            footer: ClassicFooter(),
            child: meetings.isEmpty
                ? NoResults(text: 'No meetings')
                : ListView.builder(
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

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({
    required this.onHubPage,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final bool onHubPage;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
  late bool filterByRegion = widget.filterByRegion;
  late String sortBy = widget.sortBy;
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  bool get _isUnchanged =>
      filterByRegion == widget.filterByRegion &&
      sortBy == widget.sortBy &&
      startDate == widget.startDate &&
      endDate == widget.endDate;

  bool get _isDefaultState =>
      sortBy == 'recent' &&
      filterByRegion == true &&
      startDate == null &&
      endDate == null;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled: _isUnchanged,
      clearButtonIsDisabled: _isDefaultState,
      onApply: _applyFilters,
      onClear: _clearFilters,
      widgets: [
        FilterHeader(text: 'Sort by'),
        FormBuilderRadioGroup<String>(
          name: 'sort by',
          initialValue: sortBy,
          orientation: OptionsOrientation.vertical,
          decoration: InputDecoration(border: InputBorder.none),
          options: [
            FormBuilderFieldOption<String>(
              value: 'recent',
              child: Text('Newest first (default)'),
            ),
            FormBuilderFieldOption<String>(
              value: 'oldest',
              child: Text('Oldest first'),
            ),
          ],
          onChanged: (value) {
            setState(() {
              sortBy = value!;
            });
          },
        ),
        FilterHeader(text: 'Filter by region'),
        FormBuilderRadioGroup<bool>(
          name: 'region',
          initialValue: filterByRegion,
          orientation: OptionsOrientation.vertical,
          decoration: InputDecoration(border: InputBorder.none),
          options: [
            FormBuilderFieldOption<bool>(value: true, child: Text('Yes')),
            FormBuilderFieldOption<bool>(value: false, child: Text('No')),
          ],
          onChanged: (value) {
            setState(() {
              filterByRegion = value!;
            });
          },
        ),
        DateRangeFilter(
          value: [startDate, endDate],
          onValueChanged: (dates) {
            setState(() {
              startDate = dates.isNotEmpty ? dates[0] : null;
              endDate = dates.length == 2 ? dates[1] : null;
            });
          },
        ),
      ],
    );
  }

  void _applyFilters() {
    context.read<HubFilterCubit>().filtersChanged(
      onHubPage: widget.onHubPage,
      filterByRegion: filterByRegion,
      sortBy: sortBy,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      sortBy = 'recent';
      filterByRegion = true;
      startDate = null;
      endDate = null;
    });
  }
}
