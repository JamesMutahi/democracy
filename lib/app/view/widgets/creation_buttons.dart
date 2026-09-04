import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/petition/view/utils/create_petition.dart';
import 'package:democracy/broadcast/view/utils/create_broadcast.dart';
import 'package:democracy/post/view/utils/create_post.dart';
import 'package:flutter/material.dart';

class CreationButtons extends StatelessWidget {
  const CreationButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        BottomSheetSvgTile(
          onTap: () {
            context.router.pop();
            createPost(context: context);
          },
          asset: 'assets/icons/document-add.svg',
          text: 'Create Post',
        ),
        BottomSheetSvgTile(
          onTap: () {
            context.router.pop();
            createBroadcast(context: context, type: BroadcastType.meeting);
          },
          asset: 'assets/icons/microphone.svg',
          text: 'Start Meeting',
        ),
        BottomSheetSvgTile(
          onTap: () {
            context.router.pop();
            createBroadcast(context: context, type: BroadcastType.livestream);
          },
          asset: 'assets/icons/video.svg',
          text: 'Go Live',
        ),
        BottomSheetSvgTile(
          onTap: () {
            context.router.pop();
            createPetition(context: context);
          },
          asset: 'assets/icons/digital-signature.svg',
          text: 'Create Petition',
        ),
      ],
    );
  }
}
