import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
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

  bool loading = true;
  bool failure = false;
  List<Petition> _petitions = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<PetitionsBloc>().add(PetitionsEvent.get());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<PetitionsBloc>().add(
                PetitionsEvent.resubscribe(petitions: _petitions),
              );
            }
          },
        ),
        BlocListener<PetitionsBloc, PetitionsState>(
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
        BlocListener<PetitionDetailBloc, PetitionDetailState>(
          listener: (context, state) {
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
      child: loading
          ? BottomLoader()
          : failure
          ? FailureRetryButton(
              onPressed: () {
                context.read<PetitionsBloc>().add(PetitionsEvent.get());
              },
            )
          : SmartRefresher(
              enablePullDown: true,
              enablePullUp: hasNextPage,
              header: ClassicHeader(),
              controller: _refreshController,
              onRefresh: () {
                context.read<PetitionsBloc>().add(PetitionsEvent.get());
              },
              onLoading: () {
                context.read<PetitionsBloc>().add(
                  PetitionsEvent.get(
                    lastPetition: _petitions.last,
                    // TODO:
                    // searchTerm: ,
                    //   startDate: ,
                    //   endDate: ,
                  ),
                );
              },
              footer: ClassicFooter(),
              child: ListView.builder(
                padding: EdgeInsets.all(15),
                itemBuilder: (BuildContext context, int index) {
                  Petition petition = _petitions[index];
                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: PetitionTile(
                      key: ValueKey(petition.id),
                      petition: petition,
                      isDependency: false,
                    ),
                  );
                },
                itemCount: _petitions.length,
              ),
            ),
    );
  }
}
