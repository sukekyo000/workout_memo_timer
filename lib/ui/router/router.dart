
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_memo_timer/ui/router/routing_animation.dart';

import '../page/home/home.dart';
import '../page/settings_week_list/settings_week_list.dart';

RoutingAnimation routingAnimation = RoutingAnimation();

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/settings/week_list',
      pageBuilder: (context, state){
        return routingAnimation.transitionDownToUp(const SettingsWeekListPage());
      },
    ),
  ],
);