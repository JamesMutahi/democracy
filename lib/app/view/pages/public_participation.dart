import 'package:flutter/material.dart';

class PublicParticipation extends StatelessWidget {
  const PublicParticipation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ListTile(
            onTap: () {},
            title: Text('Survey 1'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {},
            title: Text('Survey 2'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {},
            title: Text('Survey 3'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () {},
            title: Text('Survey 4'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
