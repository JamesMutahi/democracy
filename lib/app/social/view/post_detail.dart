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
                  color: Theme.of(context).disabledColor.withAlpha(10),
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
                Row(
                  children: [
                    Text(
                      '${timeFormat.format(post.publishedAt)} • '
                      '${dateFormat.format(post.publishedAt)} • '
                      '${post.views} ${(post.views == 1) ? 'View' : 'Views'}',
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PostTileButton(
                      iconData: Symbols.message_rounded,
                      trailing: post.replies.toString(),
                    ),
                    PostTileButton(
                      iconData: Symbols.sync_rounded,
                      trailing: post.reposts.toString(),
                    ),
                    PostTileButton(
                      iconData: Symbols.favorite_rounded,
                      trailing: post.likes.toString(),
                    ),
                    PostTileButton(iconData: Symbols.bookmark_rounded),
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
