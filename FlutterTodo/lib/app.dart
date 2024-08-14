import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_todo/common/common.dart';
import 'package:flutter_todo/common/theme/custom_theme_app.dart';
import 'package:flutter_todo/data/memory/todo_bloc.dart';
import 'package:flutter_todo/data/memory/todo_cubit.dart';
import 'package:flutter_todo/screen/main/s_main.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nav_hooks/nav.dart';

import 'data/memory/todo_data.dart';
import 'data/memory/todo_data_notifier.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static bool isForeground = true;

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with Nav, WidgetsBindingObserver {
  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  @override
  void initState() {
    super.initState();
    Get.put(TodoData());
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Riverpod

// class App extends StatefulWidget {
//   static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
//   static bool isForeground = true;
//
//   const App({super.key});
//
//   @override
//   State<App> createState() => _AppState();
// }
//
// class _AppState extends State<App> with Nav, WidgetsBindingObserver {
//   @override
//   GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;
//
//   final notifier = TodoDataNotifier();
//
//   @override
//   void initState() {
//     super.initState();
//     Get.put(TodoDataHolder());
//     WidgetsBinding.instance.addObserver(this);
//   }
//
//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     notifier.dispose();
//     super.dispose();
//   }

  @override
  Widget build(BuildContext context) {
    return CustomThemeApp(
        child: ProviderScope(
          child: Builder(builder: (context) {
            return MaterialApp(
              navigatorKey: App.navigatorKey,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Todo',
              theme: context.themeType.themeData,
              home: const MainScreen(),
            );
          }),
        )
    );
  }

  /// Bloc - cubit

  // @override
  // Widget build(BuildContext context) {
  //   return CustomThemeApp(
  //       child: Builder(builder: (context) {
  //         return BlocProvider(
  //           //create: (BuildContext context) => TodoCubit(),
  //           create: (BuildContext context) => TodoBloc(),
  //           child: MaterialApp(
  //             navigatorKey: App.navigatorKey,
  //             localizationsDelegates: context.localizationDelegates,
  //             supportedLocales: context.supportedLocales,
  //             locale: context.locale,
  //             title: 'Todo',
  //             theme: context.themeType.themeData,
  //             home: const MainScreen(),
  //           ),
  //         );
  //       })
  //   );
  // }
  
  /// GetX

  // @override
  // Widget build(BuildContext context) {
  //   return CustomThemeApp(
  //     child: Builder(builder: (context) {
  //       return MaterialApp(
  //         navigatorKey: App.navigatorKey,
  //         localizationsDelegates: context.localizationDelegates,
  //         supportedLocales: context.supportedLocales,
  //         locale: context.locale,
  //         title: 'Todo',
  //         theme: context.themeType.themeData,
  //         home: const MainScreen(),
  //       );
  //     })
  //   );
  // }
  
  /// Default

  // @override
  // Widget build(BuildContext context) {
  //   return CustomThemeApp(
  //       child: Builder(builder: (context) {
  //         return TodoDataHolder(
  //             notifier: notifier,
  //             child: MaterialApp(
  //               navigatorKey: App.navigatorKey,
  //               localizationsDelegates: context.localizationDelegates,
  //               supportedLocales: context.supportedLocales,
  //               locale: context.locale,
  //               title: 'Todo',
  //               theme: context.themeType.themeData,
  //               home: const MainScreen(),
  //             )
  //         );
  //       })
  //   );
  // }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.hidden:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
