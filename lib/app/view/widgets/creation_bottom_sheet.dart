import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

@RoutePage()
class CreationBottomSheet extends StatelessWidget {
  const CreationBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return CreationButtons();
  }
}

class CreationButtons extends StatelessWidget {
  const CreationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 15,
        bottom: 5,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _CreationButton(
              onTap: () => context.router.push(PostCreateRoute()),
              asset: 'assets/icons/document-add.svg',
              text: 'Post',
            ),
            _CreationButton(
              onTap: () => context.router.push(
                BroadcastCreate(
                  type: BroadcastTypeConverter().toJson(BroadcastType.meeting),
                ),
              ),
              asset: 'assets/icons/microphone.svg',
              text: 'Meeting',
            ),
            _CreationButton(
              onTap: () => context.router.push(
                BroadcastCreate(
                  type: BroadcastTypeConverter().toJson(
                    BroadcastType.livestream,
                  ),
                ),
              ),
              asset: 'assets/icons/video.svg',
              text: 'Go Live',
            ),
            _CreationButton(
              onTap: () => context.router.push(PetitionCreate()),
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
        context.router.popTop();
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
