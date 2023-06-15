
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/utilities/model/workout_menu_info.dart';
import '../../../../state/specific_workout_ceratin_day/specific_workout_certain_day.dart';
import '../../../../state/workouts_certain_day/workouts_certain_day.dart';
import '../../../global/form/set_weight_rep_form_by_date.dart';

class MenuFormTileForMemo extends HookConsumerWidget {
  const MenuFormTileForMemo({
    super.key,
    required this.workoutMenuName,
    required this.workoutMenuId,
    required this.date,
  });

  final String workoutMenuName;
  final int workoutMenuId;
  final DateTime date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final specificWorkoutMenuCertainDayList = ref.watch(specificWorkoutMenuListCertainDayStateNotifierProvider(date, workoutMenuId));

    return specificWorkoutMenuCertainDayList.when(
      data: (specificWorkoutMenuCertainDayList) {
        final specificWorkoutMenuListCertainDayStateNotifierProviderInstance =
            ref.read(specificWorkoutMenuListCertainDayStateNotifierProvider(date, workoutMenuId).notifier);

        WorkoutMenuInfo? firstWorkoutMenuState = specificWorkoutMenuListCertainDayStateNotifierProviderInstance.getSpecificSetWorkoutMenuState(specificWorkoutMenuCertainDayList, 1);
        WorkoutMenuInfo? secondWorkoutMenuState = specificWorkoutMenuListCertainDayStateNotifierProviderInstance.getSpecificSetWorkoutMenuState(specificWorkoutMenuCertainDayList, 2);
        WorkoutMenuInfo? thirdWorkoutMenuState = specificWorkoutMenuListCertainDayStateNotifierProviderInstance.getSpecificSetWorkoutMenuState(specificWorkoutMenuCertainDayList, 3);
        WorkoutMenuInfo? fourthWorkoutMenuState = specificWorkoutMenuListCertainDayStateNotifierProviderInstance.getSpecificSetWorkoutMenuState(specificWorkoutMenuCertainDayList, 4);
        WorkoutMenuInfo? fifthWorkoutMenuState = specificWorkoutMenuListCertainDayStateNotifierProviderInstance.getSpecificSetWorkoutMenuState(specificWorkoutMenuCertainDayList, 5);

        TextEditingController firstSetWeightController = useTextEditingController(text: firstWorkoutMenuState == null ? "" : firstWorkoutMenuState.weight.toString());
        TextEditingController secondSetWeightController = useTextEditingController(text: secondWorkoutMenuState == null ? "" : secondWorkoutMenuState.weight.toString());
        TextEditingController thirdSetWeightController = useTextEditingController(text: thirdWorkoutMenuState == null ? "" : thirdWorkoutMenuState.weight.toString());
        TextEditingController fourthSetWeightController = useTextEditingController(text: fourthWorkoutMenuState == null ? "" : fourthWorkoutMenuState.weight.toString());
        TextEditingController fifthSetWeightController = useTextEditingController(text: fifthWorkoutMenuState == null ? "" : fifthWorkoutMenuState.weight.toString());

        TextEditingController firstSetRepController = useTextEditingController(text: firstWorkoutMenuState == null ? "" : firstWorkoutMenuState.repCount.toString());
        TextEditingController secondSetRepController = useTextEditingController(text: secondWorkoutMenuState == null ? "" : secondWorkoutMenuState.repCount.toString());
        TextEditingController thirdSetRepController = useTextEditingController(text: thirdWorkoutMenuState == null ? "" : thirdWorkoutMenuState.repCount.toString());
        TextEditingController fourthSetRepController = useTextEditingController(text: fourthWorkoutMenuState == null ? "" : fourthWorkoutMenuState.repCount.toString());
        TextEditingController fifthSetRepController = useTextEditingController(text: fifthWorkoutMenuState == null ? "" : fifthWorkoutMenuState.repCount.toString());

        ToggleState firstSupportValue = useBoolean(firstWorkoutMenuState == null ? false : firstWorkoutMenuState.assistant);
        ToggleState secondSupportValue = useBoolean(secondWorkoutMenuState == null ? false : secondWorkoutMenuState.assistant);
        ToggleState thirdSupportValue = useBoolean(thirdWorkoutMenuState == null ? false : thirdWorkoutMenuState.assistant);
        ToggleState forthSupportValue = useBoolean(fourthWorkoutMenuState == null ? false : fourthWorkoutMenuState.assistant);
        ToggleState fifthSupportValue = useBoolean(fifthWorkoutMenuState == null ? false : fifthWorkoutMenuState.assistant);

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
        if(specificWorkoutMenuCertainDayList.isEmpty){
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
                    SetWeightRepFormByDate(
                      date: date,
                      workoutMenuId: workoutMenuId,
                      setNumber: 1,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDate(
                      date: date,
                      workoutMenuId: workoutMenuId,
                      setNumber: 2,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDate(
                      date: date,
                      workoutMenuId: workoutMenuId,
                      setNumber: 3,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDate(
                      date: date,
                      workoutMenuId: workoutMenuId,
                      setNumber: 4,
                      setWeightControllerList: setWeightControllerList,
                      setRepControllerList: setRepControllerList,
                      supportStateList: supportStateList,
                      validateState: validateState,
                      validateList: validateList,
                    ),
                    SetWeightRepFormByDate(
                      date: date,
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
                          List<String> updatedList = await ref.read(specificWorkoutMenuListCertainDayStateNotifierProvider(date, workoutMenuId).notifier)
                              .addWorkoutMenus(date, workoutMenuId, setWeightControllerList, setRepControllerList, supportStateList);
                          ref.invalidate(workoutMenuListCertainDayStateNotifierProvider(date));

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