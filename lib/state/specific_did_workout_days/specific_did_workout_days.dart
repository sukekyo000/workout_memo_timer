
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/specific_did_workout_days.g.dart';

@riverpod
class SpecificDidWorkoutDaysStateNotifier extends _$SpecificDidWorkoutDaysStateNotifier {
  @override
  Future<List<DateTime>> build() async {
    return [];
  }

  ///
  /// Initial Settings
  ///

  // /// get database instance
  // MyDatabase _getMyDatabase() {
  //   return ref.watch(myDatabaseProvider);
  // }
  //
  // /// get workout menu repository instance
  // WorkoutMenuRepository _getWorkoutMenuRepository() {
  //   return WorkoutMenuRepository(_getMyDatabase());
  // }

}