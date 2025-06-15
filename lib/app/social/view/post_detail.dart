import 'package:democracy/app/social/models/post.dart';
import 'package:democracy/app/social/view/posts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';

class PostDetail extends StatelessWidget {
  const PostDetail({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    var timeFormat = DateFormat('hh:mm a');
    var dateFormat = DateFormat('dd/MM/yyyy');
    return Scaffold(
      appBar: AppBar(title: Text('Post')),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
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
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 10),
                        Text(
                          '${post.author.firstName} ${post.author.lastName}',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                    PostTileButton(iconData: Symbols.more_vert_rounded),
                  ],
                ),
                SizedBox(height: 5),
                Text(post.body),
                SizedBox(height: 5),
                (post.repostOf == null)
                    ? SizedBox.shrink()
                    : Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).disabledColor.withAlpha(30),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: PostTile(post: post.repostOf!, isRepost: true),
                    ),
                SizedBox(height: 5),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    '${(post.views > 0) ? '${post.views} ${(post.views == 1) ? 'View' : 'Views'} • ' : ''}'
                        '${timeFormat.format(post.publishedAt)} • '
                        '${dateFormat.format(post.publishedAt)}',
                    style: TextStyle(color: Theme.of(context).disabledColor),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PostTileButton(
                      iconData: Symbols.message_rounded,
                      trailing:
                          (post.replies > 0) ? post.replies.toString() : null,
                    ),
                    PostTileButton(
                      iconData: Symbols.sync_rounded,
                      trailing:
                          (post.reposts > 0) ? post.reposts.toString() : null,
                    ),
                    PostTileButton(
                      iconData: Symbols.favorite_rounded,
                      trailing: (post.likes > 0) ? post.likes.toString() : null,
                    ),
                    PostTileButton(
                      iconData: Symbols.bookmark_rounded,
                      trailing:
                          (post.bookmarks > 0)
                              ? post.bookmarks.toString()
                              : null,
                    ),
                    PostTileButton(iconData: Symbols.share_rounded),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
