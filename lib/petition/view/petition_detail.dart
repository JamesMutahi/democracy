import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart'
    show WebsocketStatus, WebSocketService;
import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/shared/widgets/bottom_loader.dart';
import 'package:democracy/app/shared/widgets/custom_text.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/failure_retry_button.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/petition/bloc/petition/petition_bloc.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_tile.dart'
    show PetitionAuthorInfo;
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
      child: MainContainer(
        child: BlocBuilder<PetitionBloc, PetitionState>(
          buildWhen: (previous, current) => current.petitionId == petitionId,
          builder: (context, state) {
            if (state.status == PetitionStatus.initial ||
                (state.status == PetitionStatus.loading &&
                    state.petition == null)) {
              return Scaffold(
                appBar: AppBar(leading: AutoLeadingButton()),
                body: Center(child: BottomLoader()),
              );
            }
            if (state.status == PetitionStatus.failure &&
                state.petition == null) {
              return Scaffold(
                appBar: AppBar(leading: AutoLeadingButton()),
                body: Center(
                  child: FailureRetryButton(
                    onPressed: () {
                      context.read<PetitionBloc>().add(
                        PetitionEvent.load(petitionId: petitionId),
                      );
                    },
                  ),
                ),
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
    final petition = widget.petition;

    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<PetitionDetailBloc>().add(
                PetitionDetailEvent.retrieve(petition: petition),
              );
            }
          },
        ),
        BlocListener<PetitionDetailBloc, PetitionDetailState>(
          listener: (context, state) {
            switch (state) {
              case PetitionUpdated():
                if (petition.id == state.petitionId) {
                  context.read<PetitionBloc>().add(
                    PetitionEvent.detailUpdated(
                      title: state.title,
                      description: state.description,
                      county: state.county,
                      constituency: state.constituency,
                      ward: state.ward,
                      supporters: state.supporters,
                      recentSupporters: state.recentSupporters,
                      image: state.image,
                      video: state.video,
                      views: state.views,
                      isOpen: state.isOpen,
                      isActive: state.isActive,
                    ),
                  );
                }
              case PetitionSupported():
                if (petition.id == state.petitionId) {
                  context.read<PetitionBloc>().add(
                    PetitionEvent.supportUpdated(
                      isSupported: state.isSupported,
                      supporters: state.supporters,
                    ),
                  );
                }
              case PetitionDeleted():
                if (petition.id == state.petitionId) {
                  setState(() => isDeleted = true);
                }
              case PetitionDetailFailure():
                if (mounted) {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  ScaffoldMessenger.of(context).showSnackBar(
                    getSnackBar(
                      context: context,
                      message: state.error,
                      status: SnackBarStatus.failure,
                    ),
                  );
                }
            }
          },
        ),
      ],
      child: PopScope(
        canPop: true,
        onPopInvokedWithResult: (_, _) {
          context.read<PetitionDetailBloc>().add(
            PetitionDetailEvent.unsubscribe(petition: petition),
          );
        },
        child: isDeleted
            ? Scaffold(
                appBar: AppBar(leading: const AutoLeadingButton()),
                body: const Center(
                  child: Text('This petition has been deleted by the author'),
                ),
              )
            : Scaffold(
                body: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      expandedHeight: 240,
                      pinned: true,
                      backgroundColor: Colors.transparent,
                      leading: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.tertiaryContainer
                              .withValues(alpha: 0.6),
                        ),
                        child: AutoLeadingButton(),
                      ),
                      actions: [PetitionPopUpMenu(petition: petition)],
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            CachedNetworkImage(
                              imageUrl: petition.image,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.broken_image, size: 50),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withValues(alpha: 0.7),
                                  ],
                                ),
                              ),
                            ),
                            // Views Badge
                            Positioned(
                              bottom: 16,
                              right: 16,
                              child: _buildViewsBadge(petition.views),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Location Chips
                            if (petition.county != null) ...[
                              GeoChipRow(
                                county: petition.county,
                                constituency: petition.constituency,
                                ward: petition.ward,
                              ),
                              const SizedBox(height: 16),
                            ],

                            // Title
                            Text(
                              petition.title,
                              style: Theme.of(context).textTheme.headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),

                            // Author Info
                            GestureDetector(
                              onTap: () => context.router.push(
                                ProfileRoute(
                                  username: petition.author.username,
                                ),
                              ),
                              child: PetitionAuthorInfo(petition: petition),
                            ),
                            const SizedBox(height: 24),

                            // Supporters Count
                            GestureDetector(
                              onTap: () => context.router.push(
                                Supporters(petitionId: petition.id),
                              ),
                              child: _buildSupportersInfo(petition),
                            ),
                            const SizedBox(height: 16),

                            // Support Button
                            _buildSupportAction(petition),

                            const SizedBox(height: 32),

                            // Description Section
                            Text(
                              'The Problem',
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 8),
                            CustomText(
                              text: petition.description,
                              style: Theme.of(context).textTheme.bodyMedium!,
                              showAllText: true,
                              suffix: '',
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildViewsBadge(int views) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.6),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.visibility_rounded, color: Colors.white, size: 16),
          const SizedBox(width: 6),
          Text(
            '$views',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportersInfo(Petition petition) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.how_to_reg_rounded,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Text(
            '${petition.supporters} Supporter${petition.supporters == 1 ? '' : 's'}',
            style: Theme.of(
              context,
            ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.chevron_right, size: 18),
        ],
      ),
    );
  }

  Widget _buildSupportAction(Petition petition) {
    if (!petition.isOpen) {
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.errorContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_clock,
              color: Theme.of(context).colorScheme.onErrorContainer,
            ),
            const SizedBox(width: 8),
            Text(
              'This petition is closed',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onErrorContainer,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 56,
      child: petition.isSupported
          ? FilledButton.tonalIcon(
              onPressed: () => _toggleSupport(petition),
              icon: const Icon(Icons.check_circle_rounded),
              label: const Text('Supported'),
            )
          : FilledButton.icon(
              onPressed: () => _toggleSupport(petition),
              icon: const Icon(Icons.how_to_reg_rounded),
              label: const Text('Support this Petition'),
            ),
    );
  }

  void _toggleSupport(Petition petition) {
    context.read<PetitionDetailBloc>().add(
      PetitionDetailEvent.support(petition: petition),
    );
  }
}

class PetitionPopUpMenu extends StatelessWidget {
  const PetitionPopUpMenu({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final user = state.user!;
        final isAuthor = user.id == petition.author.id;

        final menuItems = [
          'Post',
          'Share',
          if (isAuthor) (petition.isOpen ? 'Close' : 'Open'),
        ];

        return PopupMenuButton<String>(
          useRootNavigator: true,
          menuPadding: EdgeInsets.zero,
          onSelected: (selected) {
            switch (selected) {
              case 'Post':
                context.router.push(PostCreate(petition: petition));
              case 'Share':
                showModalBottomSheet<void>(
                  context: context,
                  shape: const BeveledRectangleBorder(),
                  builder: (context) => ShareBottomSheet(petition: petition),
                );
              case 'Close':
              case 'Open':
                _showStatusChangeDialog(context, selected == 'Close');
            }
          },
          borderRadius: BorderRadius.circular(50),
          itemBuilder: (BuildContext context) => [
            ...menuItems.map((text) {
              return PopupMenuItem<String>(
                value: text,
                child: Text(text, textAlign: TextAlign.center),
              );
            }),
          ],
          child: Container(
            padding: EdgeInsetsGeometry.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Theme.of(
                context,
              ).colorScheme.tertiaryContainer.withValues(alpha: 0.6),
            ),
            child: Icon(Icons.more_vert_rounded, size: 25),
          ),
        );
      },
    );
  }

  void _showStatusChangeDialog(BuildContext context, bool isClosing) {
    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: isClosing ? 'Close petition' : 'Open petition',
        content: isClosing
            ? 'Are you sure you want to close this petition?\nYour petition will no longer allow any supporters'
            : 'Are you sure you want to open this petition?\nPeople will be able to add and remove support',
        elevatedButtonText: 'Yes',
        onElevatedButtonPressed: () {
          context.read<PetitionDetailBloc>().add(
            PetitionDetailEvent.changeStatus(petition: petition),
          );
          context.router.popTop();
        },
        textButtonText: 'No',
        onTextButtonPressed: () => context.router.popTop(),
      ),
    );
  }
}
