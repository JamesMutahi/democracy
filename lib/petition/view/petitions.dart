import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class Petitions extends StatefulWidget {
  const Petitions({super.key});

  @override
  State<Petitions> createState() => _PetitionsState();
}

class _PetitionsState extends State<Petitions>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<PetitionsBloc>().add(
      PetitionsEvent.get(isOpen: true, filterByRegion: true),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
      listener: (context, state) {
        final petitionsBloc = context.read<PetitionsBloc>();

        if (state is PetitionCreated) {
          petitionsBloc.add(PetitionsEvent.add(petition: state.petition));
        } else if (state is PetitionLoaded) {
          petitionsBloc.add(PetitionsEvent.update(petition: state.petition));
        } else if (state is PetitionUpdated) {
          petitionsBloc.add(PetitionsEvent.update(petition: state.petition));
        } else if (state is PetitionDeleted) {
          petitionsBloc.add(
            PetitionsEvent.remove(petitionId: state.petitionId),
          );
        }
      },
      child: BlocBuilder<PetitionFilterCubit, PetitionFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<PetitionsBloc, PetitionsState>(
            builder: (context, petitionsState) {
              final petitions = petitionsState.petitions;

              if (petitionsState.status == PetitionsStatus.loading) {
                return const BottomLoader();
              }

              if (petitionsState.status == PetitionsStatus.success) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              }

              if (petitionsState.status == PetitionsStatus.failure) {
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshFailed();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadFailed();
                }
                return FailureRetryButton(
                  onPressed: () => context.read<PetitionsBloc>().add(
                    PetitionsEvent.get(searchTerm: filterState.searchTerm),
                  ),
                );
              }

              void getPetitions({List<Petition>? previousPetitions}) {
                context.read<PetitionsBloc>().add(
                  PetitionsEvent.get(
                    previousPetitions: previousPetitions,
                    searchTerm: filterState.searchTerm,
                    isOpen: filterState.isOpen,
                    sortBy: filterState.sortBy,
                    filterByRegion: filterState.filterByRegion,
                    startDate: filterState.startDate,
                    endDate: filterState.endDate,
                  ),
                );
              }

              return SmartRefresher(
                enablePullDown: true,
                enablePullUp: petitionsState.hasNext,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: getPetitions,
                onLoading: () {
                  getPetitions(previousPetitions: petitions);
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  padding: EdgeInsets.all(15),
                  itemBuilder: (BuildContext context, int index) {
                    Petition petition = petitions[index];
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: PetitionTile(
                        key: ValueKey(petition.id),
                        petition: petition,
                        isDependency: false,
                      ),
                    );
                  },
                  itemCount: petitions.length,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
