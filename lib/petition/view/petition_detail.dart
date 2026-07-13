import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/petition/bloc/petition/petition_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart'
    show PetitionSupportersRow, PetitionPopUpMenu, PetitionAuthorInfo;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PetitionDetail extends StatelessWidget {
  const PetitionDetail({super.key, @PathParam('id') required this.petitionId});

  final int petitionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          PetitionBloc(webSocketService: context.read<WebSocketService>())
            ..add(PetitionEvent.load(petitionId: petitionId)),
      child: Scaffold(
        body: BlocBuilder<PetitionBloc, PetitionState>(
          buildWhen: (previous, current) => current.petitionId == petitionId,
          builder: (context, state) {
            if (state.status == PetitionStatus.initial ||
                (state.status == PetitionStatus.loading &&
                    state.petition == null)) {
              return BottomLoader();
            }
            if (state.status == PetitionStatus.failure &&
                state.petition == null) {
              return FailureRetryButton(
                onPressed: () {
                  context.read<PetitionBloc>().add(
                    PetitionEvent.load(petitionId: petitionId),
                  );
                },
              );
            }
            return _PetitionDetail(petition: state.petition!);
          },
        ),
      ),
    );
  }
}

class _PetitionDetail extends StatefulWidget {
  const _PetitionDetail({required this.petition});

  final Petition petition;

  @override
  State<_PetitionDetail> createState() => _PetitionDetailState();
}

class _PetitionDetailState extends State<_PetitionDetail> {
  bool isDeleted = false;

  @override
  void initState() {
    context.read<PetitionDetailBloc>().add(
      PetitionDetailEvent.addClick(petition: widget.petition),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<PetitionDetailBloc>().add(
                PetitionDetailEvent.retrieve(petition: widget.petition),
              );
            }
          },
        ),
        BlocListener<PetitionDetailBloc, PetitionDetailState>(
          listener: (context, state) {
            if (state is PetitionUpdated) {
              if (widget.petition.id == state.petition.id) {
                context.read<PetitionBloc>().add(
                  PetitionEvent.updated(petition: state.petition),
                );
              }
            }
            if (state is PetitionDeleted) {
              if (widget.petition.id == state.petitionId) {
                setState(() {
                  isDeleted = true;
                });
              }
            }
            if (state is PetitionDetailFailure) {
              final snackBar = getSnackBar(
                context: context,
                message: state.error,
                status: SnackBarStatus.failure,
              );
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        ),
      ],
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (_, _) {
          context.read<PetitionDetailBloc>().add(
            PetitionDetailEvent.unsubscribe(petition: widget.petition),
          );
        },
        child: Scaffold(
          appBar: AppBar(
            leading: AutoLeadingButton(),
            title: Text('Petition'),
            actions: [PetitionPopUpMenu(petition: widget.petition)],
          ),
          body: isDeleted
              ? Center(
                  child: Text('This petition has been deleted by the author'),
                )
              : ListView(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 4,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                widget.petition.image,
                                cacheKey: widget.petition.id.toString(),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (widget.petition.views > 0)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              margin: EdgeInsets.only(bottom: 5, right: 5),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.black.withAlpha(50),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '${widget.petition.views} ${widget.petition.views > 1 ? 'views' : 'view'}',
                                    style: TextStyle(
                                      color: Colors.black.withAlpha(75),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.petition.county != null)
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: GeoChipRow(
                                county: widget.petition.county,
                                constituency: widget.petition.constituency,
                                ward: widget.petition.ward,
                              ),
                            ),
                          Text(
                            widget.petition.title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              context.router.push(
                                ProfileRoute(userId: widget.petition.author.id),
                              );
                            },
                            child: PetitionAuthorInfo(
                              petition: widget.petition,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  context.router.push(
                                    Supporters(petitionId: widget.petition.id),
                                  );
                                },
                                child: PetitionSupportersRow(
                                  petition: widget.petition,
                                ),
                              ),
                              widget.petition.isOpen
                                  ? SupportButton(petition: widget.petition)
                                  : Card.outlined(
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          'Closed',
                                          style: TextStyle(
                                            color: Theme.of(
                                              context,
                                            ).colorScheme.error,
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            'The problem',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          CustomText(
                            text: widget.petition.description,
                            style: Theme.of(context).textTheme.bodyMedium!,
                            showAllText: true,
                            suffix: '',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class SupportButton extends StatelessWidget {
  const SupportButton({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: petition.isActive
          ? () {
              context.read<PetitionDetailBloc>().add(
                PetitionDetailEvent.support(petition: petition),
              );
            }
          : null,
      child: Text(petition.isSupported ? 'Remove support' : 'Support'),
    );
  }
}
