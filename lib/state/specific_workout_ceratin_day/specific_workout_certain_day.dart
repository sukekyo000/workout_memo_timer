
import 'package:flutter/cupertino.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drift.dart';
import '../../domain/repository/drift/workout_menu.dart';
import '../../domain/service/workout_menu_info.dart';
import '../../domain/utilities/math.dart';
import '../../domain/utilities/model/workout_menu_info.dart';
import '../../domain/utilities/validation.dart';
import '../global/drift.dart';

part 'generated/specific_workout_certain_day.g.dart';

@riverpod
class SpecificWorkoutMenuListCertainDayStateNotifier extends _$SpecificWorkoutMenuListCertainDayStateNotifier {
  @override
  Future<List<WorkoutMenuInfo>> build(DateTime date, int menuId) async {
    return _getSpecificWorkoutMenuListCertainDay(date, menuId);
  }

  ///
  /// Initial Settings
  ///

  final ValidateUtilities _validateUtilities = ValidateUtilities();
  final MathUtilities _mathUtilities = MathUtilities();
  final WorkoutMenuInfoService _workoutMenuInfoService = WorkoutMenuInfoService();

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

  /// get specific workout menu list certain day
  Future<List<WorkoutMenuInfo>> _getSpecificWorkoutMenuListCertainDay(DateTime date, int menuId) async {
    // init workout menu state list
    List<WorkoutMenuInfo> workoutMenuStateList = [];
    // get workout menu repository
    WorkoutMenuRepository workoutMenuRepository = _getWorkoutMenuRepository();
    // get workout menu list
    List<WorkoutMenu> workoutMenuList = await workoutMenuRepository.getSpecificWorkoutMenuCertainDay(date, menuId);
    // sort workout menu list
    workoutMenuList.sort((a, b) => a.set.compareTo(b.set));
    // add workout menu state list
    for(WorkoutMenu workoutMenu in workoutMenuList) {
      workoutMenuStateList.add(
        WorkoutMenuInfo(
          set: workoutMenu.set,
          weight: workoutMenu.weight,
          repCount: workoutMenu.rep,
          assistant: workoutMenu.assistant
        )
      );
    }
    // return workout menu state list
    return workoutMenuStateList;
  }

  /// get WorkoutMenuState in specific set
  WorkoutMenuInfo? getSpecificSetWorkoutMenuState(List<WorkoutMenuInfo> workoutMenuStateList, int setNum){
    for(WorkoutMenuInfo workoutMenuState in workoutMenuStateList){
      if(workoutMenuState.set == setNum) return workoutMenuState;
    }
    return null;
  }

  ///
  /// CRUD
  ///

  /// add workout menus
  Future<List<String>> addWorkoutMenus(
      DateTime date,
      int menuId,
      List<TextEditingController> weightControllerList,
      List<TextEditingController> repControllerList,
      List<ToggleState> supportValueList
      ) async {
    List<String> changedWorkoutMenuInLocalDatabase = [];

    // calculate how many sets
    int setMaxNum = _validateUtilities.calculateHomeManySetFormHave(weightControllerList, repControllerList);

    // get previous specific workout menu list certain day
    List<WorkoutMenuInfo> workoutMenuStateList = await _getSpecificWorkoutMenuListCertainDay(date, menuId);

    // calculate how many List<WorkoutMenuState> and form values are same
    int sameObjectNumBetweenWorkoutMenuStateListAndFromValues =
      _workoutMenuInfoService.calculateWorkoutMenuStateListAndFormValuesHaveSameObject(workoutMenuStateList, weightControllerList, repControllerList, supportValueList, setMaxNum);
    // return if List<WorkoutMenuState> and form values are completely same
    if(sameObjectNumBetweenWorkoutMenuStateListAndFromValues == setMaxNum){
      return ["既に同じ値で保存されています"];
    }

    // update specific work out menu list certain day in local database
    if(workoutMenuStateList.isEmpty){
      // add workout menus
      await _addWorkoutMenus(date, menuId, weightControllerList, repControllerList, supportValueList, 0, setMaxNum);
      changedWorkoutMenuInLocalDatabase.add("$setMaxNum件のトレーニングを追加しました");
    } else{
      // update workout menus
      List<String> updatedList = await _updateWorkoutMenus(workoutMenuStateList, date, menuId, weightControllerList, repControllerList, supportValueList, 0, setMaxNum);
      changedWorkoutMenuInLocalDatabase.addAll(updatedList);
      // add workout menus
      await _addWorkoutMenus(date, menuId, weightControllerList, repControllerList, supportValueList, workoutMenuStateList.length, setMaxNum);
      if(workoutMenuStateList.length < setMaxNum){
        changedWorkoutMenuInLocalDatabase.add("${setMaxNum - workoutMenuStateList.length}件のトレーニングを追加しました");
      }
    }

    return changedWorkoutMenuInLocalDatabase;
  }

  /// add workout menu
  Future<void> _addWorkoutMenu(DateTime date, int menuId, int set, double weight, int rep, bool assistant) async {
    // get workout menu repository
    WorkoutMenuRepository workoutMenuRepository = _getWorkoutMenuRepository();
    // add workout menu
    await workoutMenuRepository.addWorkoutMenu(date, menuId, set, weight, rep, assistant);
  }

  /// add workout menus
  Future<void> _addWorkoutMenus(
      DateTime date,
      int menuId,
      List<TextEditingController> weightControllerList,
      List<TextEditingController> repControllerList,
      List<ToggleState> supportValueList,
      int initialIndex,
      int lastIndex
      ) async {
    for(int i = initialIndex; i < lastIndex; i++){
      await _addWorkoutMenu(
          date, menuId, i + 1, double.parse(weightControllerList[i].text), int.parse(repControllerList[i].text), supportValueList[i].value
      );
    }
  }

  /// update workout menu
  Future<void> _updateWorkoutMenu(DateTime date, int menuId, int set, double weight, int rep, bool assistant) async {
    // get workout menu repository
    WorkoutMenuRepository workoutMenuRepository = _getWorkoutMenuRepository();
    // add workout menu
    await workoutMenuRepository.updateWorkoutMenu(date, menuId, set, weight, rep, assistant);
  }

  /// update workout menus
  Future<List<String>> _updateWorkoutMenus(
      List<WorkoutMenuInfo> workoutMenuStateList,
      DateTime date,
      int menuId,
      List<TextEditingController> weightControllerList,
      List<TextEditingController> repControllerList,
      List<ToggleState> supportValueList,
      int initialIndex,
      int lastIndex
      ) async {
    List<String> updatedWorkoutMenuInLocalDatabase = [];

    // calculate update WorkoutMenu num
    int checkUpdateNum = workoutMenuStateList.length > lastIndex ? lastIndex : workoutMenuStateList.length;

    // update workout menu
    List<int> updatedList = [];
    for(int i = initialIndex; i < checkUpdateNum; i++){
      bool workoutMenuStateIsSameObject = _workoutMenuInfoService.compareWorkoutMenuStateAndFormValues(
          workoutMenuStateList[i],
          i + 1,
          double.parse(weightControllerList[i].text),
          int.parse(repControllerList[i].text),
          supportValueList[i].value
      );
      if(workoutMenuStateIsSameObject == false){
        await _updateWorkoutMenu(
            date, menuId, i + 1, double.parse(weightControllerList[i].text), int.parse(repControllerList[i].text), supportValueList[i].value
        );
        updatedList.add(i+1);
      }
    }
    if(updatedList.isNotEmpty) updatedWorkoutMenuInLocalDatabase.add("${updatedList.join("・")}セット目のトレーニングを更新しました");

    // delete workout menu
    if(lastIndex < workoutMenuStateList.length){
      List<int> deletedList = [];
      for(int i = lastIndex; i < workoutMenuStateList.length; i++){
        _deleteWorkoutMenu(date, menuId, i + 1);
        deletedList.add(i+1);
      }
      updatedWorkoutMenuInLocalDatabase.add("${deletedList.join("・")}セット目のトレーニングを削除しました");
    }

    return updatedWorkoutMenuInLocalDatabase;
  }

  /// delete workout menu
  Future<void> _deleteWorkoutMenu(DateTime date, int menuId, int set) async {
    // get workout menu repository
    WorkoutMenuRepository workoutMenuRepository = _getWorkoutMenuRepository();
    // add workout menu
    await workoutMenuRepository.deleteWorkoutMenu(date, menuId, set);
  }

  /// delete specific workout menu list certain day in local database
  Future<void> deleteWorkoutMenuList(DateTime date, int menuId) async {
    // get workout menu repository
    WorkoutMenuRepository workoutMenuRepository = _getWorkoutMenuRepository();
    // delete workout menu list
    await workoutMenuRepository.deleteAllWorkoutMenuCertainDay(date, menuId);
  }

  ///
  /// Validation
  ///

  /// validate whole form values
  List<String> validateForm(
    List<TextEditingController> weightControllerList,
    List<TextEditingController> repControllerList,
    List<ToggleState> supportStateList,
    ){
    Set<int> isNotEmptySetNum = {};
    List<String> validateList = [];

    // validate 5 set weightController and repController in one line are correct
    for(int i = 0; i < 5; i++){
      bool isEmpty = _validateUtilities.checkWeightAndRepAreEmpty(weightControllerList[i], repControllerList[i]);
      if(!isEmpty) isNotEmptySetNum.add(i+1);
    }

    // if all weightController and repController are empty, return validation message
    if(isNotEmptySetNum.isEmpty) return ["1セット目から重さ・回数を入力してください"];

    // validate 5 set weightController and repController in one line are correct
    for(int i = 1; i <= 5; i++){
      String oneLineFormValidateValue = _validateUtilities.validateWeightAndRepAreCorrect(i, weightControllerList[i-1], repControllerList[i-1], supportStateList[i-1]);
      if(oneLineFormValidateValue.isNotEmpty){
        validateList.add(oneLineFormValidateValue);
      }
    }

    // validate all of weightController and repController are in line
    bool isSequential = _validateUtilities.checkIntSetIsSequential(isNotEmptySetNum);
    if(!isSequential){
      Set<int> notSequentialSet = _mathUtilities.getNotSequentialSet(isNotEmptySetNum, 1);
      validateList.add("${notSequentialSet.join('・')}セット目を入力してください");
    }

    return validateList;
  }
}