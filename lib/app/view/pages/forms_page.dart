import 'package:democracy/app/bloc/forms_tab_bar/forms_tab_bar_cubit.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/view/petition_create.dart';
import 'package:democracy/petition/view/petitions.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
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
      context.read<FormsTabBarCubit>().tabChanged(
        status: _tabController.index == 0
            ? FormsTabBarStatus.onSurveys
            : FormsTabBarStatus.onPetitions,
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
                tabs: [
                  Tab(text: 'Surveys'),
                  Tab(text: 'Petitions'),
                ],
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
    return BlocBuilder<FormsTabBarCubit, FormsTabBarState>(
      builder: (context, state) {
        return switch (state.status) {
          FormsTabBarStatus.onSurveys => _SurveysSearchBar(
            controller: controller,
          ),
          FormsTabBarStatus.onPetitions => _PetitionsSearchBar(
            controller: controller,
          ),
        };
      },
    );
  }
}

class _SurveysSearchBar extends StatelessWidget {
  const _SurveysSearchBar({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SurveyFilterCubit, SurveyFilterState>(
      listener: (context, state) {
        context.read<SurveysBloc>().add(
          SurveysEvent.get(
            searchTerm: state.searchTerm,
            startDate: state.startDate,
            endDate: state.endDate,
          ),
        );
      },
      builder: (context, state) {
        controller.text = state.searchTerm;
        return Expanded(
          child: CustomSearchBar(
            controller: controller,
            hintText: 'Search surveys',
            onChanged: (value) {
              context.read<SurveyFilterCubit>().searchTermChanged(
                searchTerm: value,
              );
            },
            onFilterTap: () {
              showGeneralDialog(
                context: context,
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return _FiltersModal(
                    startDate: state.startDate,
                    endDate: state.endDate,
                    formsTabBarStatus: FormsTabBarStatus.onSurveys,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _PetitionsSearchBar extends StatelessWidget {
  const _PetitionsSearchBar({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PetitionFilterCubit, PetitionFilterState>(
      listener: (context, state) {
        context.read<PetitionsBloc>().add(
          PetitionsEvent.get(
            searchTerm: state.searchTerm,
            startDate: state.startDate,
            endDate: state.endDate,
          ),
        );
      },
      builder: (context, state) {
        controller.text = state.searchTerm;
        return Expanded(
          child: CustomSearchBar(
            controller: controller,
            hintText: 'Search petitions',
            onChanged: (value) {
              context.read<PetitionFilterCubit>().searchTermChanged(
                searchTerm: value,
              );
            },
            onFilterTap: () {
              showGeneralDialog(
                context: context,
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) {
                  return _FiltersModal(
                    startDate: state.startDate,
                    endDate: state.endDate,
                    formsTabBarStatus: FormsTabBarStatus.onPetitions,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class PetitionsTab extends StatelessWidget {
  const PetitionsTab({super.key});

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

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({
    required this.startDate,
    required this.endDate,
    required this.formsTabBarStatus,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final FormsTabBarStatus formsTabBarStatus;

  @override
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsTabBarCubit, FormsTabBarState>(
      builder: (context, state) {
        return FiltersModal(
          applyButtonIsDisabled:
              (startDate == widget.startDate && endDate == widget.startDate),
          clearButtonIsDisabled: startDate == null && endDate == null,
          onApply: () {
            switch (widget.formsTabBarStatus) {
              case FormsTabBarStatus.onSurveys:
                context.read<SurveyFilterCubit>().datesChanged(
                  startDate: startDate,
                  endDate: endDate,
                );
              case FormsTabBarStatus.onPetitions:
                context.read<PetitionFilterCubit>().datesChanged(
                  startDate: startDate,
                  endDate: endDate,
                );
            }
          },
          onClear: () {
            switch (widget.formsTabBarStatus) {
              case FormsTabBarStatus.onSurveys:
                context.read<SurveyFilterCubit>().clearFilters();
              case FormsTabBarStatus.onPetitions:
                context.read<PetitionFilterCubit>().clearFilters();
            }
            setState(() {
              startDate = null;
              endDate = null;
            });
          },
          widgets: [
            DateRangeFilter(
              value: [startDate, endDate],
              onValueChanged: (dates) {
                setState(() {
                  startDate = dates.isNotEmpty ? dates[0] : null;
                  endDate = dates.length == 2 ? dates[1] : null;
                });
              },
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
