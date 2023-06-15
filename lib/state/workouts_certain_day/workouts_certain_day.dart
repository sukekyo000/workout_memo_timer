
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drift.dart';
import '../../domain/repository/drift/workout_menu.dart';
import '../../domain/utilities/model/workout_menu_info.dart';
import '../global/drift.dart';

part 'generated/workouts_certain_day.freezed.dart';
part 'generated/workouts_certain_day.g.dart';

@riverpod
class WorkoutMenuListCertainDayStateNotifier extends _$WorkoutMenuListCertainDayStateNotifier {
  @override
  Future<SpecificDayWorkoutList> build(DateTime date) async {
    return _getWorkoutMenuListCertainDay(date);
  }

  ///
  /// Initial Settings
  ///

  /// get database instance
  MyDatabase _getMyDatabase() {
    return ref.watch(myDatabaseProvider);
  }

  /// get workout menu repository instance
  WorkoutMenuRepository _getWorkoutMenuRepository() {
    return WorkoutMenuRepository(_getMyDatabase());
  }

  ///
  /// Create State
  ///

  /// get database instance
  Future<SpecificDayWorkoutList> _getWorkoutMenuListCertainDay(DateTime date) async {
    // initialize SpecificDayWorkoutList
    SpecificDayWorkoutList initialSpecificDayWorkoutList = SpecificDayWorkoutList(
      date: date, menuCount: 0, workoutMenuInfoMap: {},
    );

    // get workout menu list from local database
    List<WorkoutMenu> workoutMenuList = await _getWorkoutMenuRepository().getAllWorkoutMenuListCertainDay(date);

    // update workoutMenuInfoMap by workout menu list from local database
    Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap = _convertWorkoutMenuListToWorkoutMenuInfoMap(workoutMenuList);
    initialSpecificDayWorkoutList = initialSpecificDayWorkoutList.copyWith(workoutMenuInfoMap: workoutMenuInfoMap);

    // update menuCount by number of workoutMenuInfoMap keys
    initialSpecificDayWorkoutList = initialSpecificDayWorkoutList.copyWith(
      menuCount: initialSpecificDayWorkoutList.workoutMenuInfoMap.keys.length
    );

    return initialSpecificDayWorkoutList;
  }

  /// convert List<WorkoutMenu> to Map<int, List<WorkoutMenuInfo>>
  Map<int, List<WorkoutMenuInfo>> _convertWorkoutMenuListToWorkoutMenuInfoMap(List<WorkoutMenu> workoutMenuList){
    Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap = {};

    for(WorkoutMenu workoutMenu in workoutMenuList){
      List<WorkoutMenuInfo>? tempWorkoutMenuInfo = workoutMenuInfoMap[workoutMenu.menuId];
      if(tempWorkoutMenuInfo == null){
        tempWorkoutMenuInfo = [];
        tempWorkoutMenuInfo.add(
          WorkoutMenuInfo(set: workoutMenu.set, weight: workoutMenu.weight, repCount: workoutMenu.rep, assistant: workoutMenu.assistant)
        );
      } else {
        tempWorkoutMenuInfo.add(
            WorkoutMenuInfo(set: workoutMenu.set, weight: workoutMenu.weight, repCount: workoutMenu.rep, assistant: workoutMenu.assistant)
        );
      }
      workoutMenuInfoMap[workoutMenu.menuId] = tempWorkoutMenuInfo;
    }

    return workoutMenuInfoMap;
  }
}

@freezed
class SpecificDayWorkoutList with _$SpecificDayWorkoutList {
  const factory SpecificDayWorkoutList({
    required DateTime date,
    required int menuCount,
    required Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap,
  }) = _SpecificDayWorkoutList;

  factory SpecificDayWorkoutList.fromJson(Map<String, dynamic> json) => _$SpecificDayWorkoutListFromJson(json);
}