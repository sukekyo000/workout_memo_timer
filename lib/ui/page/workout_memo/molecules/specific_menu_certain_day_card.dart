
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/utilities/const/workout.dart';
import '../../../../domain/utilities/model/workout_menu_info.dart';
import '../../../../state/specific_workout_ceratin_day/specific_workout_certain_day.dart';
import '../../../../state/workouts_certain_day/workouts_certain_day.dart';
import '../../../global/dialog/dialog.dart';

class SpecificMenuCertainDayCard extends StatelessWidget {
  const SpecificMenuCertainDayCard({super.key, required this.workoutMenuId, required this.workoutMenuInfoList, required this.date});
  final int workoutMenuId;
  final List<WorkoutMenuInfo> workoutMenuInfoList;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    ConstWorkoutMenu constWorkoutMenu = ConstWorkoutMenu();

    Map<int, String> workoutMenuInfoMap = constWorkoutMenu.workoutMenuInfoMap;

    return Stack(
      children: [
        Card(
            elevation: 5,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                children: [
                  FittedBox(
                    child: Text(
                      workoutMenuInfoMap[workoutMenuId]!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: workoutMenuInfoList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(width: 10,),
                              Text(
                                '${workoutMenuInfoList[index].set}：',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${workoutMenuInfoList[index].weight} kg × ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${workoutMenuInfoList[index].repCount} ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                workoutMenuInfoList[index].assistant ? '補' : '補',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: workoutMenuInfoList[index].assistant ? Colors.red : Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(width: 10,),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
        ),
        Positioned(
          right: 15,
          top: 15,
          child: Consumer(
            builder: (context, ref, child) {
              return InkWell(
                onTap: () async {
                  GlobalDialog dialog = GlobalDialog();
                  return dialog.showAlertDialogBeforeDelete(
                    context,
                    "${workoutMenuInfoMap[workoutMenuId]!}を削除しますか？",
                    () async {
                      await ref.read(SpecificWorkoutMenuListCertainDayStateNotifierProvider(date, workoutMenuId).notifier)
                          .deleteWorkoutMenuList(date, workoutMenuId);
                      ref.invalidate(WorkoutMenuListCertainDayStateNotifierProvider(date));

                      if (!context.mounted) return;

                      Navigator.of(context).pop();
                    }
                  );
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              );
            }
          ),
        ),
      ],
    );
  }
}