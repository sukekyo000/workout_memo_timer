// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../workouts_certain_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecificDayWorkoutList _$$_SpecificDayWorkoutListFromJson(
        Map<String, dynamic> json) =>
    _$_SpecificDayWorkoutList(
      date: DateTime.parse(json['date'] as String),
      menuCount: json['menuCount'] as int,
      workoutMenuInfoMap:
          (json['workoutMenuInfoMap'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            int.parse(k),
            (e as List<dynamic>)
                .map((e) => WorkoutMenuInfo.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$_SpecificDayWorkoutListToJson(
        _$_SpecificDayWorkoutList instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'menuCount': instance.menuCount,
      'workoutMenuInfoMap':
          instance.workoutMenuInfoMap.map((k, e) => MapEntry(k.toString(), e)),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$workoutMenuListCertainDayStateNotifierHash() =>
    r'12c3a47a80cf26b4d353b9c43cec7d755b1885b9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$WorkoutMenuListCertainDayStateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<SpecificDayWorkoutList> {
  late final DateTime date;

  Future<SpecificDayWorkoutList> build(
    DateTime date,
  );
}

/// See also [WorkoutMenuListCertainDayStateNotifier].
@ProviderFor(WorkoutMenuListCertainDayStateNotifier)
const workoutMenuListCertainDayStateNotifierProvider =
    WorkoutMenuListCertainDayStateNotifierFamily();

/// See also [WorkoutMenuListCertainDayStateNotifier].
class WorkoutMenuListCertainDayStateNotifierFamily
    extends Family<AsyncValue<SpecificDayWorkoutList>> {
  /// See also [WorkoutMenuListCertainDayStateNotifier].
  const WorkoutMenuListCertainDayStateNotifierFamily();

  /// See also [WorkoutMenuListCertainDayStateNotifier].
  WorkoutMenuListCertainDayStateNotifierProvider call(
    DateTime date,
  ) {
    return WorkoutMenuListCertainDayStateNotifierProvider(
      date,
    );
  }

  @override
  WorkoutMenuListCertainDayStateNotifierProvider getProviderOverride(
    covariant WorkoutMenuListCertainDayStateNotifierProvider provider,
  ) {
    return call(
      provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'workoutMenuListCertainDayStateNotifierProvider';
}

/// See also [WorkoutMenuListCertainDayStateNotifier].
class WorkoutMenuListCertainDayStateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        WorkoutMenuListCertainDayStateNotifier, SpecificDayWorkoutList> {
  /// See also [WorkoutMenuListCertainDayStateNotifier].
  WorkoutMenuListCertainDayStateNotifierProvider(
    this.date,
  ) : super.internal(
          () => WorkoutMenuListCertainDayStateNotifier()..date = date,
          from: workoutMenuListCertainDayStateNotifierProvider,
          name: r'workoutMenuListCertainDayStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$workoutMenuListCertainDayStateNotifierHash,
          dependencies:
              WorkoutMenuListCertainDayStateNotifierFamily._dependencies,
          allTransitiveDependencies:
              WorkoutMenuListCertainDayStateNotifierFamily
                  ._allTransitiveDependencies,
        );

  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is WorkoutMenuListCertainDayStateNotifierProvider &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<SpecificDayWorkoutList> runNotifierBuild(
    covariant WorkoutMenuListCertainDayStateNotifier notifier,
  ) {
    return notifier.build(
      date,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
