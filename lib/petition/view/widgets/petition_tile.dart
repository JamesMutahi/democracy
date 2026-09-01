import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/global/global_cubit.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/app/shared/widgets/share_bottom_sheet.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PetitionTile extends StatelessWidget {
  const PetitionTile({
    super.key,
    required this.petition,
    required this.isDependency,
  });

  final Petition petition;
  final bool isDependency;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () => context.router.push(PetitionDetail(petitionId: petition.id)),
      child: VisibilityDetector(
        key: Key('petition_${petition.id}'),
        onVisibilityChanged: (visibilityInfo) {
          if (visibilityInfo.visibleFraction == 1.0) {
            final viewedPetition = {'Petition': petition.id};
            final globalCubit = context.read<GlobalCubit>();
            final exists = globalCubit.state.viewedPosts.any(
              (element) => const DeepCollectionEquality().equals(
                element,
                viewedPetition,
              ),
            );
            if (!exists) {
              context.read<PetitionDetailBloc>().add(
                PetitionDetailEvent.addView(petition: petition),
              );
              globalCubit.addViewedPost(viewedPost: viewedPetition);
            }
          }
        },
        child: isDependency
            ? _buildDependencyCard(context, colorScheme)
            : _buildFullCard(context, colorScheme),
      ),
    );
  }

  Widget _buildFullCard(BuildContext context, ColorScheme colorScheme) {
    return Card(
      elevation: 2,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Section
          Stack(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                ),
                child: CachedNetworkImage(
                  imageUrl: petition.image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
              // Gradient overlay for better contrast
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.6),
                      ],
                    ),
                  ),
                ),
              ),
              // Views badge
              if (petition.views > 0)
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(alpha: 0.7),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.visibility_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          NumberFormat.compact().format(petition.views),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

          // Content Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location chips
                if (petition.county != null) ...[
                  GeoChipRow(
                    county: petition.county,
                    constituency: petition.constituency,
                    ward: petition.ward,
                  ),
                  const SizedBox(height: 12),
                ],

                // Title
                Text(
                  petition.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                // Author info
                PetitionAuthorInfo(petition: petition),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDependencyCard(BuildContext context, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: colorScheme.outlineVariant),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Compact image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: CachedNetworkImage(
              imageUrl: petition.image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 150,
                color: colorScheme.surfaceContainerHighest,
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 150,
                color: colorScheme.surfaceContainerHighest,
                child: const Icon(Icons.broken_image, size: 40),
              ),
            ),
          ),

          // Compact content
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (petition.county != null) ...[
                  GeoChipRow(
                    county: petition.county,
                    constituency: petition.constituency,
                    ward: petition.ward,
                  ),
                  const SizedBox(height: 8),
                ],
                Text(
                  petition.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PetitionSupportersRow extends StatelessWidget {
  const PetitionSupportersRow({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat.compact(locale: "en_US");
    final supporters = petition.recentSupporters;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Avatar stack
        SizedBox(
          height: 34,
          width: supporters.isEmpty ? 0 : 20.0 + (supporters.length * 20.0),
          child: Stack(
            children: supporters.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;
              return Positioned(
                left: index * 20.0,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.surfaceContainerHighest,
                    child: ProfileImage(
                      userId: user.id,
                      username: user.username,
                      imageUrl: user.image,
                      radius: 13,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),

        if (petition.supporters > 0) ...[
          const SizedBox(width: 10),
          Text(
            '${numberFormat.format(petition.supporters)} ${petition.supporters == 1 ? 'supporter' : 'supporters'}',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
        ],
      ],
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

        return MorePopUp(
          onSelected: (selected) {
            switch (selected) {
              case 'Post':
                context.router.push(PostCreateRoute(petition: petition));
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
          texts: menuItems,
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

class PetitionAuthorInfo extends StatelessWidget {
  const PetitionAuthorInfo({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        ProfileImage(
          userId: petition.author.id,
          username: petition.author.username,
          imageUrl: petition.author.image,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileName(
                name: petition.author.name,
                username: petition.author.username,
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.verified_rounded,
                      size: 12,
                      color: colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Author',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
