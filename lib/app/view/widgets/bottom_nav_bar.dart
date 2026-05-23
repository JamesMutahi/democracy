import 'package:democracy/app/view/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
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
    final String currentLocation = GoRouterState.of(context).matchedLocation;

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
                isActive: currentLocation == '/',
                onTap: () {
                  context.go('/');
                },
              ),
              NavBarItem(
                asset: 'assets/icons/search.svg',
                isActive: currentLocation == '/explore',
                onTap: () {
                  context.go('/explore');
                },
              ),
              SizedBox(width: 60),
              NavBarItem(
                asset: 'assets/icons/widgets.svg',
                isActive: currentLocation == '/hub',
                onTap: () {
                  context.go('/hub');
                },
              ),
              NavBarItem(
                asset: 'assets/icons/chat-square.svg',
                isActive: currentLocation == '/chat',
                onTap: () {
                  context.go('/chat');
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: IconButton.filledTonal(
              onPressed: () {
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
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              color: Theme.of(context).disabledColor,
              icon: Icon(Symbols.add_rounded, size: 35, weight: 500),
            ),
          ),
        ],
      ),
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
              onTap: () => context.push(const CreatePostRoute().location),
              asset: 'assets/icons/document-add.svg',
              text: 'Post',
            ),
            _CreationButton(
              onTap: () => context.push(const CreateMeetingRoute().location),
              asset: 'assets/icons/microphone.svg',
              text: 'Meeting',
            ),
            _CreationButton(
              onTap: () => context.push(const CreateLiveStreamRoute().location),
              asset: 'assets/icons/video.svg',
              text: 'Go Live',
            ),
            _CreationButton(
              onTap: () => context.push(const CreatePetitionRoute().location),
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
