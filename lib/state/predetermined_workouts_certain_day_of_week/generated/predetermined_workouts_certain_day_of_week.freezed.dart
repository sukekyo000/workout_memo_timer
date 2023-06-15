// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../predetermined_workouts_certain_day_of_week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PredeterminedWorkoutListSpecificDayOfWeekState
    _$PredeterminedWorkoutListSpecificDayOfWeekStateFromJson(
        Map<String, dynamic> json) {
  return _PredeterminedWorkoutListSpecificDayOfWeekState.fromJson(json);
}

/// @nodoc
mixin _$PredeterminedWorkoutListSpecificDayOfWeekState {
  int get dayOfWeekId => throw _privateConstructorUsedError;
  int get menuCount => throw _privateConstructorUsedError;
  Map<int, List<WorkoutMenuInfo>> get predeterminedMenuInfoMap =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<
          PredeterminedWorkoutListSpecificDayOfWeekState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<$Res> {
  factory $PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith(
          PredeterminedWorkoutListSpecificDayOfWeekState value,
          $Res Function(PredeterminedWorkoutListSpecificDayOfWeekState) then) =
      _$PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl<$Res,
          PredeterminedWorkoutListSpecificDayOfWeekState>;
  @useResult
  $Res call(
      {int dayOfWeekId,
      int menuCount,
      Map<int, List<WorkoutMenuInfo>> predeterminedMenuInfoMap});
}

/// @nodoc
class _$PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl<$Res,
        $Val extends PredeterminedWorkoutListSpecificDayOfWeekState>
    implements $PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<$Res> {
  _$PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeekId = null,
    Object? menuCount = null,
    Object? predeterminedMenuInfoMap = null,
  }) {
    return _then(_value.copyWith(
      dayOfWeekId: null == dayOfWeekId
          ? _value.dayOfWeekId
          : dayOfWeekId // ignore: cast_nullable_to_non_nullable
              as int,
      menuCount: null == menuCount
          ? _value.menuCount
          : menuCount // ignore: cast_nullable_to_non_nullable
              as int,
      predeterminedMenuInfoMap: null == predeterminedMenuInfoMap
          ? _value.predeterminedMenuInfoMap
          : predeterminedMenuInfoMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<WorkoutMenuInfo>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<$Res>
    implements $PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<$Res> {
  factory _$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith(
          _$_PredeterminedWorkoutListSpecificDayOfWeekState value,
          $Res Function(_$_PredeterminedWorkoutListSpecificDayOfWeekState)
              then) =
      __$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int dayOfWeekId,
      int menuCount,
      Map<int, List<WorkoutMenuInfo>> predeterminedMenuInfoMap});
}

/// @nodoc
class __$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl<$Res>
    extends _$PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl<$Res,
        _$_PredeterminedWorkoutListSpecificDayOfWeekState>
    implements
        _$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<$Res> {
  __$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl(
      _$_PredeterminedWorkoutListSpecificDayOfWeekState _value,
      $Res Function(_$_PredeterminedWorkoutListSpecificDayOfWeekState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dayOfWeekId = null,
    Object? menuCount = null,
    Object? predeterminedMenuInfoMap = null,
  }) {
    return _then(_$_PredeterminedWorkoutListSpecificDayOfWeekState(
      dayOfWeekId: null == dayOfWeekId
          ? _value.dayOfWeekId
          : dayOfWeekId // ignore: cast_nullable_to_non_nullable
              as int,
      menuCount: null == menuCount
          ? _value.menuCount
          : menuCount // ignore: cast_nullable_to_non_nullable
              as int,
      predeterminedMenuInfoMap: null == predeterminedMenuInfoMap
          ? _value._predeterminedMenuInfoMap
          : predeterminedMenuInfoMap // ignore: cast_nullable_to_non_nullable
              as Map<int, List<WorkoutMenuInfo>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PredeterminedWorkoutListSpecificDayOfWeekState
    implements _PredeterminedWorkoutListSpecificDayOfWeekState {
  const _$_PredeterminedWorkoutListSpecificDayOfWeekState(
      {required this.dayOfWeekId,
      required this.menuCount,
      required final Map<int, List<WorkoutMenuInfo>> predeterminedMenuInfoMap})
      : _predeterminedMenuInfoMap = predeterminedMenuInfoMap;

  factory _$_PredeterminedWorkoutListSpecificDayOfWeekState.fromJson(
          Map<String, dynamic> json) =>
      _$$_PredeterminedWorkoutListSpecificDayOfWeekStateFromJson(json);

  @override
  final int dayOfWeekId;
  @override
  final int menuCount;
  final Map<int, List<WorkoutMenuInfo>> _predeterminedMenuInfoMap;
  @override
  Map<int, List<WorkoutMenuInfo>> get predeterminedMenuInfoMap {
    if (_predeterminedMenuInfoMap is EqualUnmodifiableMapView)
      return _predeterminedMenuInfoMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_predeterminedMenuInfoMap);
  }

  @override
  String toString() {
    return 'PredeterminedWorkoutListSpecificDayOfWeekState(dayOfWeekId: $dayOfWeekId, menuCount: $menuCount, predeterminedMenuInfoMap: $predeterminedMenuInfoMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PredeterminedWorkoutListSpecificDayOfWeekState &&
            (identical(other.dayOfWeekId, dayOfWeekId) ||
                other.dayOfWeekId == dayOfWeekId) &&
            (identical(other.menuCount, menuCount) ||
                other.menuCount == menuCount) &&
            const DeepCollectionEquality().equals(
                other._predeterminedMenuInfoMap, _predeterminedMenuInfoMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, dayOfWeekId, menuCount,
      const DeepCollectionEquality().hash(_predeterminedMenuInfoMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<
          _$_PredeterminedWorkoutListSpecificDayOfWeekState>
      get copyWith =>
          __$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWithImpl<
                  _$_PredeterminedWorkoutListSpecificDayOfWeekState>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PredeterminedWorkoutListSpecificDayOfWeekStateToJson(
      this,
    );
  }
}

abstract class _PredeterminedWorkoutListSpecificDayOfWeekState
    implements PredeterminedWorkoutListSpecificDayOfWeekState {
  const factory _PredeterminedWorkoutListSpecificDayOfWeekState(
          {required final int dayOfWeekId,
          required final int menuCount,
          required final Map<int, List<WorkoutMenuInfo>>
              predeterminedMenuInfoMap}) =
      _$_PredeterminedWorkoutListSpecificDayOfWeekState;

  factory _PredeterminedWorkoutListSpecificDayOfWeekState.fromJson(
          Map<String, dynamic> json) =
      _$_PredeterminedWorkoutListSpecificDayOfWeekState.fromJson;

  @override
  int get dayOfWeekId;
  @override
  int get menuCount;
  @override
  Map<int, List<WorkoutMenuInfo>> get predeterminedMenuInfoMap;
  @override
  @JsonKey(ignore: true)
  _$$_PredeterminedWorkoutListSpecificDayOfWeekStateCopyWith<
          _$_PredeterminedWorkoutListSpecificDayOfWeekState>
      get copyWith => throw _privateConstructorUsedError;
}
