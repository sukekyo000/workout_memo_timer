
import 'package:flutter/material.dart';

import '../../../domain/utilities/const/week.dart';
import '../settings_workout_day_of_week/settings_workout_day_of_week.dart';

class SettingsWeekListPage extends StatelessWidget {
  const SettingsWeekListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ConstWeek constSettingsDayOfWeek = ConstWeek();

    return Scaffold(
      appBar: AppBar(
        title: const Text('曜日設定'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          for (MapEntry<int, String> weekMapEntry in constSettingsDayOfWeek.weekMap.entries)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                  ),
                ),
              ),
              child: ListTile(
                title: Text("${weekMapEntry.value}曜日"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return SettingsWorkoutDayOfWeekPage(dayOfWeekName: "${weekMapEntry.value}曜日", dayOfWeekId: weekMapEntry.key,);
                      },
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        const Offset begin = Offset(1.0, 0.0); // 左から右
                        const Offset end = Offset.zero;
                        final Animatable<Offset> tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: Curves.easeInOut));
                        final Animation<Offset> offsetAnimation = animation.drive(tween);
                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}