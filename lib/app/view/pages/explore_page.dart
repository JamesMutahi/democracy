import 'package:democracy/app/view/widgets/appbar_title.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
            title: AppBarTitle(
              user: user,
              extras: [
                SizedBox(width: 10),
                Flexible(
                  child: SearchBar(
                    padding: WidgetStateProperty.all(
                      EdgeInsets.only(left: 15, right: 10),
                    ),
                    leading: Icon(Symbols.search_rounded),
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ];
      },
      body: Placeholder(),
    );
  }
}
