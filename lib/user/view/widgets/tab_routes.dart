import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/user/bloc/profile/profile_bloc.dart';
import 'package:democracy/user/view/widgets/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class ProfilePostsTab extends StatefulWidget {
  const ProfilePostsTab({super.key});

  @override
  State<ProfilePostsTab> createState() => _ProfilePostsTabState();
}

class _ProfilePostsTabState extends State<ProfilePostsTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserPosts(user: context.read<ProfileBloc>().state.user!);
  }
}

@RoutePage()
class ProfileRepliesTab extends StatefulWidget {
  const ProfileRepliesTab({super.key});

  @override
  State<ProfileRepliesTab> createState() => _ProfileRepliesTabState();
}

class _ProfileRepliesTabState extends State<ProfileRepliesTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserReplies(user: context.read<ProfileBloc>().state.user!);
  }
}

@RoutePage()
class ProfileLikesTab extends StatefulWidget {
  const ProfileLikesTab({super.key});

  @override
  State<ProfileLikesTab> createState() => _ProfileLikesTabState();
}

class _ProfileLikesTabState extends State<ProfileLikesTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Likes(user: context.read<ProfileBloc>().state.user!);
  }
}

@RoutePage()
class ProfileNotesTab extends StatefulWidget {
  const ProfileNotesTab({super.key});

  @override
  State<ProfileNotesTab> createState() => _ProfileNotesTabState();
}

class _ProfileNotesTabState extends State<ProfileNotesTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserCommunityNotes(user: context.read<ProfileBloc>().state.user!);
  }
}

@RoutePage()
class ProfilePetitionsTab extends StatefulWidget {
  const ProfilePetitionsTab({super.key});

  @override
  State<ProfilePetitionsTab> createState() => _ProfilePetitionsTabState();
}

class _ProfilePetitionsTabState extends State<ProfilePetitionsTab> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) ActiveScrollController.activate(_scrollController);
    });
  }

  @override
  void dispose() {
    ActiveScrollController.deactivate(_scrollController);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UserPetitions(
      user: context.read<ProfileBloc>().state.user!,
      // scrollController:  PrimaryScrollController.of(context),
    );
  }
}
