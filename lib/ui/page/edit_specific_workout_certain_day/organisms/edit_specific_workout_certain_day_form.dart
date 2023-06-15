
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_use/flutter_use.dart';

import '../../../../domain/utilities/model/workout_menu_info.dart';
import '../../../../state/specific_workout_ceratin_day/specific_workout_certain_day.dart';
import '../../../../state/workouts_certain_day/workouts_certain_day.dart';
import '../../../global/form/set_weight_rep_form_by_date.dart';

class EditSpecificWorkoutCertainDayForm extends HookWidget {
  const EditSpecificWorkoutCertainDayForm({
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

    TextEditingController firstSetWeightController = useTextEditingController(text: workoutMenuInfoList.isEmpty ? "" : workoutMenuInfoList[0].weight.toString());
    TextEditingController secondSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 2 ? "" : workoutMenuInfoList[1].weight.toString());
    TextEditingController thirdSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 3 ? "" : workoutMenuInfoList[2].weight.toString());
    TextEditingController fourthSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 4 ? "" : workoutMenuInfoList[3].weight.toString());
    TextEditingController fifthSetWeightController = useTextEditingController(text: workoutMenuInfoList.length < 5 ? "" : workoutMenuInfoList[4].weight.toString());

    TextEditingController firstSetRepController = useTextEditingController(text: workoutMenuInfoList.isEmpty ? "" :  workoutMenuInfoList[0].repCount.toString());
    TextEditingController secondSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 2 ? "" :  workoutMenuInfoList[1].repCount.toString());
    TextEditingController thirdSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 3 ? "" :  workoutMenuInfoList[2].repCount.toString());
    TextEditingController fourthSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 4 ? "" :  workoutMenuInfoList[3].repCount.toString());
    TextEditingController fifthSetRepController = useTextEditingController(text: workoutMenuInfoList.length < 5 ? "" :  workoutMenuInfoList[4].repCount.toString());

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

    ToggleState validateState = useBoolean(false);
    ValueNotifier<List<String>> validateList = useState([]);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
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
            child: Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ElevatedButton(
                  onPressed: validateState.value == true ? null : () async {
                    List<String> updatedList = await ref.read(SpecificWorkoutMenuListCertainDayStateNotifierProvider(date, workoutMenuId).notifier)
                        .addWorkoutMenus(date, workoutMenuId, setWeightControllerList, setRepControllerList, supportStateList);
                    ref.invalidate(WorkoutMenuListCertainDayStateNotifierProvider(date));

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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}