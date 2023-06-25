
import 'package:flutter/material.dart';

import '../../domain/utilities/const/week.dart';

class ConstCalendar {
  final ConstWeek _constWeek = ConstWeek();

  Widget dayOfWeekText(int dayOfWeekId){
    Color? dayOfWeekColor;
    if(dayOfWeekId == 6) dayOfWeekColor = Colors.blue;
    if(dayOfWeekId == 7) dayOfWeekColor = Colors.red;
    return Center(
      child: Text(
        _constWeek.weekMap[dayOfWeekId]!,
        style: TextStyle(color: dayOfWeekColor),
      ),
    );
  }
}