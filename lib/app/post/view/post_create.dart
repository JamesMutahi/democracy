import 'package:democracy/app/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/app/post/models/post.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostCreate extends StatefulWidget {
  const PostCreate({super.key});

  @override
  State<PostCreate> createState() => _PostCreateState();
}

class _PostCreateState extends State<PostCreate> {
  String body = '';
  @override
  Widget build(BuildContext context) {
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        if (state is PostCreated) {
          Navigator.pop(context);
          String message =
              state.post.status == PostStatus.published
                  ? 'Post published'
                  : 'Post saved as draft';
          final snackBar = SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Theme.of(context).cardColor,
            content: SnackBarContent(
              message: message,
              status: SnackBarStatus.success,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Post')),
        body: Container(
          margin: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        body = value;
                      });
                    },
                    minLines: 1,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    onTapOutside: (event) {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    PostExtraButton(
                      iconData: Symbols.gallery_thumbnail_rounded,
                    ),
                    SizedBox(width: 15),
                    PostExtraButton(iconData: Symbols.edit_calendar_rounded),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: _BottomNavBar(body: body),
      ),
    );
  }
}

class _BottomNavBar extends StatelessWidget {
  const _BottomNavBar({required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 65,
      color: Theme.of(context).cardColor,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [PostButton(body: body)],
        ),
      ),
    );
  }
}

class PostButton extends StatelessWidget {
  const PostButton({super.key, required this.body});

  final String body;

  @override
  Widget build(BuildContext context) {
    bool disabled = body == '';
    final backgroundColor =
        (disabled)
            ? Theme.of(context).disabledColor
            : Theme.of(context).primaryColor;
    final textColor = (disabled) ? Colors.white38 : Colors.white;
    return BlocBuilder<WebsocketBloc, WebsocketState>(
      builder: (context, state) {
        switch (state.status) {
          case WebsocketStatus.loading:
            return FilledButton.tonal(
              onPressed: null,
              child: SpinKitThreeBounce(size: 40, color: Colors.green.shade900),
            );
          default:
            return FilledButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(backgroundColor),
              ),
              onPressed: () {
                if (!disabled) {
                  context.read<WebsocketBloc>().add(
                    WebsocketEvent.createPost(body: body),
                  );
                }
              },
              child: Text('Post', style: TextStyle(color: textColor)),
            );
        }
      },
    );
  }
}

class PostExtraButton extends StatelessWidget {
  const PostExtraButton({super.key, required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      splashColor: Theme.of(context).colorScheme.secondaryFixedDim,
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          // color: Theme.of(context).canvasColor,
          border: Border.all(color: Theme.of(context).disabledColor),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Icon(iconData, color: Theme.of(context).disabledColor, size: 20),
      ),
    );
  }
}
