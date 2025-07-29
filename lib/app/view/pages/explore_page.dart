import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          SliverAppBar(
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            forceElevated: true,
            flexibleSpace: CustomAppBar(
              user: user,
              extras: [AppBarSearchBar(hintText: 'Search')],
            ),
          ),
        ];
      },
      body: Placeholder(),
    );
  }
}
