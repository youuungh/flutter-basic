import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/data/memory/bloc/todo_event.dart';
import 'package:flutter_todo/data/memory/todo_cubit.dart';
import 'package:flutter_todo/data/memory/todo_data.dart';
import 'package:flutter_todo/screen/main/tab/tab_item.dart';
import 'package:flutter_todo/screen/main/tab/tab_navigator.dart';
import 'package:flutter/material.dart';

import '../../common/common.dart';
import 'w_menu_drawer.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin, TodoDataProvider {
  TabItem _currentTab = TabItem.todo;
  final tabs = [TabItem.todo, TabItem.search];
  final List<GlobalKey<NavigatorState>> navigatorKeys = [];

  int get _currentIndex => tabs.indexOf(_currentTab);

  GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];

  bool get extendBody => true;

  static double get bottomNavigationBarBorderRadius => 30.0;

  @override
  void initState() {
    super.initState();
    initNavigatorKeys();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _handleBackPressed,
      child: Scaffold(
        extendBody: extendBody,
        extendBodyBehindAppBar: true,
        //bottomNavigationBar 아래 영역 까지 그림
        drawer: const MenuDrawer(),
        body: Container(
          color: context.appColors.seedColor.getMaterialColorValues[100],
          padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
          child: SafeArea(
            bottom: !extendBody,
            child: pages,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            todoData.addTodo(context);
          },
          child: const Icon(EvaIcons.plus),
        ),
        bottomNavigationBar: _buildBottomNavigationBar(context),
      ),
    );
  }

  IndexedStack get pages => IndexedStack(
      index: _currentIndex,
      children: tabs
          .mapIndexed((tab, index) => Offstage(
                offstage: _currentTab != tab,
                child: TabNavigator(
                  navigatorKey: navigatorKeys[index],
                  tabItem: tab,
                ),
              ))
          .toList());

  void _handleBackPressed(bool shouldPop) async {
    if (shouldPop) {
      final isFirstRouteInCurrentTab =
      (await _currentTabNavigationKey.currentState?.maybePop() == false);
      if (isFirstRouteInCurrentTab) {
        if (_currentTab != TabItem.todo) {
          _changeTab(tabs.indexOf(TabItem.todo));
        } else {
          Navigator.of(context).pop(true);
        }
      }
    }
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bottomNavigationBarBorderRadius),
          topRight: Radius.circular(bottomNavigationBarBorderRadius),
        ),
        child: BottomNavigationBar(
          items: navigationBarItems(context),
          currentIndex: _currentIndex,
          selectedItemColor: context.appColors.text,
          unselectedItemColor: context.appColors.iconButtonInactivate,
          onTap: _handleOnTapNavigationBarItem,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
    return tabs
        .mapIndexed(
          (tab, index) => tab.toNavigationBarItem(
            context,
            isActivated: _currentIndex == index,
          ),
        )
        .toList();
  }

  void _changeTab(int index) {
    setState(() {
      _currentTab = tabs[index];
    });
  }

  BottomNavigationBarItem bottomItem(
      bool activate, IconData iconData, IconData inActivateIconData, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          key: ValueKey(label),
          activate ? iconData : inActivateIconData,
          color: activate ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
        ),
        label: label);
  }

  void _handleOnTapNavigationBarItem(int index) {
    final oldTab = _currentTab;
    final targetTab = tabs[index];
    if (oldTab == targetTab) {
      final navigationKey = _currentTabNavigationKey;
      popAllHistory(navigationKey);
    }
    _changeTab(index);
  }

  void popAllHistory(GlobalKey<NavigatorState> navigationKey) {
    final bool canPop = navigationKey.currentState?.canPop() == true;
    if (canPop) {
      while (navigationKey.currentState?.canPop() == true) {
        navigationKey.currentState!.pop();
      }
    }
  }

  void initNavigatorKeys() {
    for (final _ in tabs) {
      navigatorKeys.add(GlobalKey<NavigatorState>());
    }
  }
}

/// Riverpod

// class MainScreen extends ConsumerStatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   ConsumerState<MainScreen> createState() => MainScreenState();
// }
//
// class MainScreenState extends ConsumerState<MainScreen> with SingleTickerProviderStateMixin {
//   TabItem _currentTab = TabItem.todo;
//   final tabs = [TabItem.todo, TabItem.search];
//   final List<GlobalKey<NavigatorState>> navigatorKeys = [];
//
//   int get _currentIndex => tabs.indexOf(_currentTab);
//
//   GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];
//
//   bool get extendBody => true;
//
//   static double get bottomNavigationBarBorderRadius => 30.0;
//
//   @override
//   void initState() {
//     super.initState();
//     initNavigatorKeys();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvoked: _handleBackPressed,
//       child: Scaffold(
//         extendBody: extendBody,
//         extendBodyBehindAppBar: true,
//         //bottomNavigationBar 아래 영역 까지 그림
//         drawer: const MenuDrawer(),
//         body: Container(
//           color: context.appColors.seedColor.getMaterialColorValues[100],
//           padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
//           child: SafeArea(
//             bottom: !extendBody,
//             child: pages,
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             ref.readTodoHolder.addTodo();
//           },
//           child: const Icon(EvaIcons.plus),
//         ),
//         bottomNavigationBar: _buildBottomNavigationBar(context),
//       ),
//     );
//   }
//
//   IndexedStack get pages => IndexedStack(
//       index: _currentIndex,
//       children: tabs
//           .mapIndexed((tab, index) => Offstage(
//         offstage: _currentTab != tab,
//         child: TabNavigator(
//           navigatorKey: navigatorKeys[index],
//           tabItem: tab,
//         ),
//       ))
//           .toList());
//
//   void _handleBackPressed(bool shouldPop) async {
//     if (shouldPop) {
//       final isFirstRouteInCurrentTab =
//       (await _currentTabNavigationKey.currentState?.maybePop() == false);
//       if (isFirstRouteInCurrentTab) {
//         if (_currentTab != TabItem.todo) {
//           _changeTab(tabs.indexOf(TabItem.todo));
//         } else {
//           Navigator.of(context).pop(true);
//         }
//       }
//     }
//   }
//
//   Widget _buildBottomNavigationBar(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(bottomNavigationBarBorderRadius),
//           topRight: Radius.circular(bottomNavigationBarBorderRadius),
//         ),
//         child: BottomNavigationBar(
//           items: navigationBarItems(context),
//           currentIndex: _currentIndex,
//           selectedItemColor: context.appColors.text,
//           unselectedItemColor: context.appColors.iconButtonInactivate,
//           onTap: _handleOnTapNavigationBarItem,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//         ),
//       ),
//     );
//   }
//
//   List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
//     return tabs
//         .mapIndexed(
//           (tab, index) => tab.toNavigationBarItem(
//         context,
//         isActivated: _currentIndex == index,
//       ),
//     )
//         .toList();
//   }
//
//   void _changeTab(int index) {
//     setState(() {
//       _currentTab = tabs[index];
//     });
//   }
//
//   BottomNavigationBarItem bottomItem(
//       bool activate, IconData iconData, IconData inActivateIconData, String label) {
//     return BottomNavigationBarItem(
//         icon: Icon(
//           key: ValueKey(label),
//           activate ? iconData : inActivateIconData,
//           color: activate ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
//         ),
//         label: label);
//   }
//
//   void _handleOnTapNavigationBarItem(int index) {
//     final oldTab = _currentTab;
//     final targetTab = tabs[index];
//     if (oldTab == targetTab) {
//       final navigationKey = _currentTabNavigationKey;
//       popAllHistory(navigationKey);
//     }
//     _changeTab(index);
//   }
//
//   void popAllHistory(GlobalKey<NavigatorState> navigationKey) {
//     final bool canPop = navigationKey.currentState?.canPop() == true;
//     if (canPop) {
//       while (navigationKey.currentState?.canPop() == true) {
//         navigationKey.currentState!.pop();
//       }
//     }
//   }
//
//   void initNavigatorKeys() {
//     for (final _ in tabs) {
//       navigatorKeys.add(GlobalKey<NavigatorState>());
//     }
//   }
// }

/// Cubit

// class MainScreen extends StatefulWidget {
//   const MainScreen({super.key});
//
//   @override
//   State<MainScreen> createState() => MainScreenState();
// }

/// GetX
//class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin, TodoDataProvider {

/// Cubit
// class MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
//   TabItem _currentTab = TabItem.todo;
//   final tabs = [TabItem.todo, TabItem.search];
//   final List<GlobalKey<NavigatorState>> navigatorKeys = [];
//
//   int get _currentIndex => tabs.indexOf(_currentTab);
//
//   GlobalKey<NavigatorState> get _currentTabNavigationKey => navigatorKeys[_currentIndex];
//
//   bool get extendBody => true;
//
//   static double get bottomNavigationBarBorderRadius => 30.0;
//
//   @override
//   void initState() {
//     super.initState();
//     initNavigatorKeys();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//       onPopInvoked: _handleBackPressed,
//       child: Scaffold(
//         extendBody: extendBody,
//         extendBodyBehindAppBar: true,
//         //bottomNavigationBar 아래 영역 까지 그림
//         drawer: const MenuDrawer(),
//         body: Container(
//           color: context.appColors.seedColor.getMaterialColorValues[100],
//           padding: EdgeInsets.only(bottom: extendBody ? 60 - bottomNavigationBarBorderRadius : 0),
//           child: SafeArea(
//             bottom: !extendBody,
//             child: pages,
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () async {
//             //context.holder.addTodo();
//             //todoData.addTodo();
//             //context.readTodoCubit.addTodo();
//             context.readTodoBloc.add(TodoAddEvent());
//           },
//           child: const Icon(EvaIcons.plus),
//         ),
//         bottomNavigationBar: _buildBottomNavigationBar(context),
//       ),
//     );
//   }
//
//   IndexedStack get pages => IndexedStack(
//       index: _currentIndex,
//       children: tabs
//           .mapIndexed((tab, index) => Offstage(
//                 offstage: _currentTab != tab,
//                 child: TabNavigator(
//                   navigatorKey: navigatorKeys[index],
//                   tabItem: tab,
//                 ),
//               ))
//           .toList());
//
//   void _handleBackPressed(bool shouldPop) async {
//     if (shouldPop) {
//       final isFirstRouteInCurrentTab =
//       (await _currentTabNavigationKey.currentState?.maybePop() == false);
//       if (isFirstRouteInCurrentTab) {
//         if (_currentTab != TabItem.todo) {
//           _changeTab(tabs.indexOf(TabItem.todo));
//         } else {
//           Navigator.of(context).pop(true);
//         }
//       }
//     }
//   }
//
//   Widget _buildBottomNavigationBar(BuildContext context) {
//     return Container(
//       decoration: const BoxDecoration(
//         boxShadow: [
//           BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
//         ],
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(bottomNavigationBarBorderRadius),
//           topRight: Radius.circular(bottomNavigationBarBorderRadius),
//         ),
//         child: BottomNavigationBar(
//           items: navigationBarItems(context),
//           currentIndex: _currentIndex,
//           selectedItemColor: context.appColors.text,
//           unselectedItemColor: context.appColors.iconButtonInactivate,
//           onTap: _handleOnTapNavigationBarItem,
//           showSelectedLabels: true,
//           showUnselectedLabels: true,
//           type: BottomNavigationBarType.fixed,
//         ),
//       ),
//     );
//   }
//
//   List<BottomNavigationBarItem> navigationBarItems(BuildContext context) {
//     return tabs
//         .mapIndexed(
//           (tab, index) => tab.toNavigationBarItem(
//             context,
//             isActivated: _currentIndex == index,
//           ),
//         )
//         .toList();
//   }
//
//   void _changeTab(int index) {
//     setState(() {
//       _currentTab = tabs[index];
//     });
//   }
//
//   BottomNavigationBarItem bottomItem(
//       bool activate, IconData iconData, IconData inActivateIconData, String label) {
//     return BottomNavigationBarItem(
//         icon: Icon(
//           key: ValueKey(label),
//           activate ? iconData : inActivateIconData,
//           color: activate ? context.appColors.iconButton : context.appColors.iconButtonInactivate,
//         ),
//         label: label);
//   }
//
//   void _handleOnTapNavigationBarItem(int index) {
//     final oldTab = _currentTab;
//     final targetTab = tabs[index];
//     if (oldTab == targetTab) {
//       final navigationKey = _currentTabNavigationKey;
//       popAllHistory(navigationKey);
//     }
//     _changeTab(index);
//   }
//
//   void popAllHistory(GlobalKey<NavigatorState> navigationKey) {
//     final bool canPop = navigationKey.currentState?.canPop() == true;
//     if (canPop) {
//       while (navigationKey.currentState?.canPop() == true) {
//         navigationKey.currentState!.pop();
//       }
//     }
//   }
//
//   void initNavigatorKeys() {
//     for (final _ in tabs) {
//       navigatorKeys.add(GlobalKey<NavigatorState>());
//     }
//   }
// }
