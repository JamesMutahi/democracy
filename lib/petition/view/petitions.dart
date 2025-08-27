import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_cubit.dart';
import 'package:democracy/petition/bloc/petitions/petitions_cubit.dart';
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

class _PetitionsState extends State<Petitions> {
  bool loading = true;
  bool failure = false;
  List<Petition> _petitions = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<WebsocketBloc>().add(WebsocketEvent.getPetitions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<WebsocketBloc>().add(
                WebsocketEvent.resubscribePetitions(petitions: _petitions),
              );
            }
          },
        ),
        BlocListener<PetitionsCubit, PetitionsState>(
          listener: (context, state) {
            if (state.status == PetitionsStatus.success) {
              setState(() {
                loading = false;
                failure = false;
                _petitions = state.petitions;
                hasNextPage = state.hasNext;
                if (_refreshController.headerStatus ==
                    RefreshStatus.refreshing) {
                  _refreshController.refreshCompleted();
                }
                if (_refreshController.footerStatus == LoadStatus.loading) {
                  _refreshController.loadComplete();
                }
              });
            }
            if (state.status == PetitionsStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
        BlocListener<PetitionDetailCubit, PetitionDetailState>(
          listener: (context, state) {
            if (state is PetitionCreated) {
              if (!_petitions.any(
                (petition) => petition.id == state.petition.id,
              )) {
                setState(() {
                  _petitions.add(state.petition);
                });
              }
            }
            if (state is PetitionUpdated) {
              if (_petitions.any(
                (petition) => petition.id == state.petition.id,
              )) {
                setState(() {
                  int index = _petitions.indexWhere(
                    (petition) => petition.id == state.petition.id,
                  );
                  _petitions[index] = state.petition;
                });
              }
            }
            if (state is PetitionDeleted) {
              if (_petitions.any(
                (petition) => petition.id == state.petitionId,
              )) {
                setState(() {
                  _petitions.removeWhere(
                    (petition) => petition.id == state.petitionId,
                  );
                });
              }
            }
          },
        ),
      ],
      child:
          loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(
                onPressed: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getPetitions(),
                  );
                },
              )
              : SmartRefresher(
                enablePullDown: true,
                enablePullUp: hasNextPage,
                header: ClassicHeader(),
                controller: _refreshController,
                onRefresh: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getPetitions(),
                  );
                },
                onLoading: () {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.getPetitions(lastPetition: _petitions.last),
                  );
                },
                footer: ClassicFooter(),
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    Petition petition = _petitions[index];
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: PetitionTile(
                            key: ValueKey(petition.id),
                            petition: petition,
                            isDependency: false,
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: _petitions.length,
                ),
              ),
    );
  }
}
