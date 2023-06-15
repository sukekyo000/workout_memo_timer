
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';

import '../../../domain/utilities/const/workout.dart';
import '../../../domain/utilities/model/workout_menu_info.dart';
import 'organisms/edit_specific_workout_certain_day_form.dart';

class EditSpecificWorkoutCertainDayPage extends HookWidget {
  const EditSpecificWorkoutCertainDayPage({
    super.key,
    required this.workoutMenuId,
    required this.date,
    required this.workoutMenuInfoList
  });
  final int workoutMenuId;
  final DateTime date;
  final List<WorkoutMenuInfo> workoutMenuInfoList;

  @override
  Widget build(BuildContext context) {
    ConstWorkoutMenu constWorkoutMenu = ConstWorkoutMenu();
    return Scaffold(
      appBar: AppBar(
        title: Text('${DateFormat('yyyy/MM/dd').format(date)}の${constWorkoutMenu.workoutMenuInfoMap[workoutMenuId]}'),
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
      body: SingleChildScrollView(
        child: EditSpecificWorkoutCertainDayForm(
          workoutMenuId: workoutMenuId,
          date: date,
          workoutMenuInfoList: workoutMenuInfoList,
        ),
      ),
    );
  }
}