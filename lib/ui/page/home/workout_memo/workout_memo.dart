
import 'package:flutter/material.dart';

import 'organisms/history_by_calendar.dart';
import 'organisms/predetermined_workout.dart';
import 'organisms/today_workout.dart';

class WorkoutMemoPage extends StatelessWidget {
  const WorkoutMemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HistoryByCalendar(),
            SizedBox(height: 30,),
            TodayWorkout(),
            SizedBox(height: 30,),
            PredeterminedWorkout(),
            SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}