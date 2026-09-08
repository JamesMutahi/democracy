import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_bloc.dart';
import 'package:democracy/chat/view/chats.dart';
import 'package:democracy/chat/view/create_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              if (responsive.isMobile)
                CustomAppBar(
                  middle: Text(
                    'Chat',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  bottom: PreferredSize(
                    preferredSize: Size.fromHeight(60.0),
                    child: BlocConsumer<ChatFilterCubit, ChatFilterState>(
                      listener: (context, state) {
                        context.read<ChatsBloc>().add(
                          ChatsEvent.get(searchTerm: state.searchTerm),
                        );
                      },
                      builder: (context, state) {
                        return _buildSearchBar();
                      },
                    ),
                  ),
                )
              else
                SliverAppBar(
                  pinned: true,
                  floating: false,
                  snap: false,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Builder(
                    builder: (context) {
                      return _buildSearchBar();
                    },
                  ),
                ),
            ];
          },
          body: Stack(
            children: [
              const Chats(),
              Positioned(
                bottom: 24,
                right: 24,
                child: FloatingActionButton(
                  heroTag: 'new_message',
                  elevation: 4,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      useSafeArea: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      builder: (context) => const CreateMessage(),
                    );
                  },
                  child: const Icon(Icons.edit_rounded, size: 28),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return CustomSearchBar(
      controller: _controller,
      hintText: 'Search',
      onChanged: (value) {
        context.read<ChatFilterCubit>().searchTermChanged(searchTerm: value);
      },
    );
  }
}
