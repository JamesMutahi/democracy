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
                    asset: 'assets/icons/hub.svg',
                    isActive: currentPage == 2,
                    onTap: () {
                      context.read<BottomNavBarCubit>().changePage(2);
                    },
                  ),
                  NavBarItem(
                    asset: 'assets/icons/mail.svg',
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
    required this.onTap,
    required this.isActive,
  });

  final String asset;
  final VoidCallback onTap;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: SizedBox(
        width: 60,
        height: 60,
        child: AnimatedContainer(
          duration: const Duration(
            milliseconds: 200,
          ), // Smooth transition speed
          curve: Curves.easeInOut,
          width: isActive ? 27.0 : 25.0,
          height: isActive ? 27.0 : 25.0,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: SvgPicture.asset(
              asset,
              width: isActive ? 30.0 : 25,
              height: isActive ? 30.0 : 25,
              colorFilter: isActive
                  ? null
                  : ColorFilter.mode(
                      Theme.of(context).disabledColor,
                      BlendMode.srcIn,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
