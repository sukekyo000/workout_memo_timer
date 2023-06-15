
import 'package:flutter/cupertino.dart';
import 'package:flutter_use/flutter_use.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/drift.dart';
import '../../domain/repository/drift/predetermined_menu.dart';
import '../../domain/service/predetermined_menu.dart';
import '../../domain/service/workout_menu_info.dart';
import '../../domain/utilities/math.dart';
import '../../domain/utilities/model/workout_menu_info.dart';
import '../../domain/utilities/validation.dart';
import '../global/drift.dart';

part 'generated/specific_predetermined_workout_certain_day_of_week.g.dart';

@riverpod
class SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier extends _$SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier {
  @override
  Future<List<WorkoutMenuInfo>> build(int dayOfWeekId, int workoutMenuId) async {
    return _createSpecificWorkoutMenuInfoListCertainDayOfWeek(dayOfWeekId, workoutMenuId);
  }

  ///
  /// Initial Settings
  ///

  final PredeterminedMenuService _predeterminedMenuService = PredeterminedMenuService();
  final MathUtilities _mathUtilities = MathUtilities();
  final ValidateUtilities _validateUtilities = ValidateUtilities();
  final WorkoutMenuInfoService _workoutMenuInfoService = WorkoutMenuInfoService();

  /// get database instance
  MyDatabase _getMyDatabase() {
    return ref.watch(myDatabaseProvider);
  }

  /// get predetermined workout menu repository instance
  PredeterminedMenuRepository _getPredeterminedMenuRepository() {
    return PredeterminedMenuRepository(_getMyDatabase());
  }

  ///
  /// Create State
  ///

  /// create WorkoutMenuInfo list from PredeterminedMenuRepository
  Future<List<WorkoutMenuInfo>> _createSpecificWorkoutMenuInfoListCertainDayOfWeek(int dayOfWeekId, int workoutMenuId) async {
    // get predetermined menu repository instance
    PredeterminedMenuRepository predeterminedMenuRepository = _getPredeterminedMenuRepository();
    // get specific predetermined menu list certain day of week
    List<PredeterminedMenu> predeterminedMenuList =
      await predeterminedMenuRepository.getSpecificPredeterminedMenuCertainDayOfWeek(dayOfWeekId, workoutMenuId);
    // sort workout menu list
    predeterminedMenuList.sort((a, b) => a.set.compareTo(b.set));
    // convert List<WorkoutMenuInfo> to List<WorkoutMenuInfo>
    return _predeterminedMenuService.convertPredeterminedMenuListToWorkoutMenuInfoList(predeterminedMenuList);
  }

  ///
  /// CRUD
  ///

  /// create workout menus
  Future<List<String>> createWorkoutMenus(
      int dayOfWeekId,
      int menuId,
      List<TextEditingController> weightControllerList,
      List<TextEditingController> repControllerList,
      List<ToggleState> supportValueList
      ) async {
    // initial list
    List<String> changedWorkoutMenuInLocalDatabase = [];

    // calculate how many sets
    int setMaxNum = _validateUtilities.calculateHomeManySetFormHave(weightControllerList, repControllerList);

    // get previous specific workout menu list certain day
    List<WorkoutMenuInfo> workoutMenuInfoList = await _createSpecificWorkoutMenuInfoListCertainDayOfWeek(dayOfWeekId, menuId);

    // calculate how many List<WorkoutMenuState> and form values are same
    int sameObjectNumBetweenWorkoutMenuStateListAndFromValues =
      _workoutMenuInfoService.calculateWorkoutMenuStateListAndFormValuesHaveSameObject(workoutMenuInfoList, weightControllerList, repControllerList, supportValueList, setMaxNum);

    // return if List<WorkoutMenuState> and form values are completely same
    if(sameObjectNumBetweenWorkoutMenuStateListAndFromValues == setMaxNum){
      return ["既に同じ値で保存されています"];
    }

    // update specific work out menu list certain day in local database
    if(workoutMenuInfoList.isEmpty){
      // add workout menus
      await _addWorkoutMenus(dayOfWeekId, menuId, weightControllerList, repControllerList, supportValueList, 0, setMaxNum);
      changedWorkoutMenuInLocalDatabase.add("$setMaxNum件のトレーニングを追加しました");
    } else {
      // update workout menus
      List<String> updatedList = await _updateWorkoutMenus(workoutMenuInfoList, dayOfWeekId, workoutMenuId, weightControllerList, repControllerList, supportValueList, 0, setMaxNum);
      changedWorkoutMenuInLocalDatabase.addAll(updatedList);
      // add workout menus
      await _addWorkoutMenus(dayOfWeekId, menuId, weightControllerList, repControllerList, supportValueList, workoutMenuInfoList.length, setMaxNum);
      if(workoutMenuInfoList.length < setMaxNum){
        changedWorkoutMenuInLocalDatabase.add("${setMaxNum - workoutMenuInfoList.length}件のトレーニングを追加しました");
      }
    }

    return changedWorkoutMenuInLocalDatabase;
  }

  /// add workout menus
  Future<void> _addWorkoutMenus(
      int dayOfWeekId,
      int menuId,
      List<TextEditingController> weightControllerList,
      List<TextEditingController> repControllerList,
      List<ToggleState> supportValueList,
      int initialIndex,
      int lastIndex
      ) async {
    for(int i = initialIndex; i < lastIndex; i++){
      await _addWorkoutMenu(
          dayOfWeekId, menuId, i + 1, double.parse(weightControllerList[i].text), int.parse(repControllerList[i].text), supportValueList[i].value
      );
    }
  }

  /// add workout menu
  Future<void> _addWorkoutMenu(int dayOfWeekId, int menuId, int set, double weight, int rep, bool assistant) async {
    // get workout menu repository
    PredeterminedMenuRepository predeterminedMenuRepository = _getPredeterminedMenuRepository();
    // add workout menu
    await predeterminedMenuRepository.addPredeterminedMenu(dayOfWeekId, menuId, set, weight, rep, assistant);
  }

  /// update workout menus
  Future<List<String>> _updateWorkoutMenus(
      List<WorkoutMenuInfo> workoutMenuStateList,
      int dayOfWeekId,
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
            dayOfWeekId, menuId, i + 1, double.parse(weightControllerList[i].text), int.parse(repControllerList[i].text), supportValueList[i].value
        );
        updatedList.add(i+1);
      }
    }
    if(updatedList.isNotEmpty) updatedWorkoutMenuInLocalDatabase.add("${updatedList.join("・")}セット目のトレーニングを更新しました");

    // delete workout menu
    if(lastIndex < workoutMenuStateList.length){
      List<int> deletedList = [];
      for(int i = lastIndex; i < workoutMenuStateList.length; i++){
        _deleteWorkoutMenu(dayOfWeekId, menuId, i + 1);
        deletedList.add(i+1);
      }
      updatedWorkoutMenuInLocalDatabase.add("${deletedList.join("・")}セット目のトレーニングを削除しました");
    }

    return updatedWorkoutMenuInLocalDatabase;
  }

  /// update workout menu
  Future<void> _updateWorkoutMenu(int dayOfWeekId, int menuId, int set, double weight, int rep, bool assistant) async {
    // get predetermined menu repository
    PredeterminedMenuRepository predeterminedMenuRepository = _getPredeterminedMenuRepository();
    // update predetermined menu
    await predeterminedMenuRepository.updatePredeterminedMenu(dayOfWeekId, menuId, set, weight, rep, assistant);
  }

  /// delete workout menu
  Future<void> _deleteWorkoutMenu(int dayOfWeekId, int menuId, int set) async {
    // get predetermined menu repository
    PredeterminedMenuRepository predeterminedMenuRepository = _getPredeterminedMenuRepository();
    // delete predetermined menu
    await predeterminedMenuRepository.deletePredeterminedMenu(dayOfWeekId, menuId, set);
  }

  /// delete specific workout menu list certain day of week in local database
  Future<void> deleteWorkoutMenuList(int dayOfWeekId, int menuId) async {
    // get predetermined menu repository
    PredeterminedMenuRepository predeterminedMenuRepository = _getPredeterminedMenuRepository();
    // delete workout menu list
    await predeterminedMenuRepository.deleteSpecificPredeterminedMenuCertainDayOfWeek(dayOfWeekId, menuId);
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