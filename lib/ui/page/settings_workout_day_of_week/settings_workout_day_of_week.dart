
import 'package:flutter/material.dart';

import 'organisms/predetermined_menu_specific_day_of_week.dart';
import 'organisms/set_workout_menu_specific_day_of_week.dart';

class SettingsWorkoutDayOfWeek extends StatelessWidget {
  const SettingsWorkoutDayOfWeek({super.key, required this.dayOfWeekName, required this.dayOfWeekId});
  final String dayOfWeekName;
  final int dayOfWeekId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('$dayOfWeekNameの設定'),
      ),
      body: ListView(
        children: [
          PredeterminedMenuSpecificDayOfWeek(
            dayOfWeekName: dayOfWeekName,
            dayOfWeekId: dayOfWeekId
          ),
          SetWorkoutMenuSpecificDayOfWeek(
            dayOfWeekName: dayOfWeekName,
            dayOfWeekId: dayOfWeekId
          ),
        ],
      )
    );
  }
}