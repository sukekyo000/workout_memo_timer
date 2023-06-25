
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../domain/utilities/const/week.dart';

class SettingsWeekListPage extends StatelessWidget {
  const SettingsWeekListPage({super.key});

  @override
  Widget build(BuildContext context) {
    ConstWeek constSettingsDayOfWeek = ConstWeek();

    return Scaffold(
      appBar: AppBar(
        title: const Text('曜日設定'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          for (MapEntry<int, String> weekMapEntry in constSettingsDayOfWeek.weekMap.entries)
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 0.5,
                  ),
                ),
              ),
              child: ListTile(
                title: Text("${weekMapEntry.value}曜日"),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ),
                onTap: () {
                  context.push("/settings/workout_day_of_week", extra: weekMapEntry.key);
                },
              ),
            ),
        ],
      ),
    );
  }
}