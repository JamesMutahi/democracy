import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        final currentPage = switch (state) {
          BottomNavBarPageChanged(:final page) => page,
        };
        List items = [
          {'name': 'Home', 'iconData': Symbols.home_rounded},
          {'name': 'Explore', 'iconData': Symbols.search_rounded},
          {'name': 'Ballots', 'iconData': Symbols.how_to_vote},
          {'name': 'Forms', 'iconData': Symbols.edit_document},
          {'name': 'Messages', 'iconData': Symbols.email_rounded},
        ];
        return BottomAppBar(
          padding: const EdgeInsets.all(0.0),
          height: 65.0,
          elevation: 100.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                ResponsiveBreakpoints.of(context).isMobile
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
            children: [
              ...items.map((item) {
                int index = items.indexOf(item);
                return NavBarItem(
                  iconData: item['iconData'],
                  label: item['name'],
                  isActive: currentPage == index,
                  onPressed: () {
                    context.read<BottomNavBarCubit>().changePage(index);
                  },
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class NavBarItem extends StatelessWidget {
  const NavBarItem({
    super.key,
    required this.iconData,
    required this.label,
    required this.onPressed,
    required this.isActive,
  });

  final IconData iconData;
  final String label;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onPressed,
      child: SizedBox(
        width: 80,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTheme(
                data: Theme.of(context).iconTheme.copyWith(
                  color:
                      isActive
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                  fill: (isActive) ? 1 : null,
                ),
                child: Icon(iconData),
              ),
              Text(
                label,
                style:
                    isActive
                        ? TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        )
                        : TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.outline,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
