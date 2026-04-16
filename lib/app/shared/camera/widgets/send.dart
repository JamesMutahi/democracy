import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:democracy/user/view/widgets/profile_name.dart';
import 'package:flutter/material.dart';
import 'package:pro_image_editor/features/main_editor/main_editor.dart';
import 'package:pro_image_editor/shared/widgets/gesture/gesture_interceptor_widget.dart';

class SendArea extends StatelessWidget {
  const SendArea({
    super.key,
    required this.editor,
    required this.opacity,
    required this.recipient,
    required this.controller,
    required this.captionFocus,
  });

  final ProImageEditorState editor;
  final double opacity;
  final User? recipient;
  final TextEditingController? controller;
  final FocusNode captionFocus;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: MediaQuery.viewInsetsOf(context).bottom,
      left: 0,
      right: 0,
      child: GestureInterceptor(
        child: Opacity(
          opacity: opacity,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (recipient != null) Recipient(recipient: recipient!),
                if (recipient != null)
                  RecipientTextField(
                    controller: controller!,
                    editor: editor,
                    captionFocus: captionFocus,
                  ),
                if (recipient == null)
                  NoRecipientCompleteButton(editor: editor),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Recipient extends StatelessWidget {
  const Recipient({super.key, required this.recipient});

  final User recipient;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        children: [
          SizedBox(height: 30, width: 30, child: ProfileImage(user: recipient)),
          SizedBox(width: 5),
          ProfileName(user: recipient),
        ],
      ),
    );
  }
}

class NoRecipientCompleteButton extends StatelessWidget {
  const NoRecipientCompleteButton({super.key, required this.editor});

  final ProImageEditorState editor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IconButton.outlined(
        onPressed: () => editor.doneEditing(),
        iconSize: 50,
        icon: Icon(Icons.check_rounded),
      ),
    );
  }
}

class RecipientTextField extends StatelessWidget {
  const RecipientTextField({
    super.key,
    required this.controller,
    required this.editor,
    required this.captionFocus,
  });

  final TextEditingController controller;
  final FocusNode captionFocus;
  final ProImageEditorState editor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: TextField(
            controller: controller,
            focusNode: captionFocus,
            textAlignVertical: TextAlignVertical.center,
            onTap: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                captionFocus.requestFocus();
              });
            },
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            maxLength: 500,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              filled: true,
              isDense: true,
              prefixIcon: const Padding(
                padding: EdgeInsets.only(left: 7.0),
                child: Icon(
                  Icons.add_photo_alternate_rounded,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              hintText: 'Add a caption...',
              hintStyle: const TextStyle(
                color: Color.fromARGB(255, 238, 238, 238),
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
              fillColor: const Color(0xFF202D35),
              counterText: '',
            ),
          ),
        ),
        IconButton(
          onPressed: () => editor.doneEditing(),
          icon: const Icon(Icons.send),
          style: IconButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}
