
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../state/predetermined_workouts_certain_day_of_week/predetermined_workouts_certain_day_of_week.dart';
import '../../../../state/specific_predetermined_workout_certain_day_of_week/specific_predetermined_workout_certain_day_of_week.dart';
import '../molecules/set_weight_rep_form_by_day_of_week.dart';

class MenuFormTileForSettings extends HookConsumerWidget {
  const MenuFormTileForSettings({
    super.key,
    required this.workoutMenuName,
    required this.workoutMenuId,
    required this.dayOfWeekId,
  });

  final String workoutMenuName;
  final int workoutMenuId;
  final int dayOfWeekId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutMenuInfoList
      = ref.watch(specificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider(dayOfWeekId, workoutMenuId));
    return workoutMenuInfoList.when(
      data: (workoutMenuInfoList){

        TextEditingController firstSetWeightController = useTextEditingController(text: workoutMenuInfoList.isEmpty ? "" : workoutMenuInfoList[0].weight.toString());
        TextEditingController secondSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 2 ? "" : workoutMenuInfoList[1].weight.toString());
        TextEditingController thirdSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 3 ? "" : workoutMenuInfoList[2].weight.toString());
        TextEditingController fourthSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 4 ? "" : workoutMenuInfoList[3].weight.toString());
        TextEditingController fifthSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 5 ? "" : workoutMenuInfoList[4].weight.toString());

        TextEditingController firstSetRepController = useTextEditingController(text: workoutMenuInfoList.isEmpty ? "" : workoutMenuInfoList[0].repCount.toString());
        TextEditingController secondSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 2 ? "" : workoutMenuInfoList[1].repCount.toString());
        TextEditingController thirdSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 3 ? "" : workoutMenuInfoList[2].repCount.toString());
        TextEditingController fourthSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 4 ? "" : workoutMenuInfoList[3].repCount.toString());
        TextEditingController fifthSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 5 ? "" : workoutMenuInfoList[4].repCount.toString());

        ToggleState firstSupportValue = useBoolean(workoutMenuInfoList.isEmpty ? false : workoutMenuInfoList[0].assistant);
        ToggleState secondSupportValue = useBoolean(workoutMenuInfoList.length < 2 ? false : workoutMenuInfoList[1].assistant);
        ToggleState thirdSupportValue = useBoolean(workoutMenuInfoList.length < 3 ? false : workoutMenuInfoList[2].assistant);
        ToggleState forthSupportValue = useBoolean(workoutMenuInfoList.length < 4 ? false : workoutMenuInfoList[3].assistant);
        ToggleState fifthSupportValue = useBoolean(workoutMenuInfoList.length < 5 ? false : workoutMenuInfoList[4].assistant);

        List<TextEditingController> setWeightControllerList = [
          firstSetWeightController,
          secondSetWeightController,
          thirdSetWeightController,
          fourthSetWeightController,
          fifthSetWeightController,
        ];

        List<TextEditingController> setRepControllerList = [
          firstSetRepController,
          secondSetRepController,
          thirdSetRepController,
          fourthSetRepController,
          fifthSetRepController,
        ];

        List<ToggleState> supportStateList = [
          firstSupportValue,
          secondSupportValue,
          thirdSupportValue,
          forthSupportValue,
          fifthSupportValue
        ];

        List<String> initialValidateList = [];
        bool initialValidateState = false;

        if(workoutMenuInfoList.isEmpty){
          initialValidateList.add("重さ・回数を入力してください");
          initialValidateState = true;
        }

        ToggleState validateState = useBoolean(initialValidateState);
        ValueNotifier<List<String>> validateList = useState(initialValidateList);

        return Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade300,
              ),
            ),
          ),
          child: ExpansionTile(
            title: Text(workoutMenuName),
            children: [
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SetWeightRepFormByDateOfWeek(
                      dayOfWeekId: dayOfWeekId,
                      workoutMenuId: workoutMenuId,
                      setNumber: 1,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDateOfWeek(
                      dayOfWeekId: dayOfWeekId,
                      workoutMenuId: workoutMenuId,
                      setNumber: 2,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDateOfWeek(
                      dayOfWeekId: dayOfWeekId,
                      workoutMenuId: workoutMenuId,
                      setNumber: 3,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDateOfWeek(
                      dayOfWeekId: dayOfWeekId,
                      workoutMenuId: workoutMenuId,
                      setNumber: 4,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDateOfWeek(
                      dayOfWeekId: dayOfWeekId,
                      workoutMenuId: workoutMenuId,
                      setNumber: 5,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    const SizedBox(height: 15),
                    Visibility(
                        visible: validateState.value,
                        child: Column(
                          children: [
                            FittedBox(
                              child: Text(
                                validateList.value.join("\n"),
                                style: const TextStyle(
                                    color: Colors.red
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        )
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: validateState.value == true ? null : () async {
                          List<String> updatedList = await ref.read(specificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider(dayOfWeekId, workoutMenuId).notifier)
                              .createWorkoutMenus(dayOfWeekId, workoutMenuId, setWeightControllerList, setRepControllerList, supportStateList);
                          ref.invalidate(predeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(dayOfWeekId));

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
                        child: const Text('セットを追加'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
      error: (_, __) {
        return const Center(
            child: Text("エラーが発生しました")
        );
      },
      loading: () {
        return Container();
      }
    );
  }
}