// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../workout_menu_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutMenuInfo _$$_WorkoutMenuInfoFromJson(Map<String, dynamic> json) =>
    _$_WorkoutMenuInfo(
      set: json['set'] as int,
      weight: (json['weight'] as num).toDouble(),
      repCount: json['repCount'] as int,
      assistant: json['assistant'] as bool,
    );

Map<String, dynamic> _$$_WorkoutMenuInfoToJson(_$_WorkoutMenuInfo instance) =>
    <String, dynamic>{
      'set': instance.set,
      'weight': instance.weight,
      'repCount': instance.repCount,
      'assistant': instance.assistant,
    };
