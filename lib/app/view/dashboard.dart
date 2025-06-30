import 'package:democracy/app/bloc/bottom_nav/bottom_navbar_cubit.dart';
import 'package:democracy/app/view/pages/index.dart';
import 'package:democracy/app/view/widgets/bottom_nav_bar.dart';
import 'package:democracy/app/view/widgets/chat_actions.dart';
import 'package:democracy/app/view/widgets/drawer.dart';
import 'package:democracy/app/utils/view/snack_bar_content.dart';
import 'package:democracy/app/utils/view/profile_image.dart';
import 'package:democracy/auth/bloc/auth/auth_bloc.dart';
import 'package:democracy/auth/models/user.dart';
import 'package:democracy/chat/bloc/chat_actions/chat_actions_cubit.dart';
import 'package:democracy/chat/models/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/symbols.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final pageController = PageController();
  DateTime? currentBackPressTime;
  bool canPopNow = false;
  int requiredSeconds = 2;
  bool showChatActions = false;
  Set<Chat> chats = {};

  @override
  Widget build(BuildContext context) {
    ScaffoldFeatureController showSnackBar({required SnackBar snackBar}) {
      ScaffoldMessenger.of(context).clearSnackBars();
      return ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    void onPopInvoked(bool didPop) {
      if (_key.currentState!.isDrawerOpen) {
        _key.currentState!.closeDrawer();
        return;
      }
      if (showChatActions) {
        context.read<ChatActionsCubit>().closeActionButtons();
        return;
      }
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime!) >
              Duration(seconds: requiredSeconds)) {
        currentBackPressTime = now;
        final snackBar = SnackBar(
          behavior: SnackBarBehavior.floating,
          backgroundColor: Theme.of(context).cardColor,
          closeIconColor: Theme.of(context).primaryColor,
          content: const SnackBarContent(
            message: 'Press back again to close',
            status: SnackBarStatus.info,
          ),
        );
        ScaffoldFeatureController controller = showSnackBar(snackBar: snackBar);
        Future.delayed(Duration(seconds: requiredSeconds), () {
          // Disable pop invoke and close the snack bar after 2s timeout
          setState(() {
            canPopNow = false;
          });
          controller.close();
        });
        // Ok, let user exit app on the next back press
        setState(() {
          canPopNow = true;
        });
      }
    }

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        late User user;
        if (state is Authenticated) {
          user = state.user;
        }
        return BlocListener<ChatActionsCubit, ChatActionsState>(
          listener: (context, state) {
            if (state.status == ChatActionsStatus.actionButtonsOpened) {
              setState(() {
                showChatActions = true;
                chats = state.chats;
              });
            }
            if (state.status == ChatActionsStatus.actionButtonsClosed) {
              setState(() {
                showChatActions = false;
                chats = {};
              });
            }
          },
          child: Scaffold(
            key: _key,
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title:
                  showChatActions
                      ? ChatActions(chats: chats.toList(), currentUser: user)
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: ProfileImage(user: user),
                            onTap: () {
                              _key.currentState!.openDrawer();
                            },
                          ),
                          InkWell(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            splashColor:
                                Theme.of(context).colorScheme.secondaryFixedDim,
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(8.5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).disabledColor,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                              child: Icon(
                                Symbols.notifications_rounded,
                                color: Theme.of(context).disabledColor,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
            ),
            drawer: AppDrawer(user: user),
            body: PopScope(
              canPop: canPopNow,
              onPopInvokedWithResult: (didPop, __) {
                onPopInvoked(didPop);
              },
              child: BlocListener<BottomNavBarCubit, BottomNavBarState>(
                listener: (context, state) {
                  switch (state) {
                    case BottomNavBarPageChanged(:final page):
                      pageController.animateToPage(
                        page,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate,
                      );
                  }
                },
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    HomePage(),
                    ExplorePage(),
                    PollPage(),
                    SurveyPage(),
                    MessagePage(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomNavBar(),
          ),
        );
      },
    );
  }
}
