import 'package:democracy/app/bloc/forms_search_and_filter/forms_search_and_filter_cubit.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/view/petition_create.dart';
import 'package:democracy/petition/view/petitions.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  Future<void> _handleTabSelection() async {
    if (_tabController.indexIsChanging) {
      context.read<FormsSearchAndFilterCubit>().tabChanged(
        status:
            _tabController.index == 0
                ? FormsSearchAndFilterStatus.onSurveys
                : FormsSearchAndFilterStatus.onPetitions,
      );
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
            CustomAppBar(
              user: widget.user,
              notifications: widget.notifications,
              middle: [FormsSearchBar(controller: _searchController)],
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
          children: [Surveys(), PetitionsTab()],
        ),
      ),
    );
  }
}

class FormsSearchBar extends StatelessWidget {
  const FormsSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FormsSearchAndFilterCubit, FormsSearchAndFilterState>(
      listener: (context, state) {
        if (state.status == FormsSearchAndFilterStatus.onSurveys) {
          controller.text = state.surveysSearchTerm;
        }
        if (state.status == FormsSearchAndFilterStatus.onPetitions) {
          controller.text = state.petitionsSearchTerm;
        }
      },
      builder: (context, state) {
        return AppBarSearchBar(
          controller: controller,
          hintText:
              state.status == FormsSearchAndFilterStatus.onSurveys
                  ? 'Search surveys'
                  : 'Search petitions',
          onChanged: (value) {
            context.read<FormsSearchAndFilterCubit>().search(searchTerm: value);
            state.status == FormsSearchAndFilterStatus.onSurveys
                ? context.read<SurveysBloc>().add(
                  SurveysEvent.get(searchTerm: state.surveysSearchTerm),
                )
                : context.read<PetitionsBloc>().add(
                  PetitionsEvent.get(searchTerm: state.petitionsSearchTerm),
                );
          },
          showFilterIcon: true,
          onFilterTap: () {
            //   TODO:
          },
        );
      },
    );
  }
}

class PetitionsTab extends StatefulWidget {
  const PetitionsTab({super.key});

  @override
  State<PetitionsTab> createState() => _PetitionsTabState();
}

class _PetitionsTabState extends State<PetitionsTab> {
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
