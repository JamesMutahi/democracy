import 'package:democracy/app/utils/custom_bottom_sheet.dart';
import 'package:democracy/app/utils/more_pop_up.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_detail.dart';
import 'package:democracy/post/view/post_create.dart';
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
      child: Container(
        height: 130,
        decoration:
            isDependency
                ? BoxDecoration()
                : BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 4,
              child: Container(
                width: 130,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(petition.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 9,
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: isDependency ? 0 : 40),
                        padding: EdgeInsets.only(
                          left: 10,
                          top: 10,
                          bottom: 10,
                          right: isDependency ? 10 : 0,
                        ),
                        child: Text(
                          petition.title,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(overflow: TextOverflow.ellipsis),
                        ),
                      ),
                      SizedBox(height: 10),
                      if (petition.supporters > 0)
                        PetitionSupportersRow(petition: petition),
                    ],
                  ),
                  if (!isDependency)
                    Align(
                      alignment: Alignment.topRight,
                      child: PetitionPopUpMenu(petition: petition),
                    ),
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
      children: [
        Stack(
          children: [
            ...petition.recentSupporters.map((user) {
              return Container(
                margin: EdgeInsets.only(
                  left: petition.recentSupporters.indexOf(user) * 15,
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).cardColor,
                  child: CircleAvatar(
                    radius: 13,
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
