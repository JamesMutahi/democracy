import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/geo/view/widgets/geo_chip.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_detail.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              image: DecorationImage(
                image: NetworkImage(petition.image),
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
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
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
                if (!isDependency) SizedBox(height: 10),
                if (!isDependency) PetitionAuthorInfo(petition: petition),
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
                          image: NetworkImage(user.image),
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
    return MorePopUp(
      onSelected: (selected) {
        switch (selected) {
          case 'Post':
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PostCreate(petition: petition),
              ),
            );
          case 'Share':
            showModalBottomSheet<void>(
              context: context,
              shape: const BeveledRectangleBorder(),
              builder: (BuildContext context) {
                return ShareBottomSheet(petition: petition);
              },
            );
        }
      },
      texts: ['Post', 'Share'],
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
