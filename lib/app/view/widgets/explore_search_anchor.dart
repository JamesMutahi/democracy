import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:democracy/app/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:democracy/app/shared/pages/search_results.dart'
    show SearchFilters;
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/post/bloc/post_detail/post_detail_bloc.dart';
import 'package:democracy/post/bloc/post_filter/post_filter_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

class ExploreSearchAnchor extends StatelessWidget {
  const ExploreSearchAnchor({
    super.key,
    required this.searchController,
    required this.filterCubit,
    required this.filterState,
    this.hideFilterButton = false,
    required this.onSubmitted,
  });

  final SearchController searchController;
  final PostFilterCubit filterCubit;
  final PostFilterState filterState;
  final bool hideFilterButton;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      searchController: searchController,
      isFullScreen: false,
      viewConstraints: const BoxConstraints(maxHeight: 400),
      shrinkWrap: true,
      viewLeading: IconButton.outlined(
        onPressed: () => searchController.closeView(searchController.text),
        icon: Icon(Symbols.keyboard_arrow_up),
      ),
      viewOnChanged: (value) {
        String searchTerm = value.toLowerCase().trim();
        context.read<AutocompleteBloc>().add(
          AutocompleteEvent.search(searchTerm: searchTerm),
        );
      },
      viewOnSubmitted: (value) async {
        if (value.trim().isNotEmpty) {
          final route = SearchResults(
            searchTerm: value,
            startDate: filterState.startDate,
            endDate: filterState.endDate,
            filterCount: filterState.count,
          );
          await context.router.push(route);
          onSubmitted();
        }
      },
      builder: (BuildContext context, SearchController controller) {
        return CustomSearchBar(
          controller: controller,
          hintText: 'Search',
          filterCount: filterState.count,
          onTap: () {
            String searchTerm = controller.text.toLowerCase().trim();
            context.read<AutocompleteBloc>().add(
              AutocompleteEvent.search(searchTerm: searchTerm),
            );
            controller.openView();
          },
          onTapOutside: () => controller.closeView(controller.text),
          onChanged: (value) => controller.openView(),
          onFilterTap: hideFilterButton
              ? null
              : () {
                  final filters = SearchFilters(
                    onExplorePage: true,
                    startDate: filterState.startDate,
                    endDate: filterState.endDate,
                    cubit: filterCubit,
                  );
                  kIsWeb
                      ? showModalBottomSheet<void>(
                          context: context,
                          isScrollControlled: true,
                          shape: const BeveledRectangleBorder(),
                          useSafeArea: true,
                          builder: (context) {
                            return filters;
                          },
                        )
                      : showGeneralDialog(
                          context: context,
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                                return filters;
                              },
                        );
                },
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        return [
          BlocBuilder<AutocompleteBloc, AutocompleteState>(
            builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...state.hashtags.map(
                    (hashtag) => ListTile(
                      title: Text(hashtag),
                      onTap: () {
                        controller.closeView(hashtag);
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<PostDetailBloc>().add(
                          PostDetailEvent.saveSearchedTerm(searchTerm: hashtag),
                        );
                        context.router.push(
                          SearchResults(
                            searchTerm: hashtag,
                            startDate: null,
                            endDate: null,
                            filterCount: 0,
                          ),
                        );
                      },
                    ),
                  ),
                  ...state.words.map(
                    (word) => ListTile(
                      title: Text(word),
                      trailing: controller.text.trim().isNotEmpty
                          ? SizedBox.shrink()
                          : IconButton(
                              onPressed: () =>
                                  context.read<PostDetailBloc>().add(
                                    PostDetailEvent.deleteSearchedTerm(
                                      searchTerm: word,
                                    ),
                                  ),
                              icon: Icon(Icons.close_rounded),
                            ),
                      onTap: () {
                        controller.closeView(word);
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<PostDetailBloc>().add(
                          PostDetailEvent.saveSearchedTerm(searchTerm: word),
                        );
                        context.router.push(
                          SearchResults(
                            searchTerm: word,
                            startDate: null,
                            endDate: null,
                            filterCount: 0,
                          ),
                        );
                      },
                    ),
                  ),
                  ...state.users.map(
                    (user) => ListTile(
                      leading: CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: CachedNetworkImage(
                            imageUrl: user.image,
                            cacheKey: 'profile_${user.id}',
                            fit: BoxFit.cover,
                            width: 40,
                            height: 40,
                            placeholder: (context, url) => _buildPlaceholder(),
                            errorWidget: (context, url, error) =>
                                _buildErrorWidget(),
                            fadeInDuration: const Duration(milliseconds: 200),
                          ),
                        ),
                      ),
                      title: Text(user.name, overflow: TextOverflow.ellipsis),
                      subtitle: Text('@${user.username}'),
                      trailing: controller.text.trim().isNotEmpty
                          ? SizedBox.shrink()
                          : IconButton(
                              onPressed: () =>
                                  context.read<PostDetailBloc>().add(
                                    PostDetailEvent.deleteSearchedProfile(
                                      userId: user.id,
                                    ),
                                  ),
                              icon: Icon(Icons.close_rounded),
                            ),
                      onTap: () {
                        controller.closeView(user.username);
                        FocusManager.instance.primaryFocus?.unfocus();
                        context.read<PostDetailBloc>().add(
                          PostDetailEvent.saveSearchedProfile(userId: user.id),
                        );
                        context.router.push(ProfileRoute(userId: user.id));
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ];
      },
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: Icon(Icons.person, size: 24, color: Colors.grey[600]),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.grey[300],
      child: Icon(
        Icons.broken_image_rounded,
        size: 24,
        color: Colors.grey[600],
      ),
    );
  }
}
