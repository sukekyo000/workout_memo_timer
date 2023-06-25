
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

import '../../../../../state/timer/timer.dart';

class TimerPanel extends ConsumerWidget{
  const TimerPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stopWatchTimerState = ref.watch(stopWatchTimeNotifierProvider);
    return StreamBuilder<int>(
      stream: stopWatchTimerState.rawTime,
      initialData: stopWatchTimerState.rawTime.value,
      builder: (context, snapshot) {
        final displayTime = StopWatchTimer.getDisplayTime(
          snapshot.data!,
          hours: false,
        );
        return Container(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.2),
          width: double.infinity,
          child: Center(
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                displayTime,
                style: const TextStyle(fontSize: 1000),
              ),
            ),
          ),
        );
      },
    );
  }
}