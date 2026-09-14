import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/notification/bloc/notification_detail/notification_detail_bloc.dart';
import 'package:democracy/petition/bloc/petition_filter/petition_filter_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_listener.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:responsive_framework/responsive_framework.dart';

class Petitions extends StatefulWidget {
  const Petitions({super.key});

  @override
  State<Petitions> createState() => _PetitionsState();
}

class _PetitionsState extends State<Petitions>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final ScrollController _scrollController = ScrollController();
  final RefreshController _refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    context.read<PetitionsBloc>().add(
      PetitionsEvent.get(
        isOpen: defaultIsOpen,
        filterByRegion: defaultFilterByRegion,
      ),
    );
    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    // Clear the registry when leaving
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    final responsive = ResponsiveBreakpoints.of(context);
    final isWebLayout = kIsWeb && responsive.largerThan(MOBILE);

    return BlocListener<NotificationDetailBloc, NotificationDetailState>(
      listener: (context, state) {
        if (state is NotificationCreated) {
          if (state.notification.petition != null) {
            final petitionsBloc = context.read<PetitionsBloc>();
            final petition = state.notification.petition;
            petitionsBloc.add(PetitionsEvent.add(petition: petition!));
          }
        }
      },
      child: BlocBuilder<PetitionFilterCubit, PetitionFilterState>(
        builder: (context, filterState) {
          return BlocBuilder<PetitionsBloc, PetitionsState>(
            builder: (context, petitionsState) {
              final petitions = petitionsState.petitions.toList();

              if (petitionsState.status == PetitionsStatus.initial ||
                  (petitionsState.status == PetitionsStatus.loading &&
                      petitions.isEmpty)) {
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

                if (petitionsState.petitions.isEmpty) {
                  return FailureRetryButton(
                    onPressed: () => context.read<PetitionsBloc>().add(
                      PetitionsEvent.get(searchTerm: filterState.searchTerm),
                    ),
                  );
                }
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

              return PetitionListener(
                petitions: petitions,
                onCreate: (petition) {
                  context.read<PetitionsBloc>().add(
                    PetitionsEvent.add(petition: petition),
                  );
                },
                onUpdate: (petitions) {
                  context.read<PetitionsBloc>().add(
                    PetitionsEvent.update(petitions: petitions),
                  );
                },
                onDelete: (petitionId) {
                  context.read<PetitionsBloc>().add(
                    PetitionsEvent.remove(petitionId: petitionId),
                  );
                },
                child: SmartRefresher(
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
                    controller: isWebLayout ? _scrollController : null,
                    physics: isWebLayout ? NeverScrollableScrollPhysics(): null,
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
                ),
              );
            },
          );
        },
      ),
    );
  }
}
