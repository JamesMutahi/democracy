import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/meeting/view/meeting_create.dart';
import 'package:democracy/petition/view/petition_create.dart';
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
                    asset: 'assets/icons/dialog.svg',
                    size: 28,
                    isActive: currentPage == 3,
                    onTap: () {
                      context.read<BottomNavBarCubit>().changePage(3);
                    },
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return CreationBottomSheet();
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset(
                      'assets/icons/add.svg',
                      width: 40,
                      height: 40,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).disabledColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
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

class CreationBottomSheet extends StatelessWidget {
  const CreationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CreationButton(
              onTap: () {
                navigateToPostCreate(context: context);
              },
              asset: 'assets/icons/document-add.svg',
              text: 'Post',
            ),
            _CreationButton(
              onTap: () {
                navigateToMeetingCreationPage(
                  context: context,
                  isLiveStream: false,
                );
              },
              asset: 'assets/icons/microphone.svg',
              text: 'Meet',
            ),
            _CreationButton(
              onTap: () {
                navigateToMeetingCreationPage(
                  context: context,
                  isLiveStream: true,
                );
              },
              asset: 'assets/icons/video.svg',
              text: 'Go Live',
            ),
            _CreationButton(
              onTap: () {
                navigateToPetitionCreationPage(context: context);
              },
              asset: 'assets/icons/digital-signature.svg',
              text: 'Petition',
            ),
          ],
        ),
      ),
    );
  }
}

class _CreationButton extends StatelessWidget {
  const _CreationButton({
    required this.onTap,
    required this.asset,
    required this.text,
  });

  final VoidCallback onTap;
  final String asset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      onTap: () {
        Navigator.pop(context);
        onTap();
      },
      leading: SvgPicture.asset(
        asset,
        width: 35,
        height: 35,
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
      ),
      title: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
