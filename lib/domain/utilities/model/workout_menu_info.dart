
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/workout_menu_info.freezed.dart';
part 'generated/workout_menu_info.g.dart';

@freezed
class WorkoutMenuInfo with _$WorkoutMenuInfo {
  const factory WorkoutMenuInfo({
    required int set,
    required double weight,
    required int repCount,
    required bool assistant
  }) = _WorkoutMenuInfo;

  factory WorkoutMenuInfo.fromJson(Map<String, dynamic> json) => _$WorkoutMenuInfoFromJson(json);
}