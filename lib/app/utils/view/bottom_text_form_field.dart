import 'package:flutter/material.dart';

class BottomTextFormField extends StatelessWidget {
  const BottomTextFormField({
    super.key,
    this.containerKey,
    required this.focusNode,
    required this.showCursor,
    required this.readOnly,
    this.autoFocus = false,
    required this.controller,
    required this.onTap,
    required this.onChanged,
    required this.hintText,
    required this.prefixIcon,
    this.onSend,
  });

  final Key? containerKey;
  final FocusNode focusNode;
  final bool showCursor;
  final bool readOnly;
  final bool autoFocus;
  final TextEditingController controller;
  final VoidCallback onTap;
  final void Function(String) onChanged;
  final String hintText;
  final Widget? prefixIcon;
  final void Function()? onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: containerKey,
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(context).canvasColor, width: 1.0),
        ),
      ),
      child: Row(
        children: [
          Flexible(
            flex: 6,
            child: TextFormField(
              focusNode: focusNode,
              showCursor: showCursor,
              readOnly: readOnly,
              autofocus: autoFocus,
              keyboardType: TextInputType.multiline,
              minLines: 1,
              maxLines: 4,
              maxLength: 500,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                hintText: hintText,
                hintStyle: TextStyle(color: Theme.of(context).hintColor),
                counterText: '',
                prefixIcon: prefixIcon,
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixStyle: TextStyle(color: Theme.of(context).primaryColor),
                contentPadding: const EdgeInsets.all(15),
                border: InputBorder.none,
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              controller: controller,
              onTap: onTap,
              onChanged: onChanged,
            ),
          ),
          Flexible(
            child: IconButton(
              onPressed: onSend,
              icon: Icon(Icons.send_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
