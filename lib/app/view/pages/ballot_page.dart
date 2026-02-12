import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/view/ballots.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class BallotPage extends StatefulWidget {
  const BallotPage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final int notifications;

  @override
  State<BallotPage> createState() => _BallotPageState();
}

class _BallotPageState extends State<BallotPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text(
              'Ballots',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: BlocConsumer<BallotFilterCubit, BallotFilterState>(
                listener: (context, state) {
                  context.read<BallotsBloc>().add(
                    BallotsEvent.get(
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
                    hintText: 'Search',
                    onChanged: (value) {
                      context.read<BallotFilterCubit>().searchTermChanged(
                        searchTerm: value,
                      );
                    },
                    onFilterTap: () {
                      showGeneralDialog(
                        context: context,
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return _FiltersModal(
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
              ),
            ),
          ),
        ];
      },
      body: Ballots(),
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

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled:
          isActive == widget.isActive &&
          filterByRegion == widget.filterByRegion &&
          sortBy == widget.sortBy &&
          startDate == widget.startDate &&
          endDate == widget.endDate,
      clearButtonIsDisabled:
          isActive == true &&
          sortBy == 'recent' &&
          filterByRegion == true &&
          startDate == null &&
          endDate == null,
      onApply: () {
        context.read<BallotFilterCubit>().filtersChanged(
          isActive: isActive,
          filterByRegion: filterByRegion,
          sortBy: sortBy,
          startDate: startDate,
          endDate: endDate,
        );
      },
      onClear: () {
        context.read<BallotFilterCubit>().clearFilters();
        Navigator.pop(context);
      },
      widgets: [
        Text('Status:', style: Theme.of(context).textTheme.titleMedium),
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
        Divider(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            'Sort by:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
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
        Divider(),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(
            'Filter by region:',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
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
        Divider(),
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
}
