
import 'package:flutter/material.dart';

import 'molecules/button_list.dart';
import 'molecules/timer_panel.dart';

class TimerPage extends StatelessWidget{
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(
              child: TimerPanel()
            ),
            Column(
              children: const [
                ButtonList(),
                SizedBox(height: 50,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}