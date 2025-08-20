import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/petition_detail.dart';
import 'package:flutter/material.dart';

class PetitionTile extends StatelessWidget {
  const PetitionTile({super.key, required this.petition});

  final Petition petition;

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
        margin: const EdgeInsets.only(bottom: 10),
        child: Card.filled(
          borderOnForeground: false,
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.zero,
              top: Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(petition.image!),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petition.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(petition.description),
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
