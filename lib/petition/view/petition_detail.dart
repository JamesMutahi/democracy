import 'package:democracy/petition/models/petition.dart';
import 'package:flutter/material.dart';

class PetitionDetail extends StatelessWidget {
  const PetitionDetail({super.key, required this.petition});

  final Petition petition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Petition')),
      body: Placeholder(),
    );
  }
}
