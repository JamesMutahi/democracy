import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/view/petition_create_mobile.dart';
import 'package:democracy/petition/view/widgets/petition_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:flutter/foundation.dart';


class PetitionCreateWebDialog extends StatelessWidget {
  const PetitionCreateWebDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
      listener: (context, state) {
        if (state is PetitionCreated) {
          context.loaderOverlay.hide();
          context.router.pop();

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
      child: LoaderOverlay(
        overlayWidgetBuilder: (_) => const LoaderOverlayLoading(progress: ''),
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600, maxHeight: 800),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create Petition',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => const ExitDialog(),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(height: 1),

                Flexible(
                  child: PetitionFormWidget(
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
                            imageBytes!,
                            county,
                            constituency,
                            ward,
                          );
                        },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPublishDialog(
    BuildContext context,
    Map<String, dynamic> formData,
    Uint8List imageBytes,
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
              imageBytes: imageBytes,
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
