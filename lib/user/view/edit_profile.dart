import 'dart:io';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/media_tools.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/user/bloc/user_detail/user_detail_cubit.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

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
                        return MediaDialog(
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
                      ProfileTextFormField(
                        initialValue: widget.user.name,
                        label: 'Name',
                        onChanged: (value) {
                          setState(() {
                            name = value;
                          });
                        },
                        maxLines: 2,
                        maxLength: 50,
                      ),
                      SizedBox(height: 15),
                      ProfileTextFormField(
                        initialValue: widget.user.status,
                        label: 'Status',
                        onChanged: (value) {
                          setState(() {
                            status = value;
                          });
                        },
                        maxLines: 4,
                        maxLength: 255,
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
                      return MediaDialog(
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

class ProfileTextFormField extends StatelessWidget {
  const ProfileTextFormField({
    super.key,
    required this.initialValue,
    required this.label,
    required this.onChanged,
    required this.maxLines,
    required this.maxLength,
  });

  final String initialValue;
  final String label;
  final void Function(String) onChanged;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      autofocus: false,
      minLines: 1,
      maxLines: maxLines,
      keyboardType: TextInputType.multiline,
      maxLength: maxLength,
      maxLengthEnforcement: MaxLengthEnforcement.enforced,
      decoration: InputDecoration(
        label: Text(label),
        counterText: '',
        filled: true,
        fillColor: Theme.of(context).scaffoldBackgroundColor,
        hintStyle: TextStyle(color: Theme.of(context).hintColor),
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        border: InputBorder.none,
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
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
