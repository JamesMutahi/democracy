import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/meet/bloc/meeting_filter/meeting_filter_cubit.dart';
import 'package:democracy/meet/bloc/meetings/meetings_bloc.dart';
import 'package:democracy/meet/view/meetings.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MeetingsPage extends StatefulWidget {
  const MeetingsPage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final int notifications;

  @override
  State<MeetingsPage> createState() => _MeetingsPageState();
}

class _MeetingsPageState extends State<MeetingsPage> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text(
              'Meetings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: BlocConsumer<MeetingFilterCubit, MeetingFilterState>(
                listener: (context, state) {
                  context.read<MeetingsBloc>().add(
                    MeetingsEvent.get(
                      searchTerm: state.searchTerm,
                      startDate: state.startDate,
                      endDate: state.endDate,
                    ),
                  );
                },
                builder: (context, state) {
                  return CustomSearchBar(
                    hintText: 'Search',
                    onChanged: (value) {
                      context.read<MeetingFilterCubit>().searchTermChanged(
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
    );
  }
}

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({required this.startDate, required this.endDate});

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled:
          (startDate == widget.startDate && endDate == widget.startDate),
      clearButtonIsDisabled: startDate == null && endDate == null,
      onApply: () {
        context.read<MeetingFilterCubit>().datesChanged(
          startDate: startDate,
          endDate: endDate,
        );
      },
      onClear: () {
        context.read<MeetingFilterCubit>().clearFilters();
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
  }
}
