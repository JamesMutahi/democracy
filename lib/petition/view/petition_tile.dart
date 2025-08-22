import 'package:democracy/app/utils/view/more_pop_up.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_detail.dart';
import 'package:flutter/material.dart';

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
        margin: EdgeInsets.only(top: 10),
        height: 130,
        decoration: BoxDecoration(
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
                    image: NetworkImage(petition.image!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Flexible(
              flex: 7,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            petition.title,
                            maxLines: 3,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        MorePopUp(
                          texts: ['Post', 'Share'],
                          onSelected: (value) {
                            switch (value) {
                              case 'Post':
                                // TODO
                                break;
                              case 'Share':
                                // TODO
                                break;
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    if (petition.supporters > 0)
                      Row(
                        children: [
                          Stack(
                            children: [
                              ...petition.recentSupporters.map((user) {
                                return Container(
                                  margin: EdgeInsets.only(
                                    left:
                                        petition.recentSupporters.indexOf(
                                          user,
                                        ) *
                                        15,
                                  ),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor:
                                        Theme.of(context).cardColor,
                                    child: CircleAvatar(
                                      radius: 13,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(user.image),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ],
                          ),
                          SizedBox(width: 10),
                          Text(
                            '${petition.supporters} ${petition.supporters == 1 ? 'supporter' : 'supporters'}',
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
