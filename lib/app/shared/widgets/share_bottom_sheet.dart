import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/services/websocket_service.dart';
import 'package:democracy/app/shared/utils/copy.dart';
import 'package:democracy/chat/view/direct_message.dart';
import 'package:democracy/app/shared/widgets/custom_bottom_sheet.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/ballot/models/ballot.dart';
import 'package:democracy/constitution/models/section.dart';
import 'package:democracy/broadcast/models/broadcast.dart';
import 'package:democracy/petition/models/petition.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/survey/models/survey.dart';
import 'package:democracy/user/bloc/users/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class ShareBottomSheet extends StatelessWidget {
  const ShareBottomSheet({
    super.key,
    this.post,
    this.ballot,
    this.survey,
    this.petition,
    this.broadcast,
    this.section,
  });

  final Post? post;
  final Ballot? ballot;
  final Survey? survey;
  final Petition? petition;
  final Broadcast? broadcast;
  final Section? section;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final String name = _getShareableName();
    final int id = _getShareableId();

    return CustomBottomSheet(
      title: 'Share $name',
      children: [
        _ShareOption(
          icon: Symbols.mail_rounded,
          iconColor: colorScheme.primary,
          iconBackgroundColor: colorScheme.primaryContainer,
          label: 'Send via Direct Message',
          subtitle: 'Share privately with someone',
          onTap: () {
            context.router.popTop();
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => BlocProvider(
                create: (context) => UsersBloc(
                  webSocketService: context.read<WebSocketService>(),
                ),
                child: DirectMessage(
                  post: post,
                  ballot: ballot,
                  survey: survey,
                  petition: petition,
                  broadcast: broadcast,
                  section: section,
                ),
              ),
            );
          },
        ),

        const SizedBox(height: 16),
        Divider(
          height: 1,
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        const SizedBox(height: 16),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            childAspectRatio: 0.9,
            children: [
              _ShareGridItem(
                icon: Symbols.link_rounded,
                label: 'Copy Link',
                onTap: () {
                  context.router.popTop();
                  String path = '$name/$id/';
                  if (section != null) {
                    path = 'constitution?id=$id';
                  }
                  copyLink(
                    navigatorKey: context.router.navigatorKey,
                    path: path,
                  );
                },
              ),
              _ShareGridItem(
                icon: Icons.post_add_rounded,
                label: 'Create Post',
                onTap: () {
                  context.router.popTop();
                  context.router.push(
                    PostCreate(
                      repostOf: post,
                      ballot: ballot,
                      survey: survey,
                      petition: petition,
                      broadcast: broadcast,
                      section: section,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  String _getShareableName() {
    if (post != null) return 'post';
    if (ballot != null) return 'ballot';
    if (survey != null) return 'survey';
    if (broadcast != null) {
      switch (broadcast!.type) {
        case BroadcastType.meeting:
          return 'meeting';
        case BroadcastType.livestream:
          return 'livestream';
      }
    }
    if (petition != null) return 'petition';
    if (section != null) return 'section';
    throw StateError('ShareBottomSheet: No shareable item provided');
  }

  int _getShareableId() {
    if (post != null) return post!.id;
    if (ballot != null) return ballot!.id;
    if (survey != null) return survey!.id;
    if (broadcast != null) return broadcast!.id;
    if (petition != null) return petition!.id;
    if (section != null) return section!.id;
    throw StateError('ShareBottomSheet: No shareable item provided');
  }
}

class _ShareOption extends StatelessWidget {
  const _ShareOption({
    required this.icon,
    required this.iconColor,
    required this.iconBackgroundColor,
    required this.label,
    this.subtitle,
    required this.onTap,
  });

  final IconData icon;
  final Color iconColor;
  final Color iconBackgroundColor;
  final String label;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 2),
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              Icon(
                Symbols.chevron_right_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShareGridItem extends StatelessWidget {
  const _ShareGridItem({
    required this.icon,

    required this.label,
    required this.onTap,
  });

  final IconData icon;

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, size: 28),
              ),
              const SizedBox(height: 8),
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
