
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_memo_timer/ui/router/routing_animation.dart';

import '../../domain/utilities/const/week.dart';
import '../page/home/home.dart';
import '../page/settings_week_list/settings_week_list.dart';
import '../page/settings_workout_day_of_week/settings_workout_day_of_week.dart';

RoutingAnimation routingAnimation = RoutingAnimation();
ConstWeek constWeek = ConstWeek();

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
    GoRoute(
      path: '/settings/workout_day_of_week',
      pageBuilder: (context, state){
        int dayOfWeekId = state.extra! as int;
        String dayOfWeekName = "${constWeek.weekMap[dayOfWeekId]!}曜日";
        return routingAnimation.transitionLeftToRight(SettingsWorkoutDayOfWeekPage(
          dayOfWeekId: dayOfWeekId,
          dayOfWeekName: dayOfWeekName,
        ));
      },
    ),
  ],
);