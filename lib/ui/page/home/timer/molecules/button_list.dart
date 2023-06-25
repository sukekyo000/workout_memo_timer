
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../state/timer/timer.dart';

class ButtonList extends ConsumerWidget{
  const ButtonList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final runningState = ref.watch(stopWatchNotifierProvider);

    if(runningState == 0){
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          ref.read(stopWatchNotifierProvider.notifier).updateRunningState();
          ref.read(stopWatchTimeNotifierProvider.notifier).startStopWatch();
        },
        child: const Icon(
          Icons.play_arrow,
          size: 36,
        ),
      );
    } else if (runningState == 1) {
      return FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: (){
          ref.read(stopWatchNotifierProvider.notifier).updatePausedState();
          ref.read(stopWatchTimeNotifierProvider.notifier).stopStopWatch();
        },
        child: const Icon(
          Icons.pause,
          size: 36,
        ),
      );
    } else if (runningState == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: (){
              ref.read(stopWatchNotifierProvider.notifier).updateNotRunningState();
              ref.read(stopWatchTimeNotifierProvider.notifier).resetStopWatch();
            },
            child: const Icon(
              Icons.stop,
              size: 36,
            ),
          ),
          FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: (){
              ref.read(stopWatchNotifierProvider.notifier).updateRunningState();
              ref.read(stopWatchTimeNotifierProvider.notifier).restartStopWatch();
            },
            child: const Icon(
              Icons.play_arrow,
              size: 36,
            ),
          ),
        ],
      );
    }
    return Container();
  }
}