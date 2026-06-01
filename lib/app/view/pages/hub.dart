import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/bloc/hub_filter/hub_filter_cubit.dart';
import 'package:democracy/app/view/router/router.gr.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/hub_filter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class Hub extends StatefulWidget {
  const Hub({super.key});

  @override
  State<Hub> createState() => _HubState();
}

class _HubState extends State<Hub> {
  final TextEditingController _controller = TextEditingController();
  double padding = 15;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return BlocProvider(
      create: (context) => HubFilterCubit(),
      child: Scaffold(
        body: BlocBuilder<HubFilterCubit, HubFilterState>(
          buildWhen: (previous, current) {
            return current.onHubPage;
          },
          builder: (context, state) {
            return NestedScrollView(
              headerSliverBuilder: (context, bool innerBoxIsScrolled) {
                final cubit = context.read<HubFilterCubit>();
                return [
                  if (responsive.isMobile)
                    CustomAppBar(
                      middle: Text(
                        'Hub',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      bottom: PreferredSize(
                        preferredSize: Size.fromHeight(60.0),
                        child: _buildSearchBar(cubit, state),
                      ),
                    )
                  else
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      snap: true,
                      automaticallyImplyLeading: false,
                      flexibleSpace: Builder(
                        builder: (context) {
                          return SizedBox(
                            height: 60,
                            child: _buildSearchBar(cubit, state),
                          );
                        },
                      ),
                    ),
                ];
              },
              body: GridView.count(
                padding: EdgeInsets.all(padding),
                crossAxisCount: 2,
                mainAxisSpacing: padding,
                crossAxisSpacing: padding,
                children: [
                  _HubCard(
                    onTap: () {
                      context.router.push(const BallotRoute());
                    },
                    asset: 'assets/icons/ballot-box.svg',
                    text: 'Ballots',
                  ),
                  _HubCard(
                    onTap: () {
                      context.router.push(const SurveyRoute());
                    },
                    asset: 'assets/icons/question.svg',
                    text: 'Surveys',
                  ),
                  _HubCard(
                    onTap: () {
                      context.router.push(const MeetingRoute());
                    },
                    asset: 'assets/icons/meeting.svg',
                    text: 'Meetings',
                  ),
                  _HubCard(
                    onTap: () {
                      context.router.push(const PetitionRoute());
                    },
                    asset: 'assets/icons/signature.svg',
                    text: 'Petitions',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSearchBar(HubFilterCubit cubit, HubFilterState state) {
    return CustomSearchBar(
      controller: _controller,
      hintText: 'Search',
      filterCount: state.count,
      onSubmitted: (value) async {
        if (_controller.text.trim().isNotEmpty) {
          final route = HubResults(
            searchTerm: _controller.text,
            filterByRegion: state.filterByRegion,
            sortBy: state.sortBy,
            startDate: state.startDate,
            endDate: state.endDate,
            filterCount: state.count,
          );
          await context.router.push(route);
          _controller.clear();
        }
      },
      onFilterTap: () {
        final filters = HubFiltersModal(
          onHubPage: true,
          filterByRegion: state.filterByRegion,
          sortBy: state.sortBy,
          startDate: state.startDate,
          endDate: state.endDate,
          cubit: cubit,
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
                pageBuilder: (context, animation, secondaryAnimation) {
                  return filters;
                },
              );
      },
    );
  }
}

class _HubCard extends StatelessWidget {
  const _HubCard({
    required this.onTap,
    required this.asset,
    required this.text,
  });

  final VoidCallback onTap;
  final String asset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.filled(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(asset, width: 60, height: 60),
            SizedBox(height: 10),
            Text(text, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}
