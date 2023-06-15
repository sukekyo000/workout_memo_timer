
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

part 'generated/timer.g.dart';

/// 0: not running
/// 1: running
/// 2: paused
@Riverpod(keepAlive: true)
class StopWatchNotifier extends _$StopWatchNotifier {
  static const notRunningState = 0;
  static const runningState = 1;
  static const pausedState = 2;
  @override
  int build() {
    return notRunningState;
  }
  void updateNotRunningState() {
    state = notRunningState;
  }
  void updateRunningState() {
    state = runningState;
  }
  void updatePausedState() {
    state = pausedState;
  }
}


@Riverpod(keepAlive: true)
class StopWatchTimeNotifier extends _$StopWatchTimeNotifier {
  @override
  StopWatchTimer build() {
    return StopWatchTimer();
  }
  void startStopWatch() {
    state.onStartTimer();
  }
  void restartStopWatch() {
    state.onStartTimer();
  }
  void stopStopWatch() {
    state.onStopTimer();
  }
  void resetStopWatch() {
    state.onResetTimer();
  }
}