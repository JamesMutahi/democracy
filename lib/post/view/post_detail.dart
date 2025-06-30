import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/app/view/widgets/profile_page.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_cubit.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/post_tile.dart';
import 'package:democracy/post/view/replies.dart';
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
    return BlocListener<PostDetailCubit, PostDetailState>(
      listener: (context, state) {
        switch (state) {
          case PostUpdated():
            _setPostState(state.post);
          case PostLiked():
            _setPostState(state.post);
          case PostBookmarked():
            _setPostState(state.post);
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
                        : Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(
                                context,
                              ).disabledColor.withAlpha(30),
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: PostTile(
                            post: _post.repostOf!,
                            isRepost: true,
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
                        ReplyButton(post: _post),
                        RepostButton(post: _post),
                        LikeButton(post: _post),
                        BookmarkButton(post: _post),
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
      ),
    );
  }
}
