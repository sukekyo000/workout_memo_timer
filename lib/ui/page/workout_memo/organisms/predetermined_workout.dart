
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/utilities/generate.dart';
import '../../../../state/predetermined_workouts_certain_day_of_week/predetermined_workouts_certain_day_of_week.dart';
import '../../../../state/workouts_certain_day/workouts_certain_day.dart';
import '../../../global/card/predetermined_workout_menu_specific_day_of_week_card.dart';
import '../../../global/dialog/dialog.dart';

class PredeterminedWorkout extends ConsumerWidget {
  const PredeterminedWorkout({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GenerateUtilities generateUtilities = GenerateUtilities();
    GlobalDialog globalDialog = GlobalDialog();
    final predeterminedWorkout = ref.watch(PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(generateUtilities.generateTodayDayOfWeekId()));

    return Center(
      child: Column(
        children: [
          Text(
            '${generateUtilities.generateTodayDayOfWeekName()}に登録されたトレーニング',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          predeterminedWorkout.when(
            data: (predeterminedWorkout){
              if(predeterminedWorkout.menuCount == 0){
                return Text(
                  '${generateUtilities.generateTodayDayOfWeekName()}に登録されたトレーニングはありません',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                );
              } else {
                return Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: predeterminedWorkout.predeterminedMenuInfoMap.keys.map((key) {
                              return PredeterminedWorkoutMenuSpecificDayOfWeekCard(
                                workoutMenuId: key,
                                predeterminedMenuInfoMap: predeterminedWorkout.predeterminedMenuInfoMap,
                                dayOfWeekId: generateUtilities.generateTodayDayOfWeekId(),
                                deleteIcon: false,
                              );
                            }).toList(),
                          ),
                          const SizedBox(width: 10,),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    ElevatedButton(
                      onPressed: () async {
                        DateTime today = generateUtilities.generateToday();

                        bool checkPredeterminedMenuExistTodayWorkoutMemo = await ref.read(PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(generateUtilities.generateTodayDayOfWeekId()).notifier)
                            .checkPredeterminedMenuListExistTodayWorkoutMemo(predeterminedWorkout.predeterminedMenuInfoMap.keys.toSet(), today);

                        if (!context.mounted) return;

                        List<String> updatedList = [];

                        if(checkPredeterminedMenuExistTodayWorkoutMemo){
                          return globalDialog.showAlertDialogBeforeUpdate(context, "既に登録されている同じメニューが更新されますがよろしいですか？", () async {
                            updatedList = await ref.read(PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(generateUtilities.generateTodayDayOfWeekId()).notifier)
                              .addPredeterminedMenuListToWorkoutMenuTable(predeterminedWorkout.predeterminedMenuInfoMap, today);
                            ref.invalidate(workoutMenuListCertainDayStateNotifierProvider(today));
                            if (!context.mounted) return;
                            Navigator.of(context).pop();
                          });
                        } else {
                          updatedList = await ref.read(PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(generateUtilities.generateTodayDayOfWeekId()).notifier)
                              .addPredeterminedMenuListToWorkoutMenuTable(predeterminedWorkout.predeterminedMenuInfoMap, today);
                          ref.invalidate(workoutMenuListCertainDayStateNotifierProvider(today));
                        }

                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                              SnackBar(
                                duration: const Duration(milliseconds: 1500),
                                behavior: SnackBarBehavior.floating,
                                content: Text(updatedList.join("\n")),
                              )
                          );
                      },
                      child: Text(
                        "${generateUtilities.generateTodayDayOfWeekName()}に登録されたトレーニングを全て追加する"
                      )
                    ),
                  ],
                );
              }
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}