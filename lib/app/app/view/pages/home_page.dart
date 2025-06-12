import 'package:democracy/app/social/view/post_create.dart';
import 'package:democracy/app/social/view/posts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Posts(),
        Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostCreate()),
              );
            },
            mini: true,
            child: Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
