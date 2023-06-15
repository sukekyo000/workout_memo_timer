
import 'package:flutter/material.dart';

import '../../../domain/utilities/const/workout.dart';
import '../../../domain/utilities/generate.dart';

import '../../global/form/part_of_body_title.dart';
import 'organisms/menu_form_tile_for_memo.dart';

class AddWorkout extends StatelessWidget {
  const AddWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ConstWorkoutMenu constWorkoutMenu = ConstWorkoutMenu();
    GenerateUtilities generateUtilities = GenerateUtilities();
    List<WorkoutMenuByPartOfBody> workoutMenuByPartOfBodyList = constWorkoutMenu.workoutMenuByPartOfBodyList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('本日のトレーニング'),
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
          for (WorkoutMenuByPartOfBody workoutMenuByPartOfBody in workoutMenuByPartOfBodyList)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PartOfBodyTitle(
                  title: workoutMenuByPartOfBody.partOfBodyName,
                ),
                for (MapEntry<int, String> workoutMenuMapEntry in workoutMenuByPartOfBody.workoutMenuMap.entries)
                  MenuFormTileForMemo(
                    workoutMenuName: workoutMenuMapEntry.value,
                    workoutMenuId: workoutMenuMapEntry.key,
                    date: generateUtilities.generateToday(),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
