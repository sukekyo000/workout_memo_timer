
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../state/predetermined_workouts_certain_day_of_week/predetermined_workouts_certain_day_of_week.dart';
import '../../../global/card/predetermined_workout_menu_specific_day_of_week_card.dart';

class PredeterminedMenuSpecificDayOfWeek extends ConsumerWidget {
  const PredeterminedMenuSpecificDayOfWeek({super.key, required this.dayOfWeekName, required this.dayOfWeekId});
  final String dayOfWeekName;
  final int dayOfWeekId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final predeterminedWorkoutListSpecificDayOfWeekState = ref.watch(PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(dayOfWeekId));

    return predeterminedWorkoutListSpecificDayOfWeekState.when(
      data: (predeterminedWorkoutListSpecificDayOfWeekState){
        return Column(
          children: [
            const SizedBox(height: 10,),
            Center(
              child: Text(
                '$dayOfWeekNameに設定されているトレーニング'
              )
            ),
            const SizedBox(height: 20,),
            if(predeterminedWorkoutListSpecificDayOfWeekState.predeterminedMenuInfoMap.keys.isEmpty)
              const Center(
                child: Text(
                  '登録されているトレーニングがありません',
                  style: TextStyle(
                    color: Colors.red
                  ),
                )
              ),
            if(predeterminedWorkoutListSpecificDayOfWeekState.predeterminedMenuInfoMap.keys.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 10,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: predeterminedWorkoutListSpecificDayOfWeekState.predeterminedMenuInfoMap.keys.map((workoutMenuId) {
                        return PredeterminedWorkoutMenuSpecificDayOfWeekCard(
                          workoutMenuId: workoutMenuId,
                          predeterminedMenuInfoMap: predeterminedWorkoutListSpecificDayOfWeekState.predeterminedMenuInfoMap,
                          dayOfWeekId: dayOfWeekId,
                          deleteIcon: true,
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
            const SizedBox(height: 20,),
          ],
        );
      },
      error: (_, __) {
        return Column(
          children: const [
            SizedBox(height: 10,),
            Center(
                child: Text("エラーが発生しました")
            ),
          ],
        );
      },
      loading: () => const CircularProgressIndicator(),
    );
  }
}