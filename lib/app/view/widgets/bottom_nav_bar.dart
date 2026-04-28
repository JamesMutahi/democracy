import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/post/view/shared/post_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
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
        return BottomAppBar(
          padding: const EdgeInsets.all(0.0),
          height: 60.0,
          elevation: 100.0,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: ResponsiveBreakpoints.of(context).isMobile
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  NavBarItem(
                    asset: 'assets/icons/home.svg',
                    isActive: currentPage == 0,
                    onTap: () {
                      context.read<BottomNavBarCubit>().changePage(0);
                    },
                  ),
                  NavBarItem(
                    asset: 'assets/icons/search.svg',
                    isActive: currentPage == 1,
                    onTap: () {
                      context.read<BottomNavBarCubit>().changePage(1);
                    },
                  ),
                  SizedBox(width: 60),
                  NavBarItem(
                    asset: 'assets/icons/layers.svg',
                    size: 28,
                    isActive: currentPage == 2,
                    onTap: () {
                      context.read<BottomNavBarCubit>().changePage(2);
                    },
                  ),
                  NavBarItem(
                    asset: 'assets/icons/chat-bubbles.svg',
                    isActive: currentPage == 3,
                    onTap: () {
                      context.read<BottomNavBarCubit>().changePage(3);
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: NavBarItem(
                  asset: 'assets/icons/pen.svg',
                  isActive: false,
                  onTap: () {
                    navigateToPostCreate(context: context);
                  },
                ),
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
    required this.asset,
    this.size = 26,
    required this.onTap,
    required this.isActive,
  });

  final String asset;
  final double size;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            asset,
            width: size,
            height: size,
            colorFilter: ColorFilter.mode(
              isActive
                  ? Theme.of(context).primaryColor
                  : Theme.of(context).disabledColor,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
