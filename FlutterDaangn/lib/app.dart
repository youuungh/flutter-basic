import 'package:daangn_ui/common/constant/app_colors.dart';
import 'package:daangn_ui/common/theme/custom_theme.dart';
import 'package:daangn_ui/widget/w_round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_daangn/auth.dart';
import 'package:flutter_daangn/common/common.dart';
import 'package:flutter_daangn/common/fcm/fcm_manager.dart';
import 'package:daangn_ui/common/theme/custom_theme_app.dart';
import 'package:flutter_daangn/screen/main/s_main.dart';
import 'package:flutter_daangn/screen/main/tab/tab_item.dart';
import 'package:flutter_daangn/screen/notification/s_notification.dart';
import 'package:flutter_daangn/screen/post_detail_riverpod/s_post_detail.dart';
import 'package:flutter_daangn/screen/write/s_write.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'common/route/fade_transition.dart';
import 'entity/post/vo_simple_product_post.dart';

class App extends ConsumerStatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey();
  static const defaultTheme = CustomTheme.dark;
  static bool isForeground = true;

  const App({super.key});

  @override
  ConsumerState<App> createState() => AppState();
}

class AppState extends ConsumerState<App> with WidgetsBindingObserver, Nav {
  // @override
  // GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

  final ValueKey<String> _scaffoldKey = const ValueKey<String>('App scaffold');

  final _auth = DaangnAuth();

  @override
  void initState() {
    super.initState();
    FcmManager.requestPermission();
    FcmManager.initialize(ref);
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeApp(
      child: Builder(builder: (context) {
        return ProviderScope(
          child: DaangnAuthScope(
            notifier: _auth,
            child: MaterialApp.router(
              //navigatorKey: App.navigatorKey,
              scaffoldMessengerKey: App.scaffoldMessengerKey,
              routerConfig: _router,
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              title: 'Daangn',
              theme: context.themeType.themeData,
              //home: const MainScreen(),
            ),
          ),
        );
      }),
    );
  }

  late final GoRouter _router = GoRouter(
    navigatorKey: App.navigatorKey,
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        redirect: (_, __) => '/main',
      ),
      GoRoute(
        path: '/signin',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: state.pageKey,
          child: Container(
            color: Colors.black12,
            child: Center(
              child: RoundButton(
                text: '로그인',
                bgColor: AppColors.darkOrange,
                onTap: () {
                  _auth.signIn('test', '1234');
                },
              ),
            ),
          ),
        ),
      ),
      GoRoute(
        path: '/main',
        redirect: (_, __) => '/main/home',
      ),
      GoRoute(
        path: '/productPost/:postId',
        redirect: (BuildContext context, GoRouterState state) =>
            '/main/home/${state.pathParameters['postId']}',
      ),
      GoRoute(
        path: '/main/:kind(home|localLife|nearMy|chat|my)',
        pageBuilder: (BuildContext context, GoRouterState state) =>
            FadeTransitionPage(
          key: _scaffoldKey,
          child: MainScreen(
            firstTab: TabItem.find(state.pathParameters['kind']),
          ),
        ),
        routes: <GoRoute>[
          GoRoute(
            path: ':postId',
            builder: (BuildContext context, GoRouterState state) {
              final String postId = state.pathParameters['postId']!;
              if (state.extra != null) {
                final post = state.extra as SimpleProductPost;
                return PostDetailScreen(
                  int.parse(postId),
                  simpleProductPost: post,
                );
              } else {
                return PostDetailScreen(int.parse(postId));
              }
            },
          ),
        ],
      ),
      GoRoute(
        path: '/notification',
        builder: (BuildContext context, GoRouterState state) =>
        const NotificationScreen(),
      ),
      GoRoute(
        path: '/write',
        builder: (BuildContext context, GoRouterState state) =>
        const WriteScreen(),
      ),
    ],
    redirect: _auth.guard,
    refreshListenable: _auth,
    debugLogDiagnostics: true,
  );

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;
}
