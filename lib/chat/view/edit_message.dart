import 'package:auto_route/auto_route.dart';
import 'package:democracy/chat/bloc/message_actions/message_actions_cubit.dart';
import 'package:democracy/chat/bloc/message_detail/message_detail_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/models/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class EditMessage extends StatefulWidget {
  const EditMessage({super.key, required this.chat, required this.message});

  final Chat chat;
  final Message message;

  @override
  State<EditMessage> createState() => _EditMessageState();
}

class _EditMessageState extends State<EditMessage> {
  final _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.message.text;
    // Ensure action buttons are closed when entering edit mode
    context.read<MessageActionsCubit>().closeActionButtons();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  // Smart validation: true only if text is not empty AND actually changed
  bool get _isChanged =>
      _controller.text.trim().isNotEmpty &&
      _controller.text.trim() != widget.message.text.trim();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Message'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          onPressed: () => context.router.popTop(),
          tooltip: 'Cancel',
        ),
        actions: [
          TextButton(
            onPressed: _isChanged ? _saveEdit : null,
            child: const Text('Save'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          // Scrollable Content Area
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Original Message',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Read-only preview of the original message
                  _OriginalMessageBubble(message: widget.message),

                  const SizedBox(height: 32),

                  Text(
                    'Edit',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),

          // Clean, Dedicated Input Area
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextField(
                      focusNode: _focusNode,
                      controller: _controller,
                      autofocus: true,
                      maxLines: 5,
                      minLines: 1,
                      textInputAction: TextInputAction.newline,
                      onChanged: (_) =>
                          setState(() {}), // Rebuild to update button state
                      decoration: InputDecoration(
                        hintText: 'Edit your message...',
                        filled: true,
                        fillColor: colorScheme.surfaceContainerHighest,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: _isChanged ? _saveEdit : null,
                    icon: const Icon(Icons.check_rounded),
                    style: IconButton.styleFrom(
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                    ),
                    tooltip: 'Save changes',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _saveEdit() {
    if (_isChanged) {
      context.read<MessageDetailBloc>().add(
        MessageDetailEvent.edit(
          message: widget.message,
          text: _controller.text.trim(),
        ),
      );
      context.router.popTop();
    }
  }
}

// -----------------------------------------------------------------------------
// Read-Only Original Message Bubble
// -----------------------------------------------------------------------------

class _OriginalMessageBubble extends StatelessWidget {
  const _OriginalMessageBubble({required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final responsive = ResponsiveBreakpoints.of(context);
    final double maxWidth = responsive.screenWidth < 600
        ? MediaQuery.of(context).size.width * 0.85
        : 450.0;

    return Align(
      alignment:
          Alignment.centerRight, // Users can only edit their own messages
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                // Muted colors to indicate this is a reference, not the active bubble
                color: colorScheme.surfaceContainerHighest,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4), // Sharp corner for sender
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (message.text.isNotEmpty)
                    Text(
                      message.text,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),

                  // Subtle indicator if the original message had attachments
                  if (message.assets.isNotEmpty ||
                      message.location != null ||
                      message.post != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.attach_file_rounded,
                            size: 16,
                            color: colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Contains attachments',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 4),
            // Original timestamp
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                DateFormat('h:mm a').format(message.createdAt),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
