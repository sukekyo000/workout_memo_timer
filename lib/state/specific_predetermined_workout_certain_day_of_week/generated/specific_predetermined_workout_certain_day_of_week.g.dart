// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../specific_predetermined_workout_certain_day_of_week.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$specificPredeterminedWorkoutCertainDayOfWeekStateNotifierHash() =>
    r'f9ddde146689bcdd4ad0dd1f5747cfeb0868e451';

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

abstract class _$SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkoutMenuInfo>> {
  late final int dayOfWeekId;
  late final int workoutMenuId;

  Future<List<WorkoutMenuInfo>> build(
    int dayOfWeekId,
    int workoutMenuId,
  );
}

/// See also [SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier].
@ProviderFor(SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier)
const specificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider =
    SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierFamily();

/// See also [SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier].
class SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierFamily
    extends Family<AsyncValue<List<WorkoutMenuInfo>>> {
  /// See also [SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier].
  const SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierFamily();

  /// See also [SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier].
  SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider call(
    int dayOfWeekId,
    int workoutMenuId,
  ) {
    return SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider(
      dayOfWeekId,
      workoutMenuId,
    );
  }

  @override
  SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider
      getProviderOverride(
    covariant SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider
        provider,
  ) {
    return call(
      provider.dayOfWeekId,
      provider.workoutMenuId,
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
  String? get name =>
      r'specificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider';
}

/// See also [SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier].
class SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier,
        List<WorkoutMenuInfo>> {
  /// See also [SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier].
  SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider(
    this.dayOfWeekId,
    this.workoutMenuId,
  ) : super.internal(
          () => SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier()
            ..dayOfWeekId = dayOfWeekId
            ..workoutMenuId = workoutMenuId,
          from:
              specificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider,
          name:
              r'specificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment(
                  'dart.vm.product')
              ? null
              : _$specificPredeterminedWorkoutCertainDayOfWeekStateNotifierHash,
          dependencies:
              SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierFamily
                  ._dependencies,
          allTransitiveDependencies:
              SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierFamily
                  ._allTransitiveDependencies,
        );

  final int dayOfWeekId;
  final int workoutMenuId;

  @override
  bool operator ==(Object other) {
    return other
            is SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifierProvider &&
        other.dayOfWeekId == dayOfWeekId &&
        other.workoutMenuId == workoutMenuId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dayOfWeekId.hashCode);
    hash = _SystemHash.combine(hash, workoutMenuId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<WorkoutMenuInfo>> runNotifierBuild(
    covariant SpecificPredeterminedWorkoutCertainDayOfWeekStateNotifier
        notifier,
  ) {
    return notifier.build(
      dayOfWeekId,
      workoutMenuId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
