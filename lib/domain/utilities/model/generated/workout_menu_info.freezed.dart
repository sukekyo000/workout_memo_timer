// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../workout_menu_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutMenuInfo _$WorkoutMenuInfoFromJson(Map<String, dynamic> json) {
  return _WorkoutMenuInfo.fromJson(json);
}

/// @nodoc
mixin _$WorkoutMenuInfo {
  int get set => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  int get repCount => throw _privateConstructorUsedError;
  bool get assistant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutMenuInfoCopyWith<WorkoutMenuInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutMenuInfoCopyWith<$Res> {
  factory $WorkoutMenuInfoCopyWith(
          WorkoutMenuInfo value, $Res Function(WorkoutMenuInfo) then) =
      _$WorkoutMenuInfoCopyWithImpl<$Res, WorkoutMenuInfo>;
  @useResult
  $Res call({int set, double weight, int repCount, bool assistant});
}

/// @nodoc
class _$WorkoutMenuInfoCopyWithImpl<$Res, $Val extends WorkoutMenuInfo>
    implements $WorkoutMenuInfoCopyWith<$Res> {
  _$WorkoutMenuInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? set = null,
    Object? weight = null,
    Object? repCount = null,
    Object? assistant = null,
  }) {
    return _then(_value.copyWith(
      set: null == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      repCount: null == repCount
          ? _value.repCount
          : repCount // ignore: cast_nullable_to_non_nullable
              as int,
      assistant: null == assistant
          ? _value.assistant
          : assistant // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutMenuInfoCopyWith<$Res>
    implements $WorkoutMenuInfoCopyWith<$Res> {
  factory _$$_WorkoutMenuInfoCopyWith(
          _$_WorkoutMenuInfo value, $Res Function(_$_WorkoutMenuInfo) then) =
      __$$_WorkoutMenuInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int set, double weight, int repCount, bool assistant});
}

/// @nodoc
class __$$_WorkoutMenuInfoCopyWithImpl<$Res>
    extends _$WorkoutMenuInfoCopyWithImpl<$Res, _$_WorkoutMenuInfo>
    implements _$$_WorkoutMenuInfoCopyWith<$Res> {
  __$$_WorkoutMenuInfoCopyWithImpl(
      _$_WorkoutMenuInfo _value, $Res Function(_$_WorkoutMenuInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? set = null,
    Object? weight = null,
    Object? repCount = null,
    Object? assistant = null,
  }) {
    return _then(_$_WorkoutMenuInfo(
      set: null == set
          ? _value.set
          : set // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      repCount: null == repCount
          ? _value.repCount
          : repCount // ignore: cast_nullable_to_non_nullable
              as int,
      assistant: null == assistant
          ? _value.assistant
          : assistant // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutMenuInfo implements _WorkoutMenuInfo {
  const _$_WorkoutMenuInfo(
      {required this.set,
      required this.weight,
      required this.repCount,
      required this.assistant});

  factory _$_WorkoutMenuInfo.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutMenuInfoFromJson(json);

  @override
  final int set;
  @override
  final double weight;
  @override
  final int repCount;
  @override
  final bool assistant;

  @override
  String toString() {
    return 'WorkoutMenuInfo(set: $set, weight: $weight, repCount: $repCount, assistant: $assistant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutMenuInfo &&
            (identical(other.set, set) || other.set == set) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.repCount, repCount) ||
                other.repCount == repCount) &&
            (identical(other.assistant, assistant) ||
                other.assistant == assistant));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, set, weight, repCount, assistant);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutMenuInfoCopyWith<_$_WorkoutMenuInfo> get copyWith =>
      __$$_WorkoutMenuInfoCopyWithImpl<_$_WorkoutMenuInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutMenuInfoToJson(
      this,
    );
  }
}

abstract class _WorkoutMenuInfo implements WorkoutMenuInfo {
  const factory _WorkoutMenuInfo(
      {required final int set,
      required final double weight,
      required final int repCount,
      required final bool assistant}) = _$_WorkoutMenuInfo;

  factory _WorkoutMenuInfo.fromJson(Map<String, dynamic> json) =
      _$_WorkoutMenuInfo.fromJson;

  @override
  int get set;
  @override
  double get weight;
  @override
  int get repCount;
  @override
  bool get assistant;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutMenuInfoCopyWith<_$_WorkoutMenuInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
