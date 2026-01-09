import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/ballot/bloc/ballot_filter/ballot_filter_cubit.dart';
import 'package:democracy/ballot/bloc/ballots/ballots_bloc.dart';
import 'package:democracy/ballot/view/ballots.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            middle: [
              BlocConsumer<BallotFilterCubit, BallotFilterState>(
                listener: (context, state) {
                  context.read<BallotsBloc>().add(
                    BallotsEvent.get(
                      searchTerm: state.searchTerm,
                      startDate: state.startDate,
                      endDate: state.endDate,
                    ),
                  );
                },
                builder: (context, state) {
                  return Expanded(
                    child: CustomSearchBar(
                      hintText: 'Search ballots',
                      onChanged: (value) {
                        context.read<BallotFilterCubit>().searchTermChanged(
                          searchTerm: value,
                        );
                      },
                      onFilterTap: () {
                        showGeneralDialog(
                          context: context,
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                                return _FiltersModal(
                                  startDate: state.startDate,
                                  endDate: state.endDate,
                                );
                              },
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ];
      },
      body: Ballots(),
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
        context.read<BallotFilterCubit>().datesChanged(
          startDate: startDate,
          endDate: endDate,
        );
      },
      onClear: () {
        context.read<BallotFilterCubit>().clearFilters();
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
