// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../specific_workout_certain_day.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$specificWorkoutMenuListCertainDayStateNotifierHash() =>
    r'0628c9fbd1b4f4f753d29a525abd4e656c578b6b';

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

abstract class _$SpecificWorkoutMenuListCertainDayStateNotifier
    extends BuildlessAutoDisposeAsyncNotifier<List<WorkoutMenuInfo>> {
  late final DateTime date;
  late final int menuId;

  Future<List<WorkoutMenuInfo>> build(
    DateTime date,
    int menuId,
  );
}

/// See also [SpecificWorkoutMenuListCertainDayStateNotifier].
@ProviderFor(SpecificWorkoutMenuListCertainDayStateNotifier)
const specificWorkoutMenuListCertainDayStateNotifierProvider =
    SpecificWorkoutMenuListCertainDayStateNotifierFamily();

/// See also [SpecificWorkoutMenuListCertainDayStateNotifier].
class SpecificWorkoutMenuListCertainDayStateNotifierFamily
    extends Family<AsyncValue<List<WorkoutMenuInfo>>> {
  /// See also [SpecificWorkoutMenuListCertainDayStateNotifier].
  const SpecificWorkoutMenuListCertainDayStateNotifierFamily();

  /// See also [SpecificWorkoutMenuListCertainDayStateNotifier].
  SpecificWorkoutMenuListCertainDayStateNotifierProvider call(
    DateTime date,
    int menuId,
  ) {
    return SpecificWorkoutMenuListCertainDayStateNotifierProvider(
      date,
      menuId,
    );
  }

  @override
  SpecificWorkoutMenuListCertainDayStateNotifierProvider getProviderOverride(
    covariant SpecificWorkoutMenuListCertainDayStateNotifierProvider provider,
  ) {
    return call(
      provider.date,
      provider.menuId,
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
  String? get name => r'specificWorkoutMenuListCertainDayStateNotifierProvider';
}

/// See also [SpecificWorkoutMenuListCertainDayStateNotifier].
class SpecificWorkoutMenuListCertainDayStateNotifierProvider
    extends AutoDisposeAsyncNotifierProviderImpl<
        SpecificWorkoutMenuListCertainDayStateNotifier, List<WorkoutMenuInfo>> {
  /// See also [SpecificWorkoutMenuListCertainDayStateNotifier].
  SpecificWorkoutMenuListCertainDayStateNotifierProvider(
    this.date,
    this.menuId,
  ) : super.internal(
          () => SpecificWorkoutMenuListCertainDayStateNotifier()
            ..date = date
            ..menuId = menuId,
          from: specificWorkoutMenuListCertainDayStateNotifierProvider,
          name: r'specificWorkoutMenuListCertainDayStateNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$specificWorkoutMenuListCertainDayStateNotifierHash,
          dependencies: SpecificWorkoutMenuListCertainDayStateNotifierFamily
              ._dependencies,
          allTransitiveDependencies:
              SpecificWorkoutMenuListCertainDayStateNotifierFamily
                  ._allTransitiveDependencies,
        );

  final DateTime date;
  final int menuId;

  @override
  bool operator ==(Object other) {
    return other is SpecificWorkoutMenuListCertainDayStateNotifierProvider &&
        other.date == date &&
        other.menuId == menuId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);
    hash = _SystemHash.combine(hash, menuId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<WorkoutMenuInfo>> runNotifierBuild(
    covariant SpecificWorkoutMenuListCertainDayStateNotifier notifier,
  ) {
    return notifier.build(
      date,
      menuId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
