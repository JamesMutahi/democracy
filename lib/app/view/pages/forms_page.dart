import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/petition/view/petition_create.dart';
import 'package:democracy/petition/view/petitions.dart';
import 'package:democracy/survey/view/surveys.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage>
    with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController.index;
        _searchController.clear();
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              automaticallyImplyLeading: false,
              forceElevated: true,
              flexibleSpace: CustomAppBar(
                user: widget.user,
                notifications: widget.notifications,
                extras: [
                  AppBarSearchBar(
                    controller: _searchController,
                    hintText:
                        'Search ${_currentTabIndex == 0 ? 'surveys' : 'petitions'}',
                    onChanged: (value) {
                      _currentTabIndex == 0
                          ? context.read<WebsocketBloc>().add(
                            WebsocketEvent.getSurveys(searchTerm: value),
                          )
                          : context.read<WebsocketBloc>().add(
                            WebsocketEvent.getPetitions(searchTerm: value),
                          );
                    },
                  ),
                ],
              ),
              bottom: TabBar(
                controller: _tabController,
                dividerColor: Theme.of(context).colorScheme.outlineVariant,
                labelStyle: Theme.of(context).textTheme.titleMedium,
                tabs: [Tab(text: 'Surveys'), Tab(text: 'Petitions')],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          physics: NeverScrollableScrollPhysics(),
          children: [SurveysTab(), PetitionsTab()],
        ),
      ),
    );
  }
}

class SurveysTab extends StatefulWidget {
  const SurveysTab({super.key});

  @override
  State<SurveysTab> createState() => _SurveysTabState();
}

class _SurveysTabState extends State<SurveysTab> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getSurveys());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Surveys();
  }
}

class PetitionsTab extends StatefulWidget {
  const PetitionsTab({super.key});

  @override
  State<PetitionsTab> createState() => _PetitionsTabState();
}

class _PetitionsTabState extends State<PetitionsTab> {
  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPetitions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Petitions(),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            margin: EdgeInsets.only(right: 10, bottom: 10),
            child: FloatingActionButton(
              heroTag: 'petition',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CreatePetition()),
                );
              },
              child: Icon(Icons.add_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
