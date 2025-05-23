import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:material_symbols_icons/symbols.dart';

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
        return BottomAppBar(
          padding: const EdgeInsets.all(0.0),
          height: 65.0,
          elevation: 100.0,
          child: Row(
            mainAxisAlignment:
                ResponsiveBreakpoints.of(context).isMobile
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
            children: [
              NavBarItem(
                iconData: Symbols.assured_workload_rounded,
                label: 'Home',
                isActive: currentPage == 0,
                onPressed: () {
                  context.read<BottomNavBarCubit>().changePage(0);
                },
              ),
              NavBarItem(
                iconData: Symbols.social_distance_rounded,
                label: 'Social',
                isActive: currentPage == 1,
                onPressed: () {
                  context.read<BottomNavBarCubit>().changePage(1);
                },
              ),
              NavBarItem(
                iconData: Symbols.person_edit_rounded,
                label: 'Profile',
                isActive: currentPage == 2,
                onPressed: () {
                  context.read<BottomNavBarCubit>().changePage(2);
                },
              ),
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
            children: [
              IconTheme(
                data: Theme.of(context).iconTheme.copyWith(
                  color:
                      isActive
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.outline,
                  fill: (isActive) ? 1 : null,
                ),
                child: Icon(iconData),
              ),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color:
                      isActive
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.outline,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
