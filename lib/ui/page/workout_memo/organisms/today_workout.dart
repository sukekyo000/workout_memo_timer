
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../domain/utilities/generate.dart';
import '../../../../state/workouts_certain_day/workouts_certain_day.dart';
import '../../add_workout/add_workout.dart';
import '../../edit_specific_workout_certain_day/edit_specific_workout_certain_day.dart';
import '../molecules/specific_menu_certain_day_card.dart';

class TodayWorkout extends ConsumerWidget {
  const TodayWorkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GenerateUtilities generateUtilities = GenerateUtilities();
    final todayWorkoutList = ref.watch(workoutMenuListCertainDayStateNotifierProvider(generateUtilities.generateToday()));

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            '本日のトレーニング',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20,),
          todayWorkoutList.when(
            data: (todayWorkoutList) {
              if(todayWorkoutList.menuCount == 0){
                return const Text(
                  '今日のトレーニングはありません',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                );
              } else {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: todayWorkoutList.workoutMenuInfoMap.keys.map((key) {
                          return GestureDetector(
                            child: SpecificMenuCertainDayCard(
                              workoutMenuId: key,
                              workoutMenuInfoList: todayWorkoutList.workoutMenuInfoMap[key]!,
                              date: generateUtilities.generateToday(),
                            ),
                            onTap: (){
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation, secondaryAnimation) {
                                    return EditSpecificWorkoutCertainDayPage(
                                      workoutMenuId: key,
                                      date: generateUtilities.generateToday(),
                                      workoutMenuInfoList: todayWorkoutList.workoutMenuInfoMap[key]!,
                                    );
                                  },
                                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                    const Offset begin = Offset(0.0, 1.0); // 下から上
                                    const Offset end = Offset.zero;
                                    final Animatable<Offset> tween = Tween(begin: begin, end: end)
                                        .chain(CurveTween(curve: Curves.easeInOut));
                                    final Animation<Offset> offsetAnimation = animation.drive(tween);
                                    return SlideTransition(
                                      position: offsetAnimation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 10,),
                    ],
                  ),
                );
              }
            },
            error: (error, stackTrace) => const Text('error'),
            loading: () => const CircularProgressIndicator(),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () async {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return const AddWorkoutPage();
                    },
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      const Offset begin = Offset(0.0, 1.0); // 下から上
                      const Offset end = Offset.zero;
                      final Animatable<Offset> tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: Curves.easeInOut));
                      final Animation<Offset> offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ),
                );
              },
              child: const Text('トレーニングを追加する')
            ),
        ],
      ),
    );
  }
}