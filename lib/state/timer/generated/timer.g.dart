// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../timer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$stopWatchNotifierHash() => r'47dd10d1a365e558a700260d4d3da1db963408e7';

/// 0: not running
/// 1: running
/// 2: paused
///
/// Copied from [StopWatchNotifier].
@ProviderFor(StopWatchNotifier)
final stopWatchNotifierProvider =
NotifierProvider<StopWatchNotifier, int>.internal(
  StopWatchNotifier.new,
  name: r'stopWatchNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopWatchNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StopWatchNotifier = Notifier<int>;
String _$stopWatchTimeNotifierHash() =>
    r'c67b0bf394a92cc4ed113182c22865f8dc18a930';

/// See also [StopWatchTimeNotifier].
@ProviderFor(StopWatchTimeNotifier)
final stopWatchTimeNotifierProvider =
NotifierProvider<StopWatchTimeNotifier, StopWatchTimer>.internal(
  StopWatchTimeNotifier.new,
  name: r'stopWatchTimeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$stopWatchTimeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$StopWatchTimeNotifier = Notifier<StopWatchTimer>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
