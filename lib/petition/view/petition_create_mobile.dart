import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/petition/view/widgets/petition_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

@RoutePage()
class PetitionCreate extends StatelessWidget {
  const PetitionCreate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
      listener: (context, state) {
        if (state is PetitionCreated) {
          context.loaderOverlay.hide();
          context.router.maybePop();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: 'Petition published successfully',
              status: SnackBarStatus.success,
            ),
          );
          if (context.mounted) {
            showDialog(
              context: context,
              builder: (context) =>
                  PostPetitionDialog(petition: state.petition),
            );
          }
        }
        if (state is PetitionDetailFailure) {
          context.loaderOverlay.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: state.error,
              status: SnackBarStatus.failure,
            ),
          );
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) return;
          showDialog(
            context: context,
            builder: (context) => const ExitDialog(),
          );
        },
        child: LoaderOverlay(
          overlayWidgetBuilder: (_) => const LoaderOverlayLoading(progress: ''),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Create Petition'),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const ExitDialog(),
                ),
              ),
            ),
            body: PetitionFormWidget(
              onPublishRequested:
                  (
                    formData,
                    imageFile,
                    imageBytes,
                    county,
                    constituency,
                    ward,
                  ) {
                    _showPublishDialog(
                      context,
                      formData,
                      imageFile,
                      county,
                      constituency,
                      ward,
                    );
                  },
            ),
          ),
        ),
      ),
    );
  }

  void _showPublishDialog(
    BuildContext context,
    Map<String, dynamic> formData,
    File? image,
    County? county,
    Constituency? constituency,
    Ward? ward,
  ) {
    showDialog(
      context: context,
      builder: (context) => PetitionCreateDialog(
        onYesPressed: () {
          context.loaderOverlay.show();
          context.read<PetitionDetailBloc>().add(
            PetitionDetailEvent.create(
              title: formData['title'],
              imagePath: image!.path,
              description: formData['description'],
              county: county,
              constituency: constituency,
              ward: ward,
            ),
          );
          Future.delayed(const Duration(seconds: 10), () {
            if (context.mounted) context.loaderOverlay.hide();
          });
        },
      ),
    );
  }
}

// --- Dialogs ---

class PetitionCreateDialog extends StatelessWidget {
  const PetitionCreateDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Publish Petition',
      content:
          'Are you sure you want to publish this petition? It will be visible to the public.',
      elevatedButtonText: 'Yes, Publish',
      onElevatedButtonPressed: () {
        context.router.maybePop();
        onYesPressed();
      },
      textButtonText: 'Cancel',
      onTextButtonPressed: () => context.router.maybePop(),
    );
  }
}

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Discard Changes?',
      content:
          'Are you sure you want to leave? Your progress will not be saved.',
      textButtonText: 'Yes, Discard',
      onTextButtonPressed: () {
        context.router.popTop();
        context.router.popTop();
      },
      elevatedButtonText: 'Keep Editing',
      onElevatedButtonPressed: () {
        context.router.popTop();
      },
    );
  }
}

class PostPetitionDialog extends StatelessWidget {
  final Petition petition;

  const PostPetitionDialog({super.key, required this.petition});

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Amplify your Petition',
      content:
          'Do you want to create a post about this petition? This will give it more exposure in the feed.',
      elevatedButtonText: 'Yes, Create Post',
      onElevatedButtonPressed: () {
        context.router.maybePop();
        context.router.push(PostCreateRoute(petition: petition));
      },
      textButtonText: 'No, Thanks',
      onTextButtonPressed: () => context.router.maybePop(),
    );
  }
}
