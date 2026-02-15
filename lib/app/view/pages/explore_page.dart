import 'package:democracy/app/bloc/websocket/websocket_bloc.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/filters_modal.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:democracy/post/bloc/posts/posts_bloc.dart';
import 'package:democracy/post/models/post.dart';
import 'package:democracy/post/view/widgets/post_listview.dart';
import 'package:democracy/user/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({
    super.key,
    required this.user,
    required this.notifications,
  });

  final User user;
  final int notifications;

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage>
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
              'Explore',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(60.0),
              child: BlocConsumer<PostFilterCubit, PostFilterState>(
                listener: (context, state) {
                  context.read<PostsBloc>().add(
                    PostsEvent.get(
                      searchTerm: state.searchTerm,
                      startDate: state.startDate,
                      endDate: state.endDate,
                    ),
                  );
                },
                builder: (context, state) {
                  return CustomSearchBar(
                    controller: _controller,
                    hintText: 'Search',
                    onChanged: (value) {
                      context.read<PostFilterCubit>().searchTermChanged(
                        searchTerm: value,
                      );
                    },
                    onFilterTap: () {
                      showGeneralDialog(
                        context: context,
                        transitionDuration: const Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return _FiltersModal(
                            startDate: state.startDate,
                            endDate: state.endDate,
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ];
      },
      body: _Posts(),
    );
  }
}

class _Posts extends StatefulWidget {
  const _Posts();

  @override
  State<_Posts> createState() => _PostsState();
}

class _PostsState extends State<_Posts> {
  bool loading = false;
  bool failure = false;
  List<Post> _posts = [];
  bool hasNextPage = false;
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<PostsBloc, PostsState>(
          listener: (context, state) {
            if (state.status == PostsStatus.success) {
              setState(() {
                _posts = state.posts.toList();
                loading = false;
                failure = false;
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
            if (state.status == PostsStatus.failure) {
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
        BlocListener<WebsocketBloc, WebsocketState>(
          listener: (context, state) {
            if (state.status == WebsocketStatus.connected) {
              context.read<PostsBloc>().add(
                PostsEvent.resubscribe(posts: _posts),
              );
            }
          },
        ),
      ],
      child: BlocBuilder<PostFilterCubit, PostFilterState>(
        builder: (context, state) {
          void getPosts({List<Post>? lastPosts}) {
            context.read<PostsBloc>().add(
              PostsEvent.get(
                searchTerm: state.searchTerm,
                startDate: state.startDate,
                endDate: state.endDate,
              ),
            );
          }

          return PostListView(
            posts: _posts,
            loading: loading,
            failure: failure,
            onPostsUpdated: (posts) {
              setState(() {
                _posts = posts;
              });
            },
            refreshController: _refreshController,
            enablePullDown: true,
            enablePullUp: hasNextPage,
            checkVisibility: true,
            onRefresh: getPosts,
            onLoading: () {
              getPosts(lastPosts: _posts);
            },
            onFailure: getPosts,
          );
        },
      ),
    );
  }
}

class _FiltersModal extends StatefulWidget {
  const _FiltersModal({required this.startDate, required this.endDate});

  final DateTime? startDate;
  final DateTime? endDate;

  @override
  State<_FiltersModal> createState() => _FiltersModalState();
}

class _FiltersModalState extends State<_FiltersModal> {
  late DateTime? startDate = widget.startDate;
  late DateTime? endDate = widget.endDate;

  @override
  Widget build(BuildContext context) {
    return FiltersModal(
      applyButtonIsDisabled:
          (startDate == widget.startDate && endDate == widget.startDate),
      clearButtonIsDisabled: startDate == null && endDate == null,
      onApply: () {
        context.read<PostFilterCubit>().datesChanged(
          startDate: startDate,
          endDate: endDate,
        );
      },
      onClear: () {
        context.read<PostFilterCubit>().clearFilters();
        Navigator.pop(context);
      },
      widgets: [
        DateRangeFilter(
          value: [startDate, endDate],
          onValueChanged: (dates) {
            setState(() {
              startDate = dates.isNotEmpty ? dates[0] : null;
              endDate = dates.length == 2 ? dates[1] : null;
            });
          },
        ),
        const Divider(),
      ],
    );
  }
}
