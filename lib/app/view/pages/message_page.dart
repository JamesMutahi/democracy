import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/chat/bloc/chat_filter/chat_filter_cubit.dart';
import 'package:democracy/chat/bloc/chats/chats_bloc.dart';
import 'package:democracy/chat/view/chats.dart';
import 'package:democracy/chat/view/create_message.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagePage extends StatefulWidget {
  const MessagePage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final int notifications;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return NestedScrollView(
      headerSliverBuilder: (context, bool innerBoxIsScrolled) {
        return [
          CustomAppBar(
            user: widget.user,
            notifications: widget.notifications,
            middle: Text(
              'Messages',
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
                  return CustomSearchBar(
                    controller: _controller,
                    hintText: 'Search',
                    onChanged: (value) {
                      context.read<ChatFilterCubit>().searchTermChanged(
                        searchTerm: value,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: Stack(
        children: [
          Chats(),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: EdgeInsets.only(right: 10, bottom: 10),
              child: FloatingActionButton(
                heroTag: 'message',
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    isScrollControlled: true,
                    useSafeArea: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: const BeveledRectangleBorder(),
                    builder: (context) => CreateMessage(),
                  );
                },
                child: Icon(Icons.send_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
