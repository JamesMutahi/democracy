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
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormsPage extends StatefulWidget {
  const FormsPage({super.key, required this.user, required this.notifications});

  final User user;
  final int notifications;

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _surveyController = TextEditingController();
  final TextEditingController _petitionController = TextEditingController();

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
    _surveyController.dispose();
    _petitionController.dispose();
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text(
              'Forms',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(100.0),
              child: Column(
                children: [
                  TabBar(
                    controller: _tabController,
                    labelStyle: Theme.of(context).textTheme.titleMedium,
                    tabs: [
                      Tab(text: 'Surveys'),
                      Tab(text: 'Petitions'),
                    ],
                  ),
                  FormsSearchBar(
                    surveyController: _surveyController,
                    petitionController: _petitionController,
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [Surveys(), PetitionsTab()],
      ),
    );
  }
}

class FormsSearchBar extends StatelessWidget {
  const FormsSearchBar({
    super.key,
    required this.surveyController,
    required this.petitionController,
  });

  final TextEditingController surveyController;
  final TextEditingController petitionController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsTabBarCubit, FormsTabBarState>(
      builder: (context, state) {
        return switch (state.status) {
          FormsTabBarStatus.onSurveys => _SurveysSearchBar(
            controller: surveyController,
          ),
          FormsTabBarStatus.onPetitions => _PetitionsSearchBar(
            controller: petitionController,
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
            isActive: state.isActive,
            sortBy: state.sortBy,
            filterByRegion: state.filterByRegion,
            startDate: state.startDate,
            endDate: state.endDate,
          ),
        );
      },
      builder: (context, state) {
        return CustomSearchBar(
          controller: controller,
          hintText: 'Search surveys',
          filterCount: state.count,
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
                return _SurveyFiltersModal(
                  isActive: state.isActive,
                  filterByRegion: state.filterByRegion,
                  sortBy: state.sortBy,
                  startDate: state.startDate,
                  endDate: state.endDate,
                );
              },
            );
          },
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
            isOpen: state.isOpen,
            sortBy: state.sortBy,
            filterByRegion: state.filterByRegion,
            startDate: state.startDate,
            endDate: state.endDate,
          ),
        );
      },
      builder: (context, state) {
        return CustomSearchBar(
          controller: controller,
          hintText: 'Search petitions',
          filterCount: state.count,
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
                return _PetitionFiltersModal(
                  isActive: state.isOpen,
                  filterByRegion: state.filterByRegion,
                  sortBy: state.sortBy,
                  startDate: state.startDate,
                  endDate: state.endDate,
                );
              },
            );
          },
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

class _SurveyFiltersModal extends StatefulWidget {
  const _SurveyFiltersModal({
    required this.isActive,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final bool? isActive;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_SurveyFiltersModal> createState() => _SurveyFiltersModalState();
}

class _SurveyFiltersModalState extends State<_SurveyFiltersModal> {
  late bool? isActive = widget.isActive;
  late bool filterByRegion = widget.filterByRegion;
  late String sortBy = widget.sortBy;
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  bool get _isUnchanged =>
      isActive == widget.isActive &&
      filterByRegion == widget.filterByRegion &&
      sortBy == widget.sortBy &&
      startDate == widget.startDate &&
      endDate == widget.endDate;

  bool get _isDefaultState =>
      isActive == true &&
      sortBy == 'recent' &&
      filterByRegion == true &&
      startDate == null &&
      endDate == null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsTabBarCubit, FormsTabBarState>(
      builder: (context, state) {
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
            FilterHeader(text: 'Status'),
            FormBuilderRadioGroup<bool?>(
              name: 'active',
              initialValue: isActive,
              orientation: OptionsOrientation.vertical,
              decoration: InputDecoration(border: InputBorder.none),
              options: [
                FormBuilderFieldOption<bool?>(
                  value: true,
                  child: Text('Open (default)'),
                ),
                FormBuilderFieldOption<bool?>(
                  value: false,
                  child: Text('Closed'),
                ),
                FormBuilderFieldOption<bool?>(
                  value: null,
                  child: Text('Show all'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  isActive = value;
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
      },
    );
  }

  void _applyFilters() {
    context.read<SurveyFilterCubit>().filtersChanged(
      isActive: isActive,
      filterByRegion: filterByRegion,
      sortBy: sortBy,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      isActive = true;
      sortBy = 'recent';
      filterByRegion = true;
      startDate = null;
      endDate = null;
    });
  }
}

class _PetitionFiltersModal extends StatefulWidget {
  const _PetitionFiltersModal({
    required this.isActive,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final bool? isActive;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_PetitionFiltersModal> createState() => _PetitionFiltersModalState();
}

class _PetitionFiltersModalState extends State<_PetitionFiltersModal> {
  late bool? isActive = widget.isActive;
  late bool filterByRegion = widget.filterByRegion;
  late String sortBy = widget.sortBy;
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  bool get _isUnchanged =>
      isActive == widget.isActive &&
      filterByRegion == widget.filterByRegion &&
      sortBy == widget.sortBy &&
      startDate == widget.startDate &&
      endDate == widget.endDate;

  bool get _isDefaultState =>
      isActive == true &&
      sortBy == 'popular' &&
      filterByRegion == true &&
      startDate == null &&
      endDate == null;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormsTabBarCubit, FormsTabBarState>(
      builder: (context, state) {
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
                  value: 'popular',
                  child: Text('Most supporters (default)'),
                ),
                FormBuilderFieldOption<String>(
                  value: 'recent',
                  child: Text('Newest first'),
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

            FilterHeader(text: 'Status'),
            FormBuilderRadioGroup<bool?>(
              name: 'active',
              initialValue: isActive,
              orientation: OptionsOrientation.vertical,
              decoration: InputDecoration(border: InputBorder.none),
              options: [
                FormBuilderFieldOption<bool?>(
                  value: true,
                  child: Text('Open (default)'),
                ),
                FormBuilderFieldOption<bool?>(
                  value: false,
                  child: Text('Closed'),
                ),
                FormBuilderFieldOption<bool?>(
                  value: null,
                  child: Text('Show all'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  isActive = value;
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
      },
    );
  }

  void _applyFilters() {
    context.read<PetitionFilterCubit>().filtersChanged(
      isOpen: isActive,
      filterByRegion: filterByRegion,
      sortBy: sortBy,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      isActive = true;
      sortBy = 'popular';
      filterByRegion = true;
      startDate = null;
      endDate = null;
    });
  }
}
