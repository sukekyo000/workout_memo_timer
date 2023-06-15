
import 'package:drift/drift.dart';

import '../../../data/drift.dart';

part 'generated/predetermined_menu.g.dart';

@DriftAccessor(tables: [PredeterminedMenus])
class PredeterminedMenuRepository extends DatabaseAccessor<MyDatabase> with _$PredeterminedMenuRepositoryMixin {
  PredeterminedMenuRepository(MyDatabase db) : super(db);

  /// get predetermined menu list certain day of week
  Future<List<PredeterminedMenu>> getAllWorkoutMenuListCertainDayOfWeek(int specificDayOfWeek) async {
    final predeterminedMenusCertainDayOfWeekInstance = select(predeterminedMenus)..where((tbl) => tbl.dayOfWeek.equals(specificDayOfWeek));
    return await predeterminedMenusCertainDayOfWeekInstance.get();
  }

  /// get specific predetermined menu certain day of week
  Future<List<PredeterminedMenu>> getSpecificPredeterminedMenuCertainDayOfWeek(int specificDayOfWeek, int workoutMenuId) async {
    final specificPredeterminedMenuCertainDayOfWeekInstance =
        select(predeterminedMenus)..where((tbl) => tbl.dayOfWeek.equals(specificDayOfWeek) & tbl.menuId.equals(workoutMenuId));
    return await specificPredeterminedMenuCertainDayOfWeekInstance.get();
  }

  /// add database predetermined menu
  Future<void> addPredeterminedMenu(int dayOfWeek, int menuId, int set, double weight, int rep, bool assistant) {
    PredeterminedMenusCompanion predeterminedMenusCompanion = PredeterminedMenusCompanion(
      dayOfWeek: Value(dayOfWeek),
      menuId: Value(menuId),
      set: Value(set),
      weight: Value(weight),
      rep: Value(rep),
      assistant: Value(assistant),
    );
    return into(predeterminedMenus).insert(predeterminedMenusCompanion);
  }

  /// update predetermined menu
  Future<void> updatePredeterminedMenu(int dayOfWeek, int menuId, int set, double weight, int rep, bool assistant) async {
    PredeterminedMenusCompanion predeterminedMenusCompanion = PredeterminedMenusCompanion(
      dayOfWeek: Value(dayOfWeek),
      menuId: Value(menuId),
      set: Value(set),
      weight: Value(weight),
      rep: Value(rep),
      assistant: Value(assistant),
    );

    await (update(predeterminedMenus)..where((tbl) => tbl.dayOfWeek.equals(dayOfWeek) & tbl.menuId.equals(menuId) & tbl.set.equals(set))).write(
      predeterminedMenusCompanion,
    );
  }

  /// delete workout menu
  Future<void> deletePredeterminedMenu(int dayOfWeek, int menuId, int set) async {
    await (delete(predeterminedMenus)..where((tbl) => tbl.dayOfWeek.equals(dayOfWeek) & tbl.menuId.equals(menuId) & tbl.set.equals(set))).go();
  }

  /// delete specific workout list certain day of week
  Future<void> deleteSpecificPredeterminedMenuCertainDayOfWeek(int dayOfWeek, int menuId) async {
    await (delete(predeterminedMenus)..where((tbl) => tbl.dayOfWeek.equals(dayOfWeek) & tbl.menuId.equals(menuId))).go();
  }
}