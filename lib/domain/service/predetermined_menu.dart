
import '../../data/drift.dart';
import '../utilities/model/workout_menu_info.dart';

class PredeterminedMenuService {

  /// convert List<WorkoutMenuInfo> to List<WorkoutMenuInfo>
  List<WorkoutMenuInfo> convertPredeterminedMenuListToWorkoutMenuInfoList(List<PredeterminedMenu> predeterminedMenuList){
    List<WorkoutMenuInfo> workoutMenuInfoList = [];
    for(PredeterminedMenu predeterminedMenu in predeterminedMenuList){
      workoutMenuInfoList.add(
        WorkoutMenuInfo(
          set: predeterminedMenu.set,
          weight: predeterminedMenu.weight,
          repCount: predeterminedMenu.rep,
          assistant: predeterminedMenu.assistant
        )
      );
    }
    return workoutMenuInfoList;
  }
}