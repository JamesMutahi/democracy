import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/view/widgets/petitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

@RoutePage()
class PetitionPage extends StatefulWidget {
  const PetitionPage({super.key});

  @override
  State<PetitionPage> createState() => _PetitionPageState();
}

class _PetitionPageState extends State<PetitionPage> {
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
              PetitionsBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(create: (context) => PetitionFilterCubit()),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                forceElevated: true,
                title: Text('Petitions'),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: BlocConsumer<PetitionFilterCubit, PetitionFilterState>(
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
                        controller: _controller,
                        hintText: 'Search',
                        filterCount: state.count,
                        onChanged: (value) {
                          context.read<PetitionFilterCubit>().searchTermChanged(
                            searchTerm: value,
                          );
                        },
                        onFilterTap: () {
                          final filterCubit = context
                              .read<PetitionFilterCubit>();
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            shape: const BeveledRectangleBorder(),
                            useSafeArea: true,
                            builder: (context) {
                              return BlocProvider.value(
                                value: filterCubit,
                                child: _FiltersModal(
                                  isOpen: state.isOpen,
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
          body: Petitions(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.router.push(PetitionCreate());
          },
          child: Icon(Symbols.create_rounded),
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
      isOpen == true &&
      sortBy == 'popular' &&
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
          initialValue: isOpen,
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
              isOpen = value;
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
          initialValue: startDate == null || endDate == null
              ? null
              : DateTimeRange(start: startDate!, end: endDate!),
          onChanged: (value) {
            setState(() {
              startDate = value?.start;
              endDate = value?.end;
            });
          },
        ),
      ],
    );
  }

  void _applyFilters() {
    context.read<PetitionFilterCubit>().filtersChanged(
      isOpen: isOpen,
      filterByRegion: filterByRegion,
      sortBy: sortBy,
      startDate: startDate,
      endDate: endDate,
    );
  }

  void _clearFilters() {
    setState(() {
      isOpen = true;
      sortBy = 'popular';
      filterByRegion = true;
      startDate = null;
      endDate = null;
    });
  }
}
