import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/app/shared/widgets/dialog_container.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/geo/bloc/geo/geo_bloc.dart';
import 'package:democracy/geo/models/constituency.dart';
import 'package:democracy/geo/models/county.dart';
import 'package:democracy/geo/models/ward.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_bloc.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

@RoutePage()
class PetitionCreate extends StatefulWidget {
  const PetitionCreate({super.key});

  @override
  State<PetitionCreate> createState() => _PetitionCreateState();
}

class _PetitionCreateState extends State<PetitionCreate> {
  final _formKey = GlobalKey<FormBuilderState>();

  File? _imageFile; // For Mobile/Desktop
  Uint8List? _imageBytes; // For Web

  County? _selectedCounty;
  Constituency? _selectedConstituency;
  Ward? _selectedWard;

  final ValueNotifier<bool> _isFormValid = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    context.read<GeoBloc>().add(GeoEvent.getCounties());
  }

  @override
  void dispose() {
    _isFormValid.dispose();
    super.dispose();
  }

  bool _checkValidity() {
    final title = _formKey.currentState?.fields['title']?.value as String?;
    final desc = _formKey.currentState?.fields['description']?.value as String?;

    final isTitleValid = title != null && title.trim().isNotEmpty;
    final isDescValid = desc != null && desc.trim().isNotEmpty;

    // Check for image based on platform
    final hasImage = kIsWeb ? _imageBytes != null : _imageFile != null;

    _isFormValid.value = isTitleValid && isDescValid && hasImage;

    return _isFormValid.value;
  }

  bool _isFormEmpty() {
    final title = _formKey.currentState?.fields['title']?.value as String?;
    final desc = _formKey.currentState?.fields['description']?.value as String?;

    final isTitleEmpty = title == null || title.trim().isEmpty;
    final isDescEmpty = desc == null || desc.trim().isEmpty;

    // Check for image based on platform
    final noImage = kIsWeb ? _imageBytes == null : _imageFile == null;

    bool isEmpty = isTitleEmpty && isDescEmpty && noImage;

    return isEmpty;
  }

  void _handlePublish() {
    if (_formKey.currentState?.saveAndValidate() ?? false) {
      _showPublishDialog(
        context,
        _formKey.currentState!.value,
        _imageFile,
        _imageBytes,
        _selectedCounty,
        _selectedConstituency,
        _selectedWard,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return BlocListener<PetitionDetailBloc, PetitionDetailState>(
      listener: (context, state) {
        if (state is PetitionCreated) {
          _formKey.currentState?.reset();
          _imageBytes = null;
          _imageFile = null;
          setState(() {});
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
          if (_isFormEmpty()) {
            context.router.popTop();
          } else {
            showDialog(
              context: context,
              builder: (context) => const ExitDialog(),
            );
          }
        },
        child: LoaderOverlay(
          overlayWidgetBuilder: (_) => const LoaderOverlayLoading(progress: ''),
          child: kIsWeb && responsive.largerThan(MOBILE)
              ? _buildWeb(context)
              : _buildMobile(context),
        ),
      ),
    );
  }

  Widget _buildMobile(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Petition'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () {
            if (_isFormEmpty()) {
              context.router.popTop();
            } else {
              showDialog(
                context: context,
                builder: (context) => const ExitDialog(),
              );
            }
          },
        ),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildWeb(BuildContext context) {
    return DialogContainer(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Create Petition',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.close_rounded),
                onPressed: () {
                  if (_isFormEmpty()) {
                    context.router.popTop();
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => const ExitDialog(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const Divider(height: 1),

        Flexible(child: _buildBody()),
      ],
    );
  }

  Widget _buildBody() {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Expanded(
          child: FormBuilder(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImagePicker(colorScheme),
                  const SizedBox(height: 24),
                  _buildSectionTitle('Petition Details', colorScheme),
                  const SizedBox(height: 12),

                  FormBuilderTextField(
                    name: 'title',
                    maxLines: 2,
                    maxLength: 50,
                    textInputAction: TextInputAction.next,
                    decoration: _inputDecoration(
                      'Title',
                      'e.g., Fix the potholes on Main Street',
                      colorScheme,
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: 'Title is required',
                    ),
                    onChanged: (value) {
                      bool isFormValid = _isFormValid.value;
                      bool newValidity = _checkValidity();
                      if (isFormValid != newValidity) setState(() {});
                    },
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'description',
                    maxLines: 6,
                    maxLength: 500,
                    textInputAction: TextInputAction.newline,
                    decoration: _inputDecoration(
                      'Description',
                      'Explain the issue and what you want to achieve...',
                      colorScheme,
                      alignLabelWithHint: true,
                    ),
                    validator: FormBuilderValidators.required(
                      errorText: 'Description is required',
                    ),
                    onChanged: (value) {
                      bool isFormValid = _isFormValid.value;
                      bool newValidity = _checkValidity();
                      if (isFormValid != newValidity) setState(() {});
                    },
                  ),
                  const SizedBox(height: 24),

                  _buildSectionTitle('Target Location (Optional)', colorScheme),
                  const SizedBox(height: 12),
                  BlocBuilder<GeoBloc, GeoState>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          FormBuilderDropdown<County>(
                            name: 'county',
                            decoration: _inputDecoration(
                              'County',
                              null,
                              colorScheme,
                              prefixIcon: Icons.location_on_outlined,
                            ),
                            items: state.counties
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedCounty = value;
                                _selectedConstituency = null;
                                _selectedWard = null;
                                _formKey.currentState?.fields['constituency']
                                    ?.reset();
                                _formKey.currentState?.fields['ward']?.reset();
                              });
                              if (value != null) {
                                context.read<GeoBloc>().add(
                                  GeoEvent.getConstituencies(county: value),
                                );
                              }
                              _checkValidity();
                            },
                          ),
                          const SizedBox(height: 12),
                          FormBuilderDropdown<Constituency>(
                            name: 'constituency',
                            decoration: _inputDecoration(
                              'Constituency',
                              null,
                              colorScheme,
                              prefixIcon: Icons.map_outlined,
                            ),
                            items: state.constituencies
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: _selectedCounty == null
                                ? null
                                : (value) {
                                    setState(() {
                                      _selectedConstituency = value;
                                      _selectedWard = null;
                                      _formKey.currentState?.fields['ward']
                                          ?.reset();
                                    });
                                    if (value != null) {
                                      context.read<GeoBloc>().add(
                                        GeoEvent.getWards(constituency: value),
                                      );
                                    }
                                    _checkValidity();
                                  },
                          ),
                          const SizedBox(height: 12),
                          FormBuilderDropdown<Ward>(
                            name: 'ward',
                            decoration: _inputDecoration(
                              'Ward',
                              null,
                              colorScheme,
                              prefixIcon: Icons.pin_drop_outlined,
                            ),
                            items: state.wards
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e.name),
                                  ),
                                )
                                .toList(),
                            onChanged: _selectedConstituency == null
                                ? null
                                : (value) {
                                    setState(() => _selectedWard = value);
                                    _checkValidity();
                                  },
                          ),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
          child: ValueListenableBuilder<bool>(
            valueListenable: _isFormValid,
            builder: (context, isValid, child) {
              return FilledButton.icon(
                onPressed: isValid ? _handlePublish : null,
                icon: const Icon(Icons.send_rounded),
                label: const Text('Publish Petition'),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, ColorScheme colorScheme) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.bold,
        color: colorScheme.primary,
      ),
    );
  }

  InputDecoration _inputDecoration(
    String label,
    String? hint,
    ColorScheme colorScheme, {
    bool alignLabelWithHint = false,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      alignLabelWithHint: alignLabelWithHint,
      prefixIcon: prefixIcon != null ? Icon(prefixIcon, size: 20) : null,
      filled: true,
      fillColor: colorScheme.surfaceContainerHighest,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget _buildImagePicker(ColorScheme colorScheme) {
    final hasImage = kIsWeb ? _imageBytes != null : _imageFile != null;

    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: colorScheme.outline.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        child: !hasImage
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 48,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Tap to add a cover image',
                    style: TextStyle(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Recommended: 1200 x 630 px',
                    style: TextStyle(color: colorScheme.outline, fontSize: 12),
                  ),
                ],
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: kIsWeb
                        ? Image.memory(_imageBytes!, fit: BoxFit.cover)
                        : Image.file(_imageFile!, fit: BoxFit.cover),
                  ),
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Material(
                      color: Colors.black54,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (kIsWeb) {
                              _imageBytes = null;
                            } else {
                              _imageFile = null;
                            }
                            _checkValidity();
                          });
                        },
                        customBorder: const CircleBorder(),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Future<void> _pickImage() async {
    if (kIsWeb) {
      _imageBytes = await getImageFileBytes();
      _checkValidity();
      setState(() {});
    } else {
      showDialog(
        context: context,
        builder: (context) => MediaDialog(
          onCameraPressed: () async {
            context.router.maybePop();
            openCamera(
              context: context,
              recipient: null,
              textEditingController: null,
              onImageEditingComplete: (newImage) {
                setState(() {
                  _imageFile = newImage;
                  _checkValidity();
                });
              },
            );
          },
          onGalleryPressed: () {
            context.router.maybePop();
            openGallery(
              context: context,
              maxAssets: 1,
              onMedia: (files) {
                if (files.isNotEmpty) {
                  setState(() {
                    _imageFile = files.first;
                    _checkValidity();
                  });
                }
              },
            );
          },
        ),
      );
    }
  }

  void _showPublishDialog(
    BuildContext context,
    Map<String, dynamic> formData,
    File? image,
    Uint8List? imageBytes,
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
        context.router.push(PostCreate(petition: petition));
      },
      textButtonText: 'No, Thanks',
      onTextButtonPressed: () => context.router.maybePop(),
    );
  }
}
