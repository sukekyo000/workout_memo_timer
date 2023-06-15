
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../domain/utilities/const/workout.dart';
import '../../../global/form/part_of_body_title.dart';
import 'menu_form_tile_for_settings.dart';

class SetWorkoutMenuSpecificDayOfWeek extends StatelessWidget {
  const SetWorkoutMenuSpecificDayOfWeek({
    super.key,
    required this.dayOfWeekName,
    required this.dayOfWeekId,
  });
  final String dayOfWeekName;
  final int dayOfWeekId;

  @override
  Widget build(BuildContext context) {

    ConstWorkoutMenu constWorkoutMenu = ConstWorkoutMenu();
    List<WorkoutMenuByPartOfBody> workoutMenuByPartOfBodyList = constWorkoutMenu.workoutMenuByPartOfBodyList;

    return Column(
      children: [
        Text("$dayOfWeekNameにトレーニングを設定する"),
        const SizedBox(height: 20,),
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (WorkoutMenuByPartOfBody workoutMenuByPartOfBody in workoutMenuByPartOfBodyList)
                Column(
                  children: [
                    PartOfBodyTitle(
                      title: workoutMenuByPartOfBody.partOfBodyName,
                    ),
                    for (MapEntry<int, String> workoutMenuMapEntry in workoutMenuByPartOfBody.workoutMenuMap.entries)
                      MenuFormTileForSettings(
                        workoutMenuName: workoutMenuMapEntry.value,
                        workoutMenuId: workoutMenuMapEntry.key,
                        dayOfWeekId: dayOfWeekId,
                      ),
                  ],
                ),
            ],
          ),
      ],
    );
  }
}