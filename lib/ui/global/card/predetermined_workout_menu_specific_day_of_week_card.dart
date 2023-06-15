
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/utilities/const/workout.dart';
import '../../../domain/utilities/model/workout_menu_info.dart';
import '../../../state/predetermined_workouts_certain_day_of_week/predetermined_workouts_certain_day_of_week.dart';
import '../../../state/specific_predetermined_workout_certain_day_of_week/specific_predetermined_workout_certain_day_of_week.dart';
import '../dialog/dialog.dart';

class PredeterminedWorkoutMenuSpecificDayOfWeekCard extends StatelessWidget {
  const PredeterminedWorkoutMenuSpecificDayOfWeekCard({
    super.key,
    required this.workoutMenuId,
    required this.predeterminedMenuInfoMap,
    required this.dayOfWeekId,
    required this.deleteIcon,
  });
  final int workoutMenuId;
  final Map<int, List<WorkoutMenuInfo>> predeterminedMenuInfoMap;
  final int dayOfWeekId;
  final bool deleteIcon;

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
                    itemCount: predeterminedMenuInfoMap[workoutMenuId]!.length,
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
                                '${predeterminedMenuInfoMap[workoutMenuId]![index].set}：',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${predeterminedMenuInfoMap[workoutMenuId]![index].weight} kg × ',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '${predeterminedMenuInfoMap[workoutMenuId]![index].repCount} ',
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
                                '補',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: predeterminedMenuInfoMap[workoutMenuId]![index].assistant ? Colors.red : Colors.grey.shade300,
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
        Visibility(
          visible: deleteIcon,
          child: Positioned(
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
                            await ref.read(SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider(dayOfWeekId, workoutMenuId).notifier)
                              .deleteWorkoutMenuList(dayOfWeekId, workoutMenuId);
                            ref.invalidate(PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(dayOfWeekId));
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
        ),
      ],
    );
  }
}