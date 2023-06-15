// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../workout.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_WorkoutMenuByPartOfBody _$$_WorkoutMenuByPartOfBodyFromJson(
        Map<String, dynamic> json) =>
    _$_WorkoutMenuByPartOfBody(
      partOfBodyId: json['partOfBodyId'] as int,
      partOfBodyName: json['partOfBodyName'] as String,
      workoutMenuMap: (json['workoutMenuMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(int.parse(k), e as String),
      ),
    );

Map<String, dynamic> _$$_WorkoutMenuByPartOfBodyToJson(
        _$_WorkoutMenuByPartOfBody instance) =>
    <String, dynamic>{
      'partOfBodyId': instance.partOfBodyId,
      'partOfBodyName': instance.partOfBodyName,
      'workoutMenuMap':
          instance.workoutMenuMap.map((k, e) => MapEntry(k.toString(), e)),
    };
