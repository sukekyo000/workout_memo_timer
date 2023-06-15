// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../predetermined_workouts_certain_day_of_week.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PredeterminedWorkoutListSpecificDayOfWeekState
    _$$_PredeterminedWorkoutListSpecificDayOfWeekStateFromJson(
            Map<String, dynamic> json) =>
        _$_PredeterminedWorkoutListSpecificDayOfWeekState(
          dayOfWeekId: json['dayOfWeekId'] as int,
          menuCount: json['menuCount'] as int,
          predeterminedMenuInfoMap:
              (json['predeterminedMenuInfoMap'] as Map<String, dynamic>).map(
            (k, e) => MapEntry(
                int.parse(k),
                (e as List<dynamic>)
                    .map((e) =>
                        WorkoutMenuInfo.fromJson(e as Map<String, dynamic>))
                    .toList()),
          ),
        );

Map<String, dynamic> _$$_PredeterminedWorkoutListSpecificDayOfWeekStateToJson(
        _$_PredeterminedWorkoutListSpecificDayOfWeekState instance) =>
    <String, dynamic>{
      'dayOfWeekId': instance.dayOfWeekId,
      'menuCount': instance.menuCount,
      'predeterminedMenuInfoMap': instance.predeterminedMenuInfoMap
          .map((k, e) => MapEntry(k.toString(), e)),
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$predeterminedWorkoutListSpecificDayOfWeekStateNotifierHash() =>
    r'd5000f9fcd7fd127db6c7c1d4382ed07585239e3';

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

abstract class _$PredeterminedWorkoutListSpecificDayOfWeekStateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<
        PredeterminedWorkoutListSpecificDayOfWeekState> {
  late final int dayOfWeekId;

  Future<PredeterminedWorkoutListSpecificDayOfWeekState> build(
    int dayOfWeekId,
  );
}

/// See also [PredeterminedWorkoutListSpecificDayOfWeekStateNotifier].
@ProviderFor(PredeterminedWorkoutListSpecificDayOfWeekStateNotifier)
const predeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider =
    PredeterminedWorkoutListSpecificDayOfWeekStateNotifierFamily();

/// See also [PredeterminedWorkoutListSpecificDayOfWeekStateNotifier].
class PredeterminedWorkoutListSpecificDayOfWeekStateNotifierFamily
    extends Family<AsyncValue<PredeterminedWorkoutListSpecificDayOfWeekState>> {
  /// See also [PredeterminedWorkoutListSpecificDayOfWeekStateNotifier].
  const PredeterminedWorkoutListSpecificDayOfWeekStateNotifierFamily();

  /// See also [PredeterminedWorkoutListSpecificDayOfWeekStateNotifier].
  PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider call(
    int dayOfWeekId,
  ) {
    return PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(
      dayOfWeekId,
    );
  }

  @override
  PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider
      getProviderOverride(
    covariant PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider
        provider,
  ) {
    return call(
      provider.dayOfWeekId,
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
      r'predeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider';
}

/// See also [PredeterminedWorkoutListSpecificDayOfWeekStateNotifier].
class PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        PredeterminedWorkoutListSpecificDayOfWeekStateNotifier,
        PredeterminedWorkoutListSpecificDayOfWeekState> {
  /// See also [PredeterminedWorkoutListSpecificDayOfWeekStateNotifier].
  PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider(
    this.dayOfWeekId,
  ) : super.internal(
          () => PredeterminedWorkoutListSpecificDayOfWeekStateNotifier()
            ..dayOfWeekId = dayOfWeekId,
          from: predeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider,
          name:
              r'predeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider',
          debugGetCreateSourceHash: const bool.fromEnvironment(
                  'dart.vm.product')
              ? null
              : _$predeterminedWorkoutListSpecificDayOfWeekStateNotifierHash,
          dependencies:
              PredeterminedWorkoutListSpecificDayOfWeekStateNotifierFamily
                  ._dependencies,
          allTransitiveDependencies:
              PredeterminedWorkoutListSpecificDayOfWeekStateNotifierFamily
                  ._allTransitiveDependencies,
        );

  final int dayOfWeekId;

  @override
  bool operator ==(Object other) {
    return other
            is PredeterminedWorkoutListSpecificDayOfWeekStateNotifierProvider &&
        other.dayOfWeekId == dayOfWeekId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dayOfWeekId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<PredeterminedWorkoutListSpecificDayOfWeekState> runNotifierBuild(
    covariant PredeterminedWorkoutListSpecificDayOfWeekStateNotifier notifier,
  ) {
    return notifier.build(
      dayOfWeekId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
