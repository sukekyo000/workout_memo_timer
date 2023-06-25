
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/drift.dart';
import 'state/global/drift.dart';
import 'ui/global/drawer.dart';
import 'ui/page/timer/timer.dart';
import 'ui/page/workout_memo/workout_memo.dart';

Future<void> main() async {

  // drift用
  final database = MyDatabase();

  runApp(
    ProviderScope(
      overrides: [
        myDatabaseProvider.overrideWithValue(database),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      color: const Color(0xFFF7F6F0),
      home: const HomePage(),
    );
  }
}

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TabController tabController = useTabController(initialLength: 2);

    List<Widget> screens = [
      const WorkoutMemo(),
      const Timer(),
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