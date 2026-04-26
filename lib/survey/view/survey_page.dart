import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/view/widgets/surveys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              floating: true,
              snap: true,
              forceElevated: true,
              title: Text('Surveys'),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0),
                child: BlocConsumer<SurveyFilterCubit, SurveyFilterState>(
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
                      controller: _controller,
                      hintText: 'Search',
                      filterCount: state.count,
                      onChanged: (value) {
                        context.read<SurveyFilterCubit>().searchTermChanged(
                          searchTerm: value,
                        );
                      },
                      onFilterTap: () {
                        final filterCubit = context.read<SurveyFilterCubit>();
                        showGeneralDialog(
                          context: context,
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                                return BlocProvider.value(
                                  value: filterCubit,
                                  child: _FiltersModal(
                                    isActive: state.isActive,
                                    filterByRegion: state.filterByRegion,
                                    sortBy: state.sortBy,
                                    startDate: state.startDate,
                                    endDate: state.endDate,
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
        body: Surveys(),
      ),
    );
  }
}

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({
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
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
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
            FormBuilderFieldOption<bool?>(value: false, child: Text('Closed')),
            FormBuilderFieldOption<bool?>(value: null, child: Text('Show all')),
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
