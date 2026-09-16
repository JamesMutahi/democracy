import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/constants/variables.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/chat/bloc/chat/chat_bloc.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:democracy/chat/view/utils/last_message.dart';
import 'package:democracy/user/models/user.dart';
import 'package:democracy/user/view/widgets/profile_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.chat,
    required this.currentUser,
    required this.otherUser,
  });

  final Chat chat;
  final User currentUser;
  final User otherUser;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final hasUnread = chat.unreadMessages > 0;

    return InkWell(
      onTap: () {
        if (kIsWeb && responsive.largerOrEqualTo(expandSidePanel)) {
          context.read<ChatBloc>().add(ChatEvent.load(chatId: chat.id));
        } else {
          context.router.push(ChatDetail(chatId: chat.id));
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar
            ProfileImage(
              userId: otherUser.id,
              username: otherUser.username,
              imageUrl: otherUser.image,
              radius: 28,
            ),
            const SizedBox(width: 12),

            // Content
            chat.lastMessage == null
                ? Column(children: [_buildName(context, hasUnread)])
                : _buildContent(context, hasUnread),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool hasUnread) {
    final colorScheme = Theme.of(context).colorScheme;

    final lastMessage = chat.lastMessage!;
    final isFromMe = lastMessage.author.id == currentUser.id;
    final lastMessagePrefix = isFromMe ? 'You: ' : '';
    final subtitleText = getLastMessageText(lastMessage, lastMessagePrefix);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Name & Time Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: _buildName(context, hasUnread)),
              const SizedBox(width: 8),
              Text(
                _formatChatTime(lastMessage.createdAt),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: hasUnread
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                  fontWeight: hasUnread ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Message & Unread Badge Row
          Row(
            children: [
              if (isFromMe) ...[
                Icon(
                  lastMessage.isRead
                      ? Icons.done_all_rounded
                      : Icons.done_rounded,
                  size: 16,
                  color: lastMessage.isRead
                      ? colorScheme.primary
                      : colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
              ],
              Expanded(
                child: Text(
                  subtitleText,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: hasUnread
                        ? colorScheme.onSurface
                        : colorScheme.onSurfaceVariant,
                    fontWeight: hasUnread ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ),
              if (!chat.isMessageRequest && hasUnread) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    chat.unreadMessages > 99
                        ? '99+'
                        : chat.unreadMessages.toString(),
                    style: TextStyle(
                      color: colorScheme.onPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context, bool hasUnread) {
    return Text(
      otherUser.name,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
        fontWeight: hasUnread ? FontWeight.bold : FontWeight.w600,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  String _formatChatTime(DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(
      createdAt.year,
      createdAt.month,
      createdAt.day,
    );
    final yesterday = today.subtract(const Duration(days: 1));

    if (messageDate == today) {
      return DateFormat('h:mm a').format(createdAt); // e.g., "2:30 PM"
    } else if (messageDate == yesterday) {
      return 'Yesterday';
    } else {
      return DateFormat('dd/MM/yyyy').format(createdAt);
    }
  }
}
