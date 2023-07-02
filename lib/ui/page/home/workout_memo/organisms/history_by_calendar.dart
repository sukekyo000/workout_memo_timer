
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../domain/utilities/generate.dart';
import '../../../../../state/calendar/calendar.dart';

class HistoryByCalendar extends HookConsumerWidget {
  const HistoryByCalendar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ValueNotifier<DateTime?> selectedDayState = useState(null);
    ValueNotifier<DateTime> focusDayState = useState(DateTime.now());

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: focusDayState.value,
        calendarFormat: CalendarFormat.month,
        sixWeekMonthsEnforced: true,
        rowHeight: 32.5,
        daysOfWeekHeight: 20,
        headerStyle: HeaderStyle(
          titleTextFormatter: (date, locale) => DateFormat('yyyy / MM').format(date),
          leftChevronVisible: false,
          rightChevronVisible: false,
          formatButtonVisible: false,
          titleCentered: true,
        ),
        calendarStyle: const CalendarStyle(
          markersAutoAligned: false,
          cellMargin: EdgeInsets.all(0),
        ),
        selectedDayPredicate: (day) {
          return isSameDay(selectedDayState.value, day);
        },
        calendarBuilders: CalendarBuilders(
          dowBuilder: (context, day) {
            ConstCalendar constCalendar = ConstCalendar();
            return constCalendar.dayOfWeekText(day.weekday);
          },
        ),

        /// 処理系
        onDaySelected: (selectedDay, focusedDay) {
          selectedDayState.value = selectedDay;
          focusDayState.value = focusedDay;
        },
        eventLoader: (day) {
          GenerateUtilities generateUtilities = GenerateUtilities();
          final date = generateUtilities.generateSpecificDay(2023, 7, 5);
          final date2 = generateUtilities.generateSpecificDay(2023, 7, 7);
          if(day.toIso8601String().replaceAll("T", " ").replaceAll("Z", "") == date.toString()) {
            return ['1'];
          }
          if(day.toIso8601String().replaceAll("T", " ").replaceAll("Z", "") == date2.toString()) {
            return ['1'];
          }
          return [];
        },
      ),
    );
  }
}