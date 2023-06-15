// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '../workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

WorkoutMenuByPartOfBody _$WorkoutMenuByPartOfBodyFromJson(
    Map<String, dynamic> json) {
  return _WorkoutMenuByPartOfBody.fromJson(json);
}

/// @nodoc
mixin _$WorkoutMenuByPartOfBody {
  int get partOfBodyId => throw _privateConstructorUsedError;
  String get partOfBodyName => throw _privateConstructorUsedError;
  Map<int, String> get workoutMenuMap => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WorkoutMenuByPartOfBodyCopyWith<WorkoutMenuByPartOfBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutMenuByPartOfBodyCopyWith<$Res> {
  factory $WorkoutMenuByPartOfBodyCopyWith(WorkoutMenuByPartOfBody value,
          $Res Function(WorkoutMenuByPartOfBody) then) =
      _$WorkoutMenuByPartOfBodyCopyWithImpl<$Res, WorkoutMenuByPartOfBody>;
  @useResult
  $Res call(
      {int partOfBodyId,
      String partOfBodyName,
      Map<int, String> workoutMenuMap});
}

/// @nodoc
class _$WorkoutMenuByPartOfBodyCopyWithImpl<$Res,
        $Val extends WorkoutMenuByPartOfBody>
    implements $WorkoutMenuByPartOfBodyCopyWith<$Res> {
  _$WorkoutMenuByPartOfBodyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOfBodyId = null,
    Object? partOfBodyName = null,
    Object? workoutMenuMap = null,
  }) {
    return _then(_value.copyWith(
      partOfBodyId: null == partOfBodyId
          ? _value.partOfBodyId
          : partOfBodyId // ignore: cast_nullable_to_non_nullable
              as int,
      partOfBodyName: null == partOfBodyName
          ? _value.partOfBodyName
          : partOfBodyName // ignore: cast_nullable_to_non_nullable
              as String,
      workoutMenuMap: null == workoutMenuMap
          ? _value.workoutMenuMap
          : workoutMenuMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutMenuByPartOfBodyCopyWith<$Res>
    implements $WorkoutMenuByPartOfBodyCopyWith<$Res> {
  factory _$$_WorkoutMenuByPartOfBodyCopyWith(_$_WorkoutMenuByPartOfBody value,
          $Res Function(_$_WorkoutMenuByPartOfBody) then) =
      __$$_WorkoutMenuByPartOfBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int partOfBodyId,
      String partOfBodyName,
      Map<int, String> workoutMenuMap});
}

/// @nodoc
class __$$_WorkoutMenuByPartOfBodyCopyWithImpl<$Res>
    extends _$WorkoutMenuByPartOfBodyCopyWithImpl<$Res,
        _$_WorkoutMenuByPartOfBody>
    implements _$$_WorkoutMenuByPartOfBodyCopyWith<$Res> {
  __$$_WorkoutMenuByPartOfBodyCopyWithImpl(_$_WorkoutMenuByPartOfBody _value,
      $Res Function(_$_WorkoutMenuByPartOfBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? partOfBodyId = null,
    Object? partOfBodyName = null,
    Object? workoutMenuMap = null,
  }) {
    return _then(_$_WorkoutMenuByPartOfBody(
      partOfBodyId: null == partOfBodyId
          ? _value.partOfBodyId
          : partOfBodyId // ignore: cast_nullable_to_non_nullable
              as int,
      partOfBodyName: null == partOfBodyName
          ? _value.partOfBodyName
          : partOfBodyName // ignore: cast_nullable_to_non_nullable
              as String,
      workoutMenuMap: null == workoutMenuMap
          ? _value._workoutMenuMap
          : workoutMenuMap // ignore: cast_nullable_to_non_nullable
              as Map<int, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_WorkoutMenuByPartOfBody implements _WorkoutMenuByPartOfBody {
  const _$_WorkoutMenuByPartOfBody(
      {required this.partOfBodyId,
      required this.partOfBodyName,
      required final Map<int, String> workoutMenuMap})
      : _workoutMenuMap = workoutMenuMap;

  factory _$_WorkoutMenuByPartOfBody.fromJson(Map<String, dynamic> json) =>
      _$$_WorkoutMenuByPartOfBodyFromJson(json);

  @override
  final int partOfBodyId;
  @override
  final String partOfBodyName;
  final Map<int, String> _workoutMenuMap;
  @override
  Map<int, String> get workoutMenuMap {
    if (_workoutMenuMap is EqualUnmodifiableMapView) return _workoutMenuMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_workoutMenuMap);
  }

  @override
  String toString() {
    return 'WorkoutMenuByPartOfBody(partOfBodyId: $partOfBodyId, partOfBodyName: $partOfBodyName, workoutMenuMap: $workoutMenuMap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutMenuByPartOfBody &&
            (identical(other.partOfBodyId, partOfBodyId) ||
                other.partOfBodyId == partOfBodyId) &&
            (identical(other.partOfBodyName, partOfBodyName) ||
                other.partOfBodyName == partOfBodyName) &&
            const DeepCollectionEquality()
                .equals(other._workoutMenuMap, _workoutMenuMap));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, partOfBodyId, partOfBodyName,
      const DeepCollectionEquality().hash(_workoutMenuMap));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutMenuByPartOfBodyCopyWith<_$_WorkoutMenuByPartOfBody>
      get copyWith =>
          __$$_WorkoutMenuByPartOfBodyCopyWithImpl<_$_WorkoutMenuByPartOfBody>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_WorkoutMenuByPartOfBodyToJson(
      this,
    );
  }
}

abstract class _WorkoutMenuByPartOfBody implements WorkoutMenuByPartOfBody {
  const factory _WorkoutMenuByPartOfBody(
          {required final int partOfBodyId,
          required final String partOfBodyName,
          required final Map<int, String> workoutMenuMap}) =
      _$_WorkoutMenuByPartOfBody;

  factory _WorkoutMenuByPartOfBody.fromJson(Map<String, dynamic> json) =
      _$_WorkoutMenuByPartOfBody.fromJson;

  @override
  int get partOfBodyId;
  @override
  String get partOfBodyName;
  @override
  Map<int, String> get workoutMenuMap;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutMenuByPartOfBodyCopyWith<_$_WorkoutMenuByPartOfBody>
      get copyWith => throw _privateConstructorUsedError;
}
