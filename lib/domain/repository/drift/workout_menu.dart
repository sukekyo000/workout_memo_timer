
import 'package:drift/drift.dart';

import '../../../data/drift.dart';

part 'generated/workout_menu.g.dart';

@DriftAccessor(tables: [WorkoutMenus])
class WorkoutMenuRepository extends DatabaseAccessor<MyDatabase> with _$WorkoutMenuRepositoryMixin {
  WorkoutMenuRepository(MyDatabase db) : super(db);

  /// get workout menu certain day
  Future<List<WorkoutMenu>> getAllWorkoutMenuListCertainDay(DateTime date) async {
    final workoutMenusCertainDayInstance = select(workoutMenus)..where((tbl) => tbl.date.equals(date));
    return await workoutMenusCertainDayInstance.get();
  }

  /// get specific workout menu certain day
  Future<List<WorkoutMenu>> getSpecificWorkoutMenuCertainDay(DateTime date, int menuId) async {
    final workoutMenusCertainDayInstance = select(workoutMenus)..where((tbl) => tbl.date.equals(date) & tbl.menuId.equals(menuId));
    return await workoutMenusCertainDayInstance.get();
  }

  /// get specific days
  Future<List<DateTime>> getWorkoutSpecificDays() async {
    final workoutMenusCertainDayInstance = select(workoutMenus);
    final days = await workoutMenusCertainDayInstance.map((e) => e.date).get();
    return days.toSet().toList();
  }

  /// add database workout menu
  Future<void> addWorkoutMenu(DateTime date, int menuId, int set, double weight, int rep, bool assistant) {
    WorkoutMenusCompanion workoutMenusCompanion = WorkoutMenusCompanion(
      date: Value(date),
      menuId: Value(menuId),
      set: Value(set),
      weight: Value(weight),
      rep: Value(rep),
      assistant: Value(assistant),
    );
    return into(workoutMenus).insert(workoutMenusCompanion);
  }

  /// update workout menu
  Future<void> updateWorkoutMenu(DateTime date, int menuId, int set, double weight, int rep, bool assistant) async {
    WorkoutMenusCompanion workoutMenusCompanion = WorkoutMenusCompanion(
      date: Value(date),
      menuId: Value(menuId),
      set: Value(set),
      weight: Value(weight),
      rep: Value(rep),
      assistant: Value(assistant),
    );

    await (update(workoutMenus)..where((tbl) => tbl.date.equals(date) & tbl.menuId.equals(menuId) & tbl.set.equals(set))).write(
      workoutMenusCompanion,
    );
  }

  /// delete workout menu
  Future<void> deleteWorkoutMenu(DateTime date, int menuId, int set) async {
    await (delete(workoutMenus)..where((tbl) => tbl.date.equals(date) & tbl.menuId.equals(menuId) & tbl.set.equals(set))).go();
  }

  /// delete specific all workout menu certain day
  Future<void> deleteAllWorkoutMenuCertainDay(DateTime date, int menuId) async {
    await (delete(workoutMenus)..where((tbl) => tbl.date.equals(date) & tbl.menuId.equals(menuId))).go();
  }
}