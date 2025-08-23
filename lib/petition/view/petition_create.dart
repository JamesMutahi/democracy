import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreatePetition extends StatelessWidget {
  const CreatePetition({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Symbols.close),
            ),
            OutlinedButton(onPressed: () {}, child: Text('Post')),
          ],
        ),
      ),
      body: Placeholder(),
    );
  }
}
