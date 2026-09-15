import 'package:auto_route/auto_route.dart';
import 'package:democracy/app/shared/widgets/active_scroll_controller.dart';
import 'package:democracy/app/shared/widgets/logo.dart';
import 'package:democracy/app/shared/widgets/main_container.dart';
import 'package:democracy/app/view/widgets/custom_appbar.dart';
import 'package:democracy/app/view/widgets/home_tabs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final ScrollController _forYouScrollController = ScrollController();
  final ScrollController _followingScrollController = ScrollController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Register the initial active controller
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ActiveScrollController.activate(_activeScrollController!);
    });
  }

  void _onTabChanged() {
    _deactivateTabScrollControllers();
    ActiveScrollController.activate(_activeScrollController!);
  }

  void _deactivateTabScrollControllers() {
    ActiveScrollController.deactivate(_forYouScrollController);
    ActiveScrollController.deactivate(_followingScrollController);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    // Clear the registry when leaving
    _deactivateTabScrollControllers();
    _forYouScrollController.dispose();
    _followingScrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  ScrollController? get _activeScrollController {
    return _tabController.index == 0
        ? _forYouScrollController
        : _followingScrollController;
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);

    return Scaffold(
      body: SafeArea(
        child: kIsWeb && responsive.largerThan(MOBILE)
            ? _buildWeb()
            : _buildMobile(),
      ),
    );
  }

  Widget _buildWeb() {
    return MainContainer(
      child: Column(
        children: [
          _buildTabBar(),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  Widget _buildMobile() {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            floating: true,
            snap: true,
            automaticallyImplyLeading: false,
            forceElevated: true,
            flexibleSpace: Builder(
              builder: (context) {
                return Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: 55,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [DrawerOpener(), NotificationButton()],
                      ),
                    ),
                    const Positioned(
                      top: 5,
                      child: Logo(width: 60, height: 60),
                    ),
                  ],
                );
              },
            ),
            bottom: _buildTabBar(),
          ),
        ];
      },
      body: _buildTabBarView(),
    );
  }

  PreferredSizeWidget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      dividerColor: Theme.of(context).disabledColor.withAlpha(30),
      labelStyle: Theme.of(context).textTheme.titleMedium,
      unselectedLabelStyle: Theme.of(context).textTheme.titleMedium,
      tabs: const [
        Tab(text: 'For You'),
        Tab(text: 'Following'),
      ],
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        ForYouTab(scrollController: _forYouScrollController),
        FollowingTab(scrollController: _followingScrollController),
      ],
    );
  }
}
