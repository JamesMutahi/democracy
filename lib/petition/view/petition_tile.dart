import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:democracy/app/bloc/theme/theme_cubit.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/more_pop_up.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_detail.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:democracy/user/models/user.dart';
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
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => PetitionDetail(petition: petition),
          ),
        );
      },
      child: VisibilityDetector(
        key: Key('${petition.id}'),
        onVisibilityChanged: (visibilityInfo) {
          var visibilityPercentage = visibilityInfo.visibleFraction * 100;
          if (visibilityPercentage == 100) {
            Map<String, int> viewedPetition = {'Petition': petition.id};
            final themeState = context.read<ThemeCubit>().state;
            bool exists = themeState.viewedPosts.any(
              (element) => const DeepCollectionEquality().equals(
                element,
                viewedPetition,
              ),
            );
            if (!exists) {
              context.read<PetitionDetailBloc>().add(
                PetitionDetailEvent.addView(petition: petition),
              );
              context.read<ThemeCubit>().addViewedPost(
                viewedPost: viewedPetition,
              );
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: isDependency
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(petition.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: isDependency
                    ? Colors.transparent
                    : Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (petition.county != null)
                    Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: GeoChipRow(
                        county: petition.county,
                        constituency: petition.constituency,
                        ward: petition.ward,
                      ),
                    ),
                  Text(
                    petition.title,
                    maxLines: 3,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (!isDependency) SizedBox(height: 5),
                  if (!isDependency && petition.views > 0)
                    Container(
                      margin: EdgeInsets.only(bottom: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            '${petition.views} views',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!isDependency) PetitionAuthorInfo(petition: petition),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetitionSupportersRow extends StatelessWidget {
  const PetitionSupportersRow({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            ...petition.recentSupporters.map((user) {
              return Container(
                margin: EdgeInsets.only(
                  left: petition.recentSupporters.indexOf(user) * 15,
                ),
                child: CircleAvatar(
                  radius: 17,
                  backgroundColor: Theme.of(context).cardColor,
                  child: CircleAvatar(
                    radius: 15,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(user.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
        if (petition.supporters > 0) SizedBox(width: 10),
        Text(
          '${numberFormat.format(petition.supporters)} ${petition.supporters == 1 ? 'supporter' : 'supporters'}',
        ),
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
        User user = (state as Authenticated).user;
        return MorePopUp(
          onSelected: (selected) {
            switch (selected) {
              case 'Post':
                navigateToPostCreate(context: context, petition: petition);
              case 'Share':
                showModalBottomSheet<void>(
                  context: context,
                  shape: const BeveledRectangleBorder(),
                  builder: (BuildContext context) {
                    return ShareBottomSheet(petition: petition);
                  },
                );
              case 'Close':
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: 'Close petition',
                    content:
                        'Are you sure you want to close this petition?'
                        '\nYour petition will no longer allow any supporters',
                    button1Text: 'Yes',
                    onButton1Pressed: () {
                      context.read<PetitionDetailBloc>().add(
                        PetitionDetailEvent.changeStatus(petition: petition),
                      );
                      Navigator.pop(context);
                    },
                    button2Text: 'No',
                    onButton2Pressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
              case 'Open':
                showDialog(
                  context: context,
                  builder: (context) => CustomDialog(
                    title: 'Open petition',
                    content:
                        'Are you sure you want to open this petition?'
                        '\nPeople will be able to add and remove support',
                    button1Text: 'Yes',
                    onButton1Pressed: () {
                      context.read<PetitionDetailBloc>().add(
                        PetitionDetailEvent.changeStatus(petition: petition),
                      );
                      Navigator.pop(context);
                    },
                    button2Text: 'No',
                    onButton2Pressed: () {
                      Navigator.pop(context);
                    },
                  ),
                );
            }
          },
          texts: [
            'Post',
            'Share',
            if (user.id == petition.author.id)
              if (petition.isOpen) 'Close' else 'Open',
          ],
        );
      },
    );
  }
}

class PetitionAuthorInfo extends StatelessWidget {
  const PetitionAuthorInfo({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileImage(user: petition.author),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileName(user: petition.author),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 1),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
              ),
              child: Text('Author'),
            ),
          ],
        ),
      ],
    );
  }
}
