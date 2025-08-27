import 'dart:io';

import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/media_tools.dart';
import 'package:democracy/app/utils/snack_bar_content.dart';
import 'package:democracy/petition/bloc/petition_detail/petition_detail_cubit.dart';
import 'package:democracy/post/view/post_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class CreatePetition extends StatefulWidget {
  const CreatePetition({super.key});

  @override
  State<CreatePetition> createState() => _CreatePetitionState();
}

class _CreatePetitionState extends State<CreatePetition> {
  File? image;
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    final imageHeight = MediaQuery.of(context).size.height / 4;
    return BlocListener<PetitionDetailCubit, PetitionDetailState>(
      listener: (context, state) {
        if (state is PetitionCreated) {
          Navigator.pop(context);
          final snackBar = getSnackBar(
            context: context,
            message: 'Petition published',
            status: SnackBarStatus.success,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          // Show dialog to ask the user if they want to post their petition
          showDialog(
            context: context,
            builder:
                (context) => PostPetitionDialog(
              onYesPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => PostCreate(petition: state.petition),
                  ),
                );
              },
            ),
          );
        }
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          showDialog(context: context, builder: (context) => ExitDialog());
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Symbols.close),
                ),
                OutlinedButton(
                  onPressed:
                      (image == null || title.isEmpty || description.isEmpty)
                          ? null
                          : () {
                            showDialog(
                              context: context,
                              builder:
                                  (context) => PetitionCreateDialog(
                                    onYesPressed: () {
                                      context.read<WebsocketBloc>().add(
                                        WebsocketEvent.createPetition(
                                          title: title,
                                          imagePath: image!.path,
                                          description: description,
                                        ),
                                      );
                                    },
                                  ),
                            );
                          },
                  child: Text('Publish'),
                ),
              ],
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
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
                child: Stack(
                  children: [
                    Container(
                      height: imageHeight,
                      decoration:
                          image == null
                              ? BoxDecoration(
                                color: Theme.of(context).cardColor,
                              )
                              : BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                    ),
                    Container(
                      height: imageHeight,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.3),
                      ),
                    ),
                    SizedBox(
                      height: imageHeight,
                      child: Center(
                        child: Icon(
                          Symbols.add_a_photo_rounded,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PetitionTextFormField(
                label: 'Title',
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                maxLines: 2,
                maxLength: 50,
              ),
              PetitionTextFormField(
                label: 'Description',
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                maxLines: 7,
                maxLength: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PetitionTextFormField extends StatelessWidget {
  const PetitionTextFormField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.maxLines,
    required this.maxLength,
  });

  final String label;
  final void Function(String) onChanged;
  final int maxLines;
  final int maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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

class PetitionCreateDialog extends StatelessWidget {
  const PetitionCreateDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Publish')),
      content: Text(
        'Are you sure you want to Publish this?',
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

class ExitDialog extends StatelessWidget {
  const ExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Leave page')),
      content: Text(
        'Do you want to leave this page? \n'
        'Progress will not be saved.',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: const Text('Yes'),
        ),
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('No'),
        ),
      ],
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: const EdgeInsets.all(20.0),
    );
  }
}

class PostPetitionDialog extends StatelessWidget {
  const PostPetitionDialog({super.key, required this.onYesPressed});

  final VoidCallback onYesPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text('Post your petition')),
      content: Text(
        'Do you want to post your petition? \n'
        'This will give your petition more exposure',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        OutlinedButton(
          onPressed: () {
            Navigator.pop(context);
            onYesPressed();
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
