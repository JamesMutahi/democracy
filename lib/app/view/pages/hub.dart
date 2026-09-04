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
class HubPage extends StatefulWidget {
  const HubPage({super.key});

  @override
  State<HubPage> createState() => _HubState();
}

class _HubState extends State<HubPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return BlocProvider(
      create: (context) => HubFilterCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HubFilterCubit, HubFilterState>(
            buildWhen: (previous, current) => current.onHubPage,
            builder: (context, state) {
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
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
                        floating: false,
                        snap: false,
                        automaticallyImplyLeading: false,
                        flexibleSpace: Builder(
                          builder: (context) {
                            return _buildSearchBar(cubit, state);
                          },
                        ),
                      ),
                  ];
                },
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    double padding = responsive.smallerThan(TABLET) ? 15 : 40;

                    return GridView.count(
                      padding: EdgeInsets.all(padding),
                      crossAxisCount: 2,
                      mainAxisSpacing: padding,
                      crossAxisSpacing: padding,
                      children: [
                        _HubCard(
                          onTap: () => context.router.push(const BallotRoute()),
                          asset: 'assets/icons/ballot-box.svg',
                          title: 'Ballots',
                          description: 'Cast your vote on important decisions',
                          color: Colors.green.withValues(alpha: 0.25),
                          iconColor: colorScheme.primary,
                        ),
                        _HubCard(
                          onTap: () => context.router.push(const SurveyRoute()),
                          asset: 'assets/icons/question.svg',
                          title: 'Surveys',
                          description: 'Share your opinions and feedback',
                          color: Colors.cyan.withValues(alpha: 0.25),
                          iconColor: colorScheme.secondary,
                        ),
                        _HubCard(
                          onTap: () =>
                              context.router.push(const MeetingRoute()),
                          asset: 'assets/icons/meeting.svg',
                          title: 'Meetings',
                          description: 'Join live discussions and events',
                          color: Colors.blue.withValues(alpha: 0.25),
                          iconColor: colorScheme.tertiary,
                        ),
                        _HubCard(
                          onTap: () =>
                              context.router.push(const PetitionRoute()),
                          asset: 'assets/icons/signature.svg',
                          title: 'Petitions',
                          description: 'Support causes you care about',
                          color: Colors.teal.withValues(alpha: 0.25),
                          iconColor: colorScheme.error,
                        ),
                      ],
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar(HubFilterCubit cubit, HubFilterState state) {
    return CustomSearchBar(
      controller: _controller,
      hintText: 'Search ballots, surveys, meetings...',
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
        final filters = HubFilters(
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
                builder: (context) => filters,
              )
            : showGeneralDialog(
                context: context,
                transitionDuration: const Duration(milliseconds: 300),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    filters,
              );
      },
    );
  }
}

class _HubCard extends StatelessWidget {
  const _HubCard({
    required this.onTap,
    required this.asset,
    required this.title,
    required this.description,
    required this.color,
    required this.iconColor,
  });

  final VoidCallback onTap;
  final String asset;
  final String title;
  final String description;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    double imageSize = responsive.smallerThan(TABLET) ? 32 : 50;

    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: SvgPicture.asset(
                  asset,
                  width: imageSize,
                  height: imageSize,
                ),
              ),
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
