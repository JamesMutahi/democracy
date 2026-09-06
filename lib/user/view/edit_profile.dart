import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/shared/camera/camera.dart';
import 'package:democracy/app/shared/widgets/dialogs.dart';
import 'package:democracy/app/shared/utils/media_tools.dart';
import 'package:democracy/app/shared/widgets/loader_overlay_widgets.dart';
import 'package:democracy/app/shared/widgets/snack_bar_content.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_bloc.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_symbols_icons/symbols.dart';

@RoutePage()
class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late User user = context.read<AuthBloc>().state.user!;
  late String name = user.name;
  late String bio = user.bio;
  File? image;
  File? coverPhoto;
  Uint8List? imageBytes; // For Web
  Uint8List? coverPhotoBytes; // For Web

  // Computed property to check if any changes were made
  bool get _hasChanges =>
      image != null ||
      coverPhoto != null ||
      imageBytes != null ||
      coverPhotoBytes != null ||
      name != user.name ||
      bio != user.bio;

  Future<void> _pickImage({required bool isCoverPhoto}) async {
    if (kIsWeb) {
      Uint8List? bytes = await getImageFileBytes();
      if (bytes != null) {
        setState(() {
          if (isCoverPhoto) {
            coverPhotoBytes = bytes;
          } else {
            imageBytes = bytes;
          }
        });
      }
    } else {
      showDialog(
        context: context,
        builder: (dialogContext) => MediaDialog(
          onCameraPressed: () {
            Navigator.pop(dialogContext);
            openCamera(
              context: context,
              recipient: null,
              textEditingController: null,
              onImageEditingComplete: (newImage) {
                setState(() {
                  if (isCoverPhoto) {
                    coverPhoto = newImage;
                  } else {
                    image = newImage;
                  }
                });
              },
            );
          },
          onGalleryPressed: () {
            Navigator.pop(dialogContext);
            openGallery(
              context: context,
              maxAssets: 1,
              onMedia: (files) {
                if (files.isNotEmpty) {
                  setState(() {
                    if (isCoverPhoto) {
                      coverPhoto = files.first;
                    } else {
                      image = files.first;
                    }
                  });
                }
              },
            );
          },
        ),
      );
    }
  }

  void _handleSave() {
    showDialog(
      context: context,
      builder: (context) => _SaveDialog(
        onYesPressed: () {
          context.loaderOverlay.show();
          context.read<UserDetailBloc>().add(
            UserDetailEvent.patch(
              user: user,
              name: name,
              bio: bio,
              imagePath: image?.path,
              coverPhotoPath: coverPhoto?.path,
              imageBytes: imageBytes,
              coverPhotoBytes: coverPhotoBytes,
            ),
          );
          Future.delayed(const Duration(seconds: 10), () {
            if (context.mounted) context.loaderOverlay.hide();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return BlocListener<UserDetailBloc, UserDetailState>(
      listener: (context, state) {
        if (state is UserPatched) {
          context.router.popTop();
          context.read<AuthBloc>().add(AuthEvent.updateUser(user: state.user));
          ScaffoldMessenger.of(context).showSnackBar(
            getSnackBar(
              context: context,
              message: 'Profile updated',
              status: SnackBarStatus.success,
            ),
          );
        }
      },
      child: LoaderOverlay(
        overlayWidgetBuilder: (_) => const LoaderOverlayLoading(progress: ''),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: FilledButton(
                  onPressed: _hasChanges ? _handleSave : null,
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    GestureDetector(
                      onTap: () => _pickImage(isCoverPhoto: true),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: coverPhoto == null && coverPhotoBytes == null
                                ? CachedNetworkImageProvider(
                                    user.coverPhoto,
                                    cacheKey: 'cover ${user.id}',
                                  )
                                : kIsWeb
                                ? MemoryImage(coverPhotoBytes!)
                                : FileImage(coverPhoto!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    // Cover Photo Edit Button
                    Positioned(
                      bottom: 16,
                      right: 16,
                      child: FloatingActionButton.small(
                        heroTag: 'cover_photo_edit',
                        onPressed: () => _pickImage(isCoverPhoto: true),
                        backgroundColor: Colors.black54,
                        child: const Icon(
                          Symbols.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: -50,
                      left: 16,
                      child: GestureDetector(
                        onTap: () => _pickImage(isCoverPhoto: false),
                        child: CircleAvatar(
                          radius: 54,
                          backgroundColor: colorScheme.surface,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: image == null && imageBytes == null
                                ? CachedNetworkImageProvider(
                                    user.image,
                                    cacheKey: 'profile ${user.id}',
                                  )
                                : kIsWeb
                                ? MemoryImage(imageBytes!)
                                : FileImage(image!),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.4),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: const Center(
                                child: Icon(
                                  Symbols.add_a_photo_rounded,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 66),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildModernTextField(
                        label: 'Name',
                        initialValue: user.name,
                        maxLines: 1,
                        maxLength: 50,
                        onChanged: (value) => setState(() => name = value),
                      ),
                      const SizedBox(height: 16),
                      _buildModernTextField(
                        label: 'Bio',
                        initialValue: user.bio,
                        maxLines: 4,
                        maxLength: 255,
                        onChanged: (value) => setState(() => bio = value),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildModernTextField({
    required String label,
    required String initialValue,
    required int maxLines,
    required int maxLength,
    required ValueChanged<String> onChanged,
  }) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      minLines: 1,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: TextInputType.multiline,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}

class _SaveDialog extends StatelessWidget {
  const _SaveDialog({required this.onYesPressed});
  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: 'Update Profile',
      content: 'Are you sure you want to save these changes?',
      elevatedButtonText: 'Save',
      onElevatedButtonPressed: () {
        context.router.popTop();
        onYesPressed();
      },
      textButtonText: 'Cancel',
      onTextButtonPressed: () => context.router.popTop(),
    );
  }
}
