
import 'package:flutter/material.dart';

import 'organisms/predetermined_workout.dart';
import 'organisms/today_workout.dart';

class WorkoutMemo extends StatelessWidget {
  const WorkoutMemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              SizedBox(height: 30,),
              TodayWorkout(),
              SizedBox(height: 30,),
              PredeterminedWorkout(),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}