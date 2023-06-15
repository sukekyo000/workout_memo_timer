
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drift.dart';
import '../../domain/repository/drift/predetermined_menu.dart';
import '../../domain/repository/drift/workout_menu.dart';
import '../../domain/utilities/const/workout.dart';
import '../../domain/utilities/model/workout_menu_info.dart';
import '../global/drift.dart';

part 'generated/predetermined_workouts_certain_day_of_week.freezed.dart';
part 'generated/predetermined_workouts_certain_day_of_week.g.dart';

@riverpod
class PredeterminedWorkoutListSpecificDayOfWeekStateNotifier extends _$PredeterminedWorkoutListSpecificDayOfWeekStateNotifier {
  @override
  Future<PredeterminedWorkoutListSpecificDayOfWeekState> build(int dayOfWeekId) async {
    return _createPredeterminedWorkoutListSpecificDayOfWeekState(dayOfWeekId);
  }

  ///
  /// Initial Settings
  ///

  final ConstWorkoutMenu _constWorkoutMenu = ConstWorkoutMenu();

  /// get database instance
  MyDatabase _getMyDatabase() {
    return ref.watch(myDatabaseProvider);
  }

  /// get predetermined workout menu repository instance
  PredeterminedMenuRepository _getPredeterminedMenuRepository() {
    return PredeterminedMenuRepository(_getMyDatabase());
  }

  /// get workout menu repository instance
  WorkoutMenuRepository _getWorkoutMenuRepository() {
    return WorkoutMenuRepository(_getMyDatabase());
  }

  ///
  /// Create State
  ///

  /// create PredeterminedWorkoutListSpecificDayOfWeekState
  Future<PredeterminedWorkoutListSpecificDayOfWeekState> _createPredeterminedWorkoutListSpecificDayOfWeekState(int dayOfWeekId) async {
    // get predetermined menu list from local database
    List<PredeterminedMenu> predeterminedMenuList = await _getPredeterminedMenuRepository().getAllWorkoutMenuListCertainDayOfWeek(dayOfWeekId);
    // convert PredeterminedWorkoutMenuState list to PredeterminedWorkoutMenuState map
    Map<int, List<WorkoutMenuInfo>> predeterminedWorkoutMenuInfoMap = _convertPredeterminedMenuListToPredeterminedWorkoutMenuStateMap(predeterminedMenuList);

    return PredeterminedWorkoutListSpecificDayOfWeekState(
      dayOfWeekId: dayOfWeekId, menuCount: predeterminedWorkoutMenuInfoMap.keys.length, predeterminedMenuInfoMap: predeterminedWorkoutMenuInfoMap,
    );
  }

  /// convert PredeterminedWorkoutMenuState list to PredeterminedWorkoutMenuState map
  Map<int, List<WorkoutMenuInfo>> _convertPredeterminedMenuListToPredeterminedWorkoutMenuStateMap(List<PredeterminedMenu> predeterminedMenuList){
    Map<int, List<WorkoutMenuInfo>> predeterminedWorkoutMenuInfoMap = {};

    for(PredeterminedMenu predeterminedMenu in predeterminedMenuList){
      List<WorkoutMenuInfo>? tempPredeterminedMenuInfo = predeterminedWorkoutMenuInfoMap[predeterminedMenu.menuId];
      if(tempPredeterminedMenuInfo == null){
        tempPredeterminedMenuInfo = [];
        tempPredeterminedMenuInfo.add(
          WorkoutMenuInfo(
            set: predeterminedMenu.set, weight: predeterminedMenu.weight, repCount: predeterminedMenu.rep, assistant: predeterminedMenu.assistant
          )
        );
      } else {
        tempPredeterminedMenuInfo.add(
            WorkoutMenuInfo(
              set: predeterminedMenu.set, weight: predeterminedMenu.weight, repCount: predeterminedMenu.rep, assistant: predeterminedMenu.assistant
            )
        );
      }
      predeterminedWorkoutMenuInfoMap[predeterminedMenu.menuId] = tempPredeterminedMenuInfo;
    }

    return predeterminedWorkoutMenuInfoMap;
  }

  ///
  /// CRUD
  ///
  Future<List<String>> addPredeterminedMenuListToWorkoutMenuTable(Map<int, List<WorkoutMenuInfo>> predeterminedMenuInfoMap, DateTime date) async {
    List<String> updatedList = [];
    for (int workoutMenuId in predeterminedMenuInfoMap.keys) {
      // 登録されているWorkoutMenuを取得
      List<WorkoutMenu> workoutMenuList = await _getWorkoutMenuRepository().getSpecificWorkoutMenuCertainDay(date, workoutMenuId);
      if(workoutMenuList.isEmpty){
        // workoutMenuListが空の場合、predeterminedMenuInfoMapの値を登録
        for (WorkoutMenuInfo workoutMenuInfo in predeterminedMenuInfoMap[workoutMenuId]!) {
          await _getWorkoutMenuRepository().addWorkoutMenu(date, workoutMenuId, workoutMenuInfo.set, workoutMenuInfo.weight, workoutMenuInfo.repCount, workoutMenuInfo.assistant);
        }
        updatedList.add("${_constWorkoutMenu.workoutMenuInfoMap[workoutMenuId]}が登録されました");
      } else {
        // workoutMenuListが空でない場合、workoutMenuListから削除してからpredeterminedMenuInfoMapの値を登録
        for (WorkoutMenu workoutMenu in workoutMenuList) {
          await _getWorkoutMenuRepository().deleteWorkoutMenu(date, workoutMenuId, workoutMenu.set);
        }
        for (WorkoutMenuInfo workoutMenuInfo in predeterminedMenuInfoMap[workoutMenuId]!) {
          await _getWorkoutMenuRepository().addWorkoutMenu(date, workoutMenuId, workoutMenuInfo.set, workoutMenuInfo.weight, workoutMenuInfo.repCount, workoutMenuInfo.assistant);
        }
        updatedList.add("${_constWorkoutMenu.workoutMenuInfoMap[workoutMenuId]}が更新されました");
      }
    }
    return updatedList;
  }

  ///
  /// Validation
  ///
  Future<bool> checkPredeterminedMenuListExistTodayWorkoutMemo(Set<int> workoutMenuIdSet, DateTime date) async {
    bool checkPredeterminedMenuExistTodayWorkoutMemo = false;
    for (int workoutMenuId in workoutMenuIdSet) {
      List<WorkoutMenu> workoutMenuList = await _getWorkoutMenuRepository().getSpecificWorkoutMenuCertainDay(date, workoutMenuId);
      if(workoutMenuList.isNotEmpty) checkPredeterminedMenuExistTodayWorkoutMemo = true;
    }
    return checkPredeterminedMenuExistTodayWorkoutMemo;
  }
}

@freezed
class PredeterminedWorkoutListSpecificDayOfWeekState with _$PredeterminedWorkoutListSpecificDayOfWeekState {
  const factory PredeterminedWorkoutListSpecificDayOfWeekState({
    required int dayOfWeekId,
    required int menuCount,
    required Map<int, List<WorkoutMenuInfo>> predeterminedMenuInfoMap,
  }) = _PredeterminedWorkoutListSpecificDayOfWeekState;

  factory PredeterminedWorkoutListSpecificDayOfWeekState.fromJson(Map<String, dynamic> json) => _$PredeterminedWorkoutListSpecificDayOfWeekStateFromJson(json);
}
