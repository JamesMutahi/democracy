import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/route/route_cubit.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:responsive_framework/responsive_framework.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return !kIsWeb && responsive.isMobile
        ? BlocBuilder<RouteCubit, String>(
            builder: (context, currentRoute) {
              return BottomAppBar(
                padding: const EdgeInsets.all(0.0),
                height: 60.0,
                elevation: 100.0,
                child: Stack(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment:
                          ResponsiveBreakpoints.of(context).isMobile
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.center,
                      children: [
                        NavBarItem(
                          asset: 'assets/icons/home.svg',
                          isActive: currentRoute == HomeRoute.name,
                          onTap: () {
                            context.navigateTo(const HomeRoute());
                          },
                        ),
                        NavBarItem(
                          asset: 'assets/icons/search.svg',
                          isActive: currentRoute == ExploreRoute.name,
                          onTap: () {
                            context.navigateTo(const ExploreRoute());
                          },
                        ),
                        IconButton.filledTonal(
                          onPressed: () {
                            if (currentRoute == CreationBottomSheet.name) {
                              context.router.popTop();
                            } else {
                              context.pushRoute(const CreationBottomSheet());
                            }
                          },
                          style: IconButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                          color: currentRoute == CreationBottomSheet.name
                              ? null
                              : Theme.of(context).disabledColor,
                          icon: Icon(
                            Symbols.add_rounded,
                            size: 30,
                            weight: 500,
                          ),
                        ),
                        NavBarItem(
                          asset: 'assets/icons/widgets.svg',
                          isActive: currentRoute == Hub.name,
                          onTap: () {
                            context.navigateTo(const Hub());
                          },
                        ),
                        NavBarItem(
                          asset: 'assets/icons/chat-square.svg',
                          isActive: currentRoute == ChatRoute.name,
                          onTap: () {
                            context.navigateTo(const ChatRoute());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          )
        : SizedBox.shrink();
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
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
            asset,
            width: 26,
            height: 26,
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
