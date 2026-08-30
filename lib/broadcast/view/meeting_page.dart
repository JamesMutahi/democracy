import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/broadcast/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/broadcast/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/broadcast/view/widgets/meetings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

@RoutePage()
class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key});

  @override
  State<MeetingPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingPage> {
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
              MeetingsBloc(webSocketService: context.read<WebSocketService>()),
        ),
        BlocProvider(create: (context) => MeetingFilterCubit()),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                forceElevated: true,
                title: Text('Meetings'),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: BlocConsumer<MeetingFilterCubit, MeetingFilterState>(
                    listener: (context, state) {
                      context.read<MeetingsBloc>().add(
                        MeetingsEvent.get(
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
                          context.read<MeetingFilterCubit>().searchTermChanged(
                            searchTerm: value,
                          );
                        },
                        onFilterTap: () {
                          final filterCubit = context
                              .read<MeetingFilterCubit>();
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
          body: Meetings(),
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
          initialValue: isOpen,
          orientation: OptionsOrientation.vertical,
          decoration: InputDecoration(border: InputBorder.none),
          options: [
            FormBuilderFieldOption<bool?>(
              value: null,
              child: Text('Show all (default)'),
            ),
            FormBuilderFieldOption<bool?>(value: true, child: Text('Open')),
            FormBuilderFieldOption<bool?>(value: false, child: Text('Closed')),
          ],
          onChanged: (value) {
            setState(() => isOpen = value);
          },
        ),
        FilterHeader(text: 'Filter by region'),
        FormBuilderRadioGroup<bool>(
          name: 'region',
          initialValue: filterByRegion,
          orientation: OptionsOrientation.vertical,
          decoration: InputDecoration(border: InputBorder.none),
          options: [
            FormBuilderFieldOption<bool>(
              value: true,
              child: Text('Yes (default)'),
            ),
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
    context.read<MeetingFilterCubit>().filtersChanged(
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
      sortBy = 'recent';
      filterByRegion = true;
      startDate = null;
      endDate = null;
    });
  }
}
