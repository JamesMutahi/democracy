import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        List iconDataList = [
          Icons.home_rounded,
          Icons.search_rounded,
          Icons.mic_rounded,
          Icons.how_to_vote,
          Icons.edit_document,
          Icons.email_rounded,
        ];
        return BottomAppBar(
          padding: const EdgeInsets.all(0.0),
          height: 60.0,
          elevation: 100.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment:
                ResponsiveBreakpoints.of(context).isMobile
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
            children: [
              ...iconDataList.map((iconData) {
                int index = iconDataList.indexOf(iconData);
                return NavBarItem(
                  iconData: iconData,
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
    required this.onPressed,
    required this.isActive,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: onPressed,
      child: SizedBox(
        width: 60,
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
                  size: isActive ? 29 : 27,
                ),
                child: Icon(iconData),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
