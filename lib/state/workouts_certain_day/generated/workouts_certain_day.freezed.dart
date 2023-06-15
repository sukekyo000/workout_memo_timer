// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../workouts_certain_day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpecificDayWorkoutList _$SpecificDayWorkoutListFromJson(
    Map<String, dynamic> json) {
  return _SpecificDayWorkoutList.fromJson(json);
}

/// @nodoc
mixin _$SpecificDayWorkoutList {
  DateTime get date => throw _privateConstructorUsedError;
  int get menuCount => throw _privateConstructorUsedError;
  Map<int, List<WorkoutMenuInfo>> get workoutMenuInfoMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecificDayWorkoutListCopyWith<SpecificDayWorkoutList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecificDayWorkoutListCopyWith<$Res> {
  factory $SpecificDayWorkoutListCopyWith(SpecificDayWorkoutList value,
          $Res Function(SpecificDayWorkoutList) then) =
      _$SpecificDayWorkoutListCopyWithImpl<$Res, SpecificDayWorkoutList>;
  @useResult
  $Res call(
      {DateTime date,
      int menuCount,
      Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap});
}

/// @nodoc
class _$SpecificDayWorkoutListCopyWithImpl<$Res,
        $Val extends SpecificDayWorkoutList>
    implements $SpecificDayWorkoutListCopyWith<$Res> {
  _$SpecificDayWorkoutListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? menuCount = null,
    Object? workoutMenuInfoMap = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menuCount: null == menuCount
          ? _value.menuCount
          : menuCount // ignore: cast_nullable_to_non_nullable
              as int,
      workoutMenuInfoMap: null == workoutMenuInfoMap
          ? _value.workoutMenuInfoMap
          : workoutMenuInfoMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<WorkoutMenuInfo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SpecificDayWorkoutListCopyWith<$Res>
    implements $SpecificDayWorkoutListCopyWith<$Res> {
  factory _$$_SpecificDayWorkoutListCopyWith(_$_SpecificDayWorkoutList value,
          $Res Function(_$_SpecificDayWorkoutList) then) =
      __$$_SpecificDayWorkoutListCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      int menuCount,
      Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap});
}

/// @nodoc
class __$$_SpecificDayWorkoutListCopyWithImpl<$Res>
    extends _$SpecificDayWorkoutListCopyWithImpl<$Res,
        _$_SpecificDayWorkoutList>
    implements _$$_SpecificDayWorkoutListCopyWith<$Res> {
  __$$_SpecificDayWorkoutListCopyWithImpl(_$_SpecificDayWorkoutList _value,
      $Res Function(_$_SpecificDayWorkoutList) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? menuCount = null,
    Object? workoutMenuInfoMap = null,
  }) {
    return _then(_$_SpecificDayWorkoutList(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      menuCount: null == menuCount
          ? _value.menuCount
          : menuCount // ignore: cast_nullable_to_non_nullable
              as int,
      workoutMenuInfoMap: null == workoutMenuInfoMap
          ? _value._workoutMenuInfoMap
          : workoutMenuInfoMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<WorkoutMenuInfo>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SpecificDayWorkoutList implements _SpecificDayWorkoutList {
  const _$_SpecificDayWorkoutList(
      {required this.date,
      required this.menuCount,
      required final Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap})
      : _workoutMenuInfoMap = workoutMenuInfoMap;

  factory _$_SpecificDayWorkoutList.fromJson(Map<String, dynamic> json) =>
      _$$_SpecificDayWorkoutListFromJson(json);

  @override
  final DateTime date;
  @override
  final int menuCount;
  final Map<int, List<WorkoutMenuInfo>> _workoutMenuInfoMap;
  @override
  Map<int, List<WorkoutMenuInfo>> get workoutMenuInfoMap {
    if (_workoutMenuInfoMap is EqualUnmodifiableMapView)
      return _workoutMenuInfoMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workoutMenuInfoMap);
  }

  @override
  String toString() {
    return 'SpecificDayWorkoutList(date: $date, menuCount: $menuCount, workoutMenuInfoMap: $workoutMenuInfoMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SpecificDayWorkoutList &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.menuCount, menuCount) ||
                other.menuCount == menuCount) &&
            const DeepCollectionEquality()
                .equals(other._workoutMenuInfoMap, _workoutMenuInfoMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, menuCount,
      const DeepCollectionEquality().hash(_workoutMenuInfoMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SpecificDayWorkoutListCopyWith<_$_SpecificDayWorkoutList> get copyWith =>
      __$$_SpecificDayWorkoutListCopyWithImpl<_$_SpecificDayWorkoutList>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SpecificDayWorkoutListToJson(
      this,
    );
  }
}

abstract class _SpecificDayWorkoutList implements SpecificDayWorkoutList {
  const factory _SpecificDayWorkoutList(
          {required final DateTime date,
          required final int menuCount,
          required final Map<int, List<WorkoutMenuInfo>> workoutMenuInfoMap}) =
      _$_SpecificDayWorkoutList;

  factory _SpecificDayWorkoutList.fromJson(Map<String, dynamic> json) =
      _$_SpecificDayWorkoutList.fromJson;

  @override
  DateTime get date;
  @override
  int get menuCount;
  @override
  Map<int, List<WorkoutMenuInfo>> get workoutMenuInfoMap;
  @override
  @JsonKey(ignore: true)
  _$$_SpecificDayWorkoutListCopyWith<_$_SpecificDayWorkoutList> get copyWith =>
      throw _privateConstructorUsedError;
}
