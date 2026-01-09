import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/utils/bottom_loader.dart';
import 'package:democracy/app/utils/failure_retry_button.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/post/bloc/community_notes/community_notes_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_create.dart';
import 'package:democracy/post/view/widgets/community_note_tile.dart';
import 'package:democracy/post/view/widgets/post_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class CommunityNotes extends StatefulWidget {
  const CommunityNotes({super.key, required this.post});

  final Post post;

  @override
  State<CommunityNotes> createState() => _CommunityNotesState();
}

class _CommunityNotesState extends State<CommunityNotes> {
  List<Post> _communityNotes = [];
  bool loading = true;
  bool failure = false;
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  @override
  void initState() {
    context.read<CommunityNotesBloc>().add(
      CommunityNotesEvent.get(post: widget.post),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<CommunityNotesBloc>().add(
                CommunityNotesEvent.resubscribe(
                  post: widget.post,
                  communityNotes: _communityNotes,
                ),
              );
            }
          },
        ),
        BlocListener<CommunityNotesBloc, CommunityNotesState>(
          listener: (context, state) {
            if (state.status == CommunityNotesStatus.success) {
              if (widget.post.id == state.postId) {
                setState(() {
                  loading = false;
                  failure = false;
                  _communityNotes = state.communityNotes;
                  hasNextPage = state.hasNext;
                  if (_refreshController.headerStatus ==
                      RefreshStatus.refreshing) {
                    _refreshController.refreshCompleted();
                  }
                  if (_refreshController.footerStatus == LoadStatus.loading) {
                    _refreshController.loadComplete();
                  }
                });
              }
            }
            if (state.status == CommunityNotesStatus.failure) {
              if (loading) {
                setState(() {
                  loading = false;
                  failure = true;
                });
              }
              if (_refreshController.headerStatus == RefreshStatus.refreshing) {
                _refreshController.refreshFailed();
              }
              if (_refreshController.footerStatus == LoadStatus.loading) {
                _refreshController.loadFailed();
              }
            }
          },
        ),
      ],
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                floating: true,
                snap: true,
                forceElevated: true,
                title: Row(
                  children: [
                    Icon(Icons.people_rounded, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    Text('Community notes'),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(60.0),
                  child: Expanded(
                    child: CustomSearchBar(
                      hintText: 'Search',
                      onChanged: (value) {
                        context.read<CommunityNotesBloc>().add(
                          CommunityNotesEvent.get(
                            post: widget.post,
                            searchTerm: value,
                          ),
                        );
                      },
                      onFilterTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => _FilterDialog(),
                        ).then((value) {});
                      },
                    ),
                  ),
                ),
              ),
            ];
          },
          body: loading
              ? BottomLoader()
              : failure
              ? FailureRetryButton(
                  onPressed: () {
                    context.read<CommunityNotesBloc>().add(
                      CommunityNotesEvent.get(post: widget.post),
                    );
                  },
                )
              : PostListener(
                  posts: _communityNotes,
                  onPostsUpdated: (posts) {
                    setState(() {
                      _communityNotes = posts;
                    });
                  },
                  child: SmartRefresher(
                    enablePullDown: true,
                    enablePullUp: hasNextPage,
                    header: ClassicHeader(),
                    controller: _refreshController,
                    onRefresh: () {
                      context.read<CommunityNotesBloc>().add(
                        CommunityNotesEvent.get(post: widget.post),
                      );
                    },
                    onLoading: () {
                      context.read<CommunityNotesBloc>().add(
                        CommunityNotesEvent.get(
                          post: widget.post,
                          lastPost: _communityNotes.last,
                        ),
                      );
                    },
                    footer: ClassicFooter(),
                    child: ListView.builder(
                      padding: EdgeInsets.only(bottom: 20),
                      itemBuilder: (BuildContext context, int index) {
                        Post communityNote = _communityNotes[index];
                        return CommunityNoteTile(
                          key: ValueKey(communityNote.id),
                          communityNote: communityNote,
                          navigateToDetailPage: true,
                          showWholeText: false,
                          isDependency: false,
                        );
                      },
                      itemCount: _communityNotes.length,
                    ),
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommunityNoteCreate(post: widget.post),
              ),
            );
          },
          child: Icon(Icons.create_outlined),
        ),
      ),
    );
  }
}

class _FilterDialog extends StatefulWidget {
  const _FilterDialog();

  @override
  State<_FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<_FilterDialog> {
  String? _selected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        color: Colors.red,
        height: 200,
        child: Column(
          children: <Widget>[
            Radio<String>(
              value: 'value',
              groupValue: 'value',
              onChanged: (value) {
                setState(() {
                  _selected = value;
                });
              },
            ),
            // ...filters.map((iconData) {
            //   int index = filters.indexOf(iconData);
            //   return Radio<String>(
            //     value: filters[index][0],
            //     groupValue: filters[index][0],
            //     onChanged: (value) {
            //       setState(() {
            //         _selected = value;
            //       });
            //     },
            //   );
            // }),
          ],
        ),
      ),
    );
  }
}

List<Map> filters = [
  {'score': 'Highest score'},
  {'recent': 'Newest first'},
  {'oldest': 'Oldest first'},
];
