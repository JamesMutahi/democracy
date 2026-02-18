import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/post/bloc/community_notes/community_notes_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/community_note_create.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
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
  final TextEditingController _searchController = TextEditingController();
  String? sortBy;

  @override
  void initState() {
    context.read<CommunityNotesBloc>().add(
      CommunityNotesEvent.get(post: widget.post, sortBy: 'score'),
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
                  preferredSize: Size.fromHeight(50.0),
                  child: CustomSearchBar(
                    controller: _searchController,
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
                        builder: (context) => _SortByDialog(selected: sortBy),
                      ).then((value) {
                        if (value != null) {
                          setState(() {
                            sortBy = value;
                          });
                          if (context.mounted) {
                            context.read<CommunityNotesBloc>().add(
                              CommunityNotesEvent.get(
                                post: widget.post,
                                searchTerm: _searchController.text,
                                sortBy: value,
                              ),
                            );
                          }
                        }
                      });
                    },
                  ),
                ),
              ),
            ];
          },
          body: SafeArea(
            child: PostListView(
              posts: _communityNotes,
              loading: loading,
              failure: failure,
              onPostsUpdated: (posts) {
                setState(() {
                  _communityNotes = posts;
                });
              },
              refreshController: _refreshController,
              enablePullDown: true,
              enablePullUp: hasNextPage,
              checkVisibility: true,
              onRefresh: () {
                context.read<CommunityNotesBloc>().add(
                  CommunityNotesEvent.get(
                    post: widget.post,
                    searchTerm: _searchController.text,
                    sortBy: sortBy,
                  ),
                );
              },
              onLoading: () {
                context.read<CommunityNotesBloc>().add(
                  CommunityNotesEvent.get(
                    post: widget.post,
                    previousPosts: _communityNotes,
                    sortBy: sortBy,
                  ),
                );
              },
              onFailure: () {
                context.read<CommunityNotesBloc>().add(
                  CommunityNotesEvent.get(post: widget.post, sortBy: sortBy),
                );
              },
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

class _SortByDialog extends StatelessWidget {
  const _SortByDialog({required this.selected});

  final String? selected;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15),
            child: Text(
              'Sorted by:',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          FormBuilderRadioGroup<String>(
            name: 'sort by',
            initialValue: selected ?? 'score',
            orientation: OptionsOrientation.vertical,
            decoration: InputDecoration(border: InputBorder.none),
            options: [
              FormBuilderFieldOption<String>(
                value: 'score',
                child: Text('Highest score (default)'),
              ),
              FormBuilderFieldOption<String>(
                value: 'recent',
                child: Text('Newest first'),
              ),
              FormBuilderFieldOption<String>(
                value: 'oldest',
                child: Text('Oldest first'),
              ),
            ],
            onChanged: (value) {
              Navigator.pop(context, value);
            },
            separator: const VerticalDivider(width: 10, thickness: 5),
          ),
        ],
      ),
    );
  }
}
