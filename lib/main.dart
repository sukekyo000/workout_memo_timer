
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workout_memo_timer/ui/router/router.dart';

import 'data/drift.dart';
import 'state/global/drift.dart';

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
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blueGrey,
        brightness: Brightness.light,
      ),
      color: const Color(0xFFF7F6F0),
      routerConfig: router
    );
  }
}

