import 'package:flutter/material.dart';

class PostUpdate extends StatefulWidget {
  const PostUpdate({super.key});

  @override
  State<PostUpdate> createState() => _PostUpdateState();
}

class _PostUpdateState extends State<PostUpdate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit post')),
      body: Placeholder(),
    );
  }
}
