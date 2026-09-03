import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:flutter/material.dart';

class CreationButtons extends StatelessWidget {
  const CreationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomSheetSvgTile(
          onTap: () => context.router.push(PostCreateRoute()),
          asset: 'assets/icons/document-add.svg',
          text: 'Create Post',
        ),
        BottomSheetSvgTile(
          onTap: () => context.router.push(
            BroadcastCreate(
              type: BroadcastTypeConverter().toJson(BroadcastType.meeting),
            ),
          ),
          asset: 'assets/icons/microphone.svg',
          text: 'Start Meeting',
        ),
        BottomSheetSvgTile(
          onTap: () => context.router.push(
            BroadcastCreate(
              type: BroadcastTypeConverter().toJson(BroadcastType.livestream),
            ),
          ),
          asset: 'assets/icons/video.svg',
          text: 'Go Live',
        ),
        BottomSheetSvgTile(
          onTap: () => context.router.push(PetitionCreate()),
          asset: 'assets/icons/digital-signature.svg',
          text: 'Create Petition',
        ),
      ],
    );
  }
}
