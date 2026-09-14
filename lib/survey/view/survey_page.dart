import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/survey/bloc/survey_filter/survey_filter_cubit.dart';
import 'package:democracy/survey/bloc/surveys/surveys_bloc.dart';
import 'package:democracy/survey/view/widgets/surveys.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

@RoutePage()
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              SurveysBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(create: (context) => SurveyFilterCubit()),
      ],
      child: MainContainer(
        child: Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, bool innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: kIsWeb,
                  floating: !kIsWeb,
                  snap: !kIsWeb,
                  forceElevated: true,
                  title: Text('Surveys'),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(60.0),
                    child: BlocConsumer<SurveyFilterCubit, SurveyFilterState>(
                      listener: (context, state) {
                        context.read<SurveysBloc>().add(
                          SurveysEvent.get(
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
                          controller: _controller,
                          hintText: 'Search',
                          filterCount: state.count,
                          onChanged: (value) {
                            context.read<SurveyFilterCubit>().searchTermChanged(
                              searchTerm: value,
                            );
                          },
                          onFilterTap: () {
                            final filterCubit = context
                                .read<SurveyFilterCubit>();
                            final filters = BlocProvider.value(
                              value: filterCubit,
                              child: _FiltersModal(
                                isOpen: state.isOpen,
                                filterByRegion: state.filterByRegion,
                                sortBy: state.sortBy,
                                startDate: state.startDate,
                                endDate: state.endDate,
                              ),
                            );
                            kIsWeb
                                ? showDialog(
                                    context: context,
                                    builder: (context) => filters,
                                  )
                                : showGeneralDialog(
                                    context: context,
                                    transitionDuration: const Duration(
                                      milliseconds: 300,
                                    ),
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => filters,
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
        ),
      ),
    );
  }
}

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({
    required this.isOpen,
    required this.filterByRegion,
    required this.sortBy,
    required this.startDate,
    required this.endDate,
  });

  final bool? isOpen;
  final bool filterByRegion;
  final String sortBy;
  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
  late bool? isOpen = widget.isOpen;
  late bool filterByRegion = widget.filterByRegion;
  late String sortBy = widget.sortBy;
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  bool get _isUnchanged =>
      isOpen == widget.isOpen &&
      filterByRegion == widget.filterByRegion &&
      sortBy == widget.sortBy &&
      startDate == widget.startDate &&
      endDate == widget.endDate;

  bool get _isDefaultState =>
      isOpen == defaultIsOpen &&
      sortBy == defaultSortBy &&
      filterByRegion == defaultFilterByRegion &&
      startDate == defaultStartDate &&
      endDate == defaultEndDate;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled: _isUnchanged,
      clearButtonIsDisabled: _isDefaultState,
      onApply: _applyFilters,
      onClear: _clearFilters,
      widgets: [
        _buildSection(
          title: 'Sort by',
          child: FormBuilderRadioGroup<String>(
            key: ValueKey('sortBy_$sortBy'),
            name: 'sort by',
            initialValue: sortBy,
            orientation: OptionsOrientation.vertical,
            decoration: const InputDecoration(border: InputBorder.none),
            options: const [
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
              if (value != null) setState(() => sortBy = value);
            },
          ),
        ),
        _buildSection(
          title: 'Status',
          child: FormBuilderRadioGroup<bool?>(
            key: ValueKey('isOpen_$isOpen'),
            name: 'open',
            initialValue: isOpen,
            orientation: OptionsOrientation.vertical,
            decoration: const InputDecoration(border: InputBorder.none),
            options: const [
              FormBuilderFieldOption<bool?>(
                value: null,
                child: Text('Show all (default)'),
              ),
              FormBuilderFieldOption<bool?>(value: true, child: Text('Open')),
              FormBuilderFieldOption<bool?>(
                value: false,
                child: Text('Closed'),
              ),
            ],
            onChanged: (value) => setState(() => isOpen = value),
          ),
        ),
        _buildSection(
          title: 'Filter by region',
          child: FormBuilderRadioGroup<bool>(
            key: ValueKey('region_$filterByRegion'),
            name: 'region',
            initialValue: filterByRegion,
            orientation: OptionsOrientation.vertical,
            decoration: const InputDecoration(border: InputBorder.none),
            options: const [
              FormBuilderFieldOption<bool>(
                value: true,
                child: Text('Yes (default)'),
              ),
              FormBuilderFieldOption<bool>(value: false, child: Text('No')),
            ],
            onChanged: (value) {
              if (value != null) setState(() => filterByRegion = value);
            },
          ),
        ),
        _buildSection(
          title: 'Date Range',
          child: DateRangeFilter(
            key: ValueKey('dateRange_${startDate}_$endDate'),
            initialValue: (startDate != null && endDate != null)
                ? DateTimeRange(start: startDate!, end: endDate!)
                : null,
            onChanged: (value) {
              setState(() {
                startDate = value?.start;
                endDate = value?.end;
              });
            },
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24.0, bottom: 12.0),
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurfaceVariant,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),
      ],
    );
  }

  void _applyFilters() {
    context.read<SurveyFilterCubit>().filtersChanged(
      isOpen: isOpen,
      filterByRegion: filterByRegion,
      sortBy: sortBy,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      isOpen = defaultIsOpen;
      sortBy = defaultSortBy;
      filterByRegion = defaultFilterByRegion;
      startDate = defaultStartDate;
      endDate = defaultEndDate;
    });
  }
}
