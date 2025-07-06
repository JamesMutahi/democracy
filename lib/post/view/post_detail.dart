import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/bottom_text_form_field.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/view/widgets/profile_page.dart';
import 'package:democracy/poll/view/poll_tile.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/post/view/replies.dart';
import 'package:democracy/survey/view/survey_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key, required this.post});

  final Post post;

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  late Post _post = widget.post;
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _disableSendButton = true;

  @override
  void initState() {
    context.read<WebsocketBloc>().add(
      WebsocketEvent.getReplies(post: widget.post),
    );
    super.initState();
  }

  void _setPostState(post) {
    if (_post.id == post.id) {
      setState(() {
        _post = post;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');
    var numberFormat = NumberFormat.compact(locale: "en_UK");
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        switch (state) {
          case PostUpdated(:final post):
            _setPostState(post);
          case PostCreated():
            final snackBar = SnackBar(
              behavior: SnackBarBehavior.floating,
              backgroundColor: Theme.of(context).cardColor,
              content: SnackBarContent(
                message: 'Reply sent',
                status: SnackBarStatus.success,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Post')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 10,
                  right: 10,
                  top: 10,
                  bottom: 5,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).disabledColor.withAlpha(30),
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        ProfilePage(user: _post.author),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Row(
                              children: [
                                ProfileImage(user: _post.author),
                                SizedBox(width: 10),
                                Text(
                                  '${_post.author.firstName} ${_post.author.lastName}',
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                        PostTileButton(
                          onTap: () {},
                          icon: Icon(
                            Symbols.more_vert_rounded,
                            size: 20,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(_post.body),
                    SizedBox(height: 5),
                    (_post.repostOf == null)
                        ? SizedBox.shrink()
                        : DependencyContainer(
                          child: PostTile(
                            post: _post.repostOf!,
                            isChildOfPost: true,
                          ),
                        ),
                    (_post.poll == null)
                        ? SizedBox.shrink()
                        : DependencyContainer(
                          child: PollTile(
                            poll: _post.poll!,
                            isChildOfPost: true,
                          ),
                        ),
                    (_post.survey == null)
                        ? SizedBox.shrink()
                        : DependencyContainer(
                          child: SurveyTile(
                            survey: _post.survey!,
                            isChildOfPost: true,
                          ),
                        ),
                    SizedBox(height: 5),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '${(_post.views > 0) ? '${_post.views} ${(_post.views == 1) ? 'View' : 'Views'} • ' : ''}'
                        '${timeFormat.format(_post.publishedAt)} • '
                        '${dateFormat.format(_post.publishedAt)}',
                        style: TextStyle(
                          color: Theme.of(context).disabledColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReplyButton(post: _post, numberFormat: numberFormat),
                        RepostButton(post: _post, numberFormat: numberFormat),
                        LikeButton(post: _post, numberFormat: numberFormat),
                        BookmarkButton(post: _post, numberFormat: numberFormat),
                        ShareButton(post: _post),
                      ],
                    ),
                  ],
                ),
              ),
              Replies(post: _post),
            ],
          ),
        ),
        bottomNavigationBar: BottomTextFormField(
          focusNode: _focusNode,
          showCursor: true,
          readOnly: false,
          controller: _controller,
          onTap: () {},
          onChanged: (value) {
            if (value == '') {
              setState(() {
                _disableSendButton = true;
              });
            } else {
              setState(() {
                _disableSendButton = false;
              });
            }
          },
          hintText: 'Reply',
          prefixIcon: null,
          onSend:
              _disableSendButton
                  ? null
                  : () {
                    context.read<WebsocketBloc>().add(
                      WebsocketEvent.createPost(
                        body: _controller.text,
                        status: PostStatus.published,
                        replyTo: _post,
                        repostOf: null,
                        poll: null,
                        survey: null,
                      ),
                    );
                    _controller.clear();
                    setState(() {
                      _disableSendButton = true;
                    });
                  },
        ),
      ),
    );
  }
}
