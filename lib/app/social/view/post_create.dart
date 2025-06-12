import 'package:flutter/material.dart';

class PostCreate extends StatelessWidget {
  const PostCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(children: [TextFormField()]),
      ),
    );
  }
}
