import 'dart:io';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.user});

  final User user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late String name = widget.user.name;
  late String status = widget.user.status;
  File? image;
  File? coverPhoto;
  bool waiting = false;

  @override
  Widget build(BuildContext context) {
    double coverPhotoHeight = MediaQuery.of(context).size.height / 5;
    double profilePicHeight = MediaQuery.of(context).size.height / 7;
    Color shaderColor = Colors.black.withValues(alpha: 0.3);
    return BlocListener<UserDetailCubit, UserDetailState>(
      listener: (context, state) {
        if (state is UserUpdated) {
          if (waiting && widget.user.id == state.user.id) {
            Navigator.pop(context);
            final snackBar = getSnackBar(
              context: context,
              message: 'Updated',
              status: SnackBarStatus.success,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Edit profile'),
              OutlinedButton(
                onPressed:
                    (image == null &&
                            coverPhoto == null &&
                            name == widget.user.name &&
                            status == widget.user.status)
                        ? null
                        : () {
                          showDialog(
                            context: context,
                            builder:
                                (context) => _SaveDialog(
                                  onYesPressed: () {
                                    setState(() {
                                      waiting = true;
                                    });
                                    context.read<WebsocketBloc>().add(
                                      WebsocketEvent.updateUser(
                                        user: widget.user,
                                        name: name,
                                        status: status,
                                        imagePath: image?.path,
                                        coverPhotoPath: coverPhoto?.path,
                                      ),
                                    );
                                  },
                                ),
                          );
                        },
                child: Text('Save'),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return _MediaDialog(
                          onCameraPressed: () async {
                            File? newImage = await ImagePickerUtil.takePhoto();
                            if (newImage != null) {
                              setState(() {
                                coverPhoto = newImage;
                              });
                            }
                          },
                          onGalleryPressed: () async {
                            File? newImage = await ImagePickerUtil.getImage();
                            if (newImage != null) {
                              setState(() {
                                coverPhoto = newImage;
                              });
                            }
                          },
                        );
                      },
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        height: coverPhotoHeight,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                coverPhoto == null
                                    ? NetworkImage(widget.user.coverPhoto)
                                    : FileImage(coverPhoto!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: coverPhotoHeight,
                        decoration: BoxDecoration(color: shaderColor),
                      ),
                      SizedBox(
                        height: coverPhotoHeight,
                        child: CameraAddButton(),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, top: 60),
                  child: Column(
                    children: [
                      TextFormField(
                        initialValue: widget.user.name,
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        autofocus: false,
                        minLines: 1,
                        maxLines: 2,
                        maxLength: 50,
                        decoration: InputDecoration(
                          label: Text('Name'),
                          counterText: '',
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        initialValue: widget.user.status,
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                        onTapOutside: (event) {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        autofocus: false,
                        minLines: 1,
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        maxLength: 255,
                        decoration: InputDecoration(
                          label: Text('Status'),
                          counterText: '',
                          filled: true,
                          fillColor: Theme.of(context).scaffoldBackgroundColor,
                          hintStyle: TextStyle(
                            color: Theme.of(context).hintColor,
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 0,
                            minHeight: 0,
                          ),
                          border: InputBorder.none,
                          focusedBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                            borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: profilePicHeight,
              left: 10,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return _MediaDialog(
                        onCameraPressed: () async {
                          File? newImage = await ImagePickerUtil.takePhoto();
                          if (newImage != null) {
                            setState(() {
                              image = newImage;
                            });
                          }
                        },
                        onGalleryPressed: () async {
                          File? newImage = await ImagePickerUtil.getImage();
                          if (newImage != null) {
                            setState(() {
                              image = newImage;
                            });
                          }
                        },
                      );
                    },
                  );
                },
                child: CircleAvatar(
                  radius: 53,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 50,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  image == null
                                      ? NetworkImage(widget.user.image)
                                      : FileImage(image!),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: shaderColor,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        SizedBox(
                          height: profilePicHeight,
                          child: CameraAddButton(),
                        ),
                      ],
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
}

class CameraAddButton extends StatelessWidget {
  const CameraAddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Symbols.add_a_photo_rounded, size: 40, color: Colors.white),
    );
  }
}

class _SaveDialog extends StatelessWidget {
  const _SaveDialog({required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Update')),
      content: Text(
        'Are you sure you want to update this?',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            onYesPressed();
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
        OutlinedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}

class _MediaDialog extends StatelessWidget {
  const _MediaDialog({
    required this.onCameraPressed,
    required this.onGalleryPressed,
  });

  final VoidCallback onCameraPressed;
  final VoidCallback onGalleryPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onCameraPressed();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
                color: Theme.of(context).colorScheme.secondaryContainer,
              ),
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: Theme.of(context).colorScheme.tertiaryContainer,
                  ),
                  const SizedBox(width: 5),
                  Text('Camera', style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              onGalleryPressed();
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(10),
                ),
                color: Theme.of(context).colorScheme.tertiaryContainer,
              ),
              padding: const EdgeInsets.all(30),
              child: Row(
                children: [
                  Icon(
                    Icons.image,
                    color: Theme.of(context).colorScheme.secondaryContainer,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Gallery',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImagePickerUtil {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> getImage() async {
    final pickedFile = await _picker.pickImage(
      imageQuality: 100,
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }

  static Future<File?> takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
