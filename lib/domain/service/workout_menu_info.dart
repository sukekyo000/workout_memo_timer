
import 'package:flutter/cupertino.dart';
import 'package:flutter_use/flutter_use.dart';

import '../utilities/model/workout_menu_info.dart';

class WorkoutMenuInfoService {
  /// calculate how many WorkoutMenuStateList and form values have same
  int calculateWorkoutMenuStateListAndFormValuesHaveSameObject(
      List<WorkoutMenuInfo> workoutMenuStateList,
      List<TextEditingController> weightControllerList,
      List<TextEditingController> repControllerList,
      List<ToggleState> supportValueList,
      int maxNum
      ){
    if(workoutMenuStateList.length != maxNum){
      return 0;
    }

    int sameObjectNum = 0;
    // calculate how many WorkoutMenuStateList and form values have same
    for(int i = 0; i < maxNum; i++){
      bool workoutMenuStateIsSameObject = compareWorkoutMenuStateAndFormValues(
          workoutMenuStateList[i],
          i + 1,
          double.parse(weightControllerList[i].text),
          int.parse(repControllerList[i].text),
          supportValueList[i].value
      );
      if(workoutMenuStateIsSameObject){
        sameObjectNum++;
      }
    }
    return sameObjectNum;
  }

  /// compare WorkoutMenuState and form values
  bool compareWorkoutMenuStateAndFormValues(WorkoutMenuInfo workoutMenuState, int set, double weight, int repoCount, bool assistant){
    if(workoutMenuState == WorkoutMenuInfo(set: set, weight: weight, repCount: repoCount, assistant: assistant)){
      return true;
    } else {
      return false;
    }
  }
}