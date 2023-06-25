
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../global/drawer.dart';
import '../timer/timer.dart';
import '../workout_memo/workout_memo.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(initialLength: 2);

    List<Widget> screens = [
      const WorkoutMemoPage(),
      const TimerPage(),
    ];

    final tab = [
      const Tab( icon: Icon(Icons.edit_note, size: 32,)),
      const Tab( icon: Icon(Icons.watch_later_outlined, size: 32,)),
    ];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Timuscle'),
          bottom: TabBar(
            controller: tabController,
            onTap: (index) {
              tabController.animateTo(index);
            },
            tabs: tab,
          ),
        ),
        drawer: const CommonDrawer(),
        body: TabBarView(
          controller: tabController,
          children: screens,
        ),
      ),
    );
  }
}