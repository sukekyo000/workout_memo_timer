
import 'package:flutter/material.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/utilities/validation.dart';
import '../../../state/specific_workout_ceratin_day/specific_workout_certain_day.dart';

class SetWeightRepFormByDate extends HookConsumerWidget {
  const SetWeightRepFormByDate({super.key,
    required this.date,
    required this.workoutMenuId,
    required this.setNumber,
    required this.setWeightControllerList,
    required this.setRepControllerList,
    required this.supportStateList,
    required this.validateState,
    required this.validateList,
  });
  final DateTime date;
  final int workoutMenuId;
  final int setNumber;
  final List<TextEditingController> setWeightControllerList;
  final List<TextEditingController> setRepControllerList;
  final List<ToggleState> supportStateList;
  final ToggleState validateState;
  final ValueNotifier<List<String>> validateList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    ValidateUtilities validateUtilities = ValidateUtilities();

    final validateSetWeight = useTextFormValidator(
      validator: (value) => !validateUtilities.checkDoubleOrEmpty(value),
      controller: setWeightControllerList[setNumber-1],
      initialValue: false,
    );

    final validateSetRep = useTextFormValidator(
      validator: (value) => !validateUtilities.checkIntOrEmpty(value),
      controller: setRepControllerList[setNumber-1],
      initialValue: false,
    );

    Color supportStateColor;
    if(supportStateList[setNumber-1].value){
      supportStateColor = Colors.orange;
    } else {
      supportStateColor = Colors.grey;
    }

    final specificWorkoutMenuListCertainDayState = ref.read(specificWorkoutMenuListCertainDayStateNotifierProvider(date, workoutMenuId).notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$setNumberセット目：'),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: setWeightControllerList[setNumber-1],
                    textAlign: TextAlign.center,
                    onChanged: (_){
                      validateList.value = specificWorkoutMenuListCertainDayState.validateForm(
                        setWeightControllerList,
                        setRepControllerList,
                        supportStateList,
                      );
                      if(validateList.value.isEmpty){
                        validateState.toggle(false);
                      } else {
                        validateState.toggle(true);
                      }
                    },
                  ),
                ),
                const Text('kg'),
                SizedBox(
                  width: 40,
                  child: Visibility(
                    visible: setNumber != 1,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: IconButton(
                          onPressed: (){
                            setWeightControllerList[setNumber-1].text = setWeightControllerList[setNumber-2].text;
                            validateList.value = specificWorkoutMenuListCertainDayState.validateForm(
                              setWeightControllerList,
                              setRepControllerList,
                              supportStateList,
                            );
                            if(validateList.value.isEmpty){
                              validateState.toggle(false);
                            } else {
                              validateState.toggle(true);
                            }
                          },
                          icon: const Icon(
                            Icons.subdirectory_arrow_left_rounded,
                            size: 20,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: setRepControllerList[setNumber-1],
                    textAlign: TextAlign.center,
                    onChanged: (_){
                      validateList.value = specificWorkoutMenuListCertainDayState.validateForm(
                        setWeightControllerList,
                        setRepControllerList,
                        supportStateList,
                      );
                      if(validateList.value.isEmpty){
                        validateState.toggle(false);
                      } else {
                        validateState.toggle(true);
                      }
                    },
                  ),
                ),
                const Text('回'),
                SizedBox(
                  width: 40,
                  child: Visibility(
                    visible: setNumber != 1,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: IconButton(
                          onPressed: (){
                            setRepControllerList[setNumber-1].text = setRepControllerList[setNumber-2].text;
                            validateList.value = specificWorkoutMenuListCertainDayState.validateForm(
                              setWeightControllerList,
                              setRepControllerList,
                              supportStateList,
                            );
                            if(validateList.value.isEmpty){
                              validateState.toggle(false);
                            } else {
                              validateState.toggle(true);
                            }
                          },
                          icon: const Icon(
                            Icons.subdirectory_arrow_left_rounded,
                            size: 20,
                          )
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InkWell(
              child: Text(
                "補",
                style: TextStyle(
                  color: supportStateColor,
                  fontSize: 20
                ),
              ),
              onTap: (){
                supportStateList[setNumber-1].toggle(!supportStateList[setNumber-1].value);
                validateList.value = specificWorkoutMenuListCertainDayState.validateForm(
                  setWeightControllerList,
                  setRepControllerList,
                  supportStateList,
                );
                if(validateList.value.isEmpty){
                  validateState.toggle(false);
                } else {
                  validateState.toggle(true);
                }
              },
            )
          ],
        ),
        const SizedBox(height: 5,),
        Visibility(
            visible: validateSetWeight,
            child: Column(
              children: const [
                FittedBox(
                  child: Text(
                    '半角数字の小数値または整数値を入力してください\n例)「10」「100」「50.5」',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 5,)
              ],
            )
        ),
        Visibility(
            visible: validateSetRep,
            child: Column(
              children: const [
                FittedBox(
                  child: Text(
                    '半角数字の整数値を入力してください\n例)「10」「100」「50」',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
                SizedBox(height: 5,)
              ],
            )
        ),
      ],
    );
  }
}
