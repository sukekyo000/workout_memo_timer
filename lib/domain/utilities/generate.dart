
import 'const/week.dart';

class GenerateUtilities {
  final ConstWeek _constWeek = ConstWeek();

  /// generate a DateTime object of today
  DateTime generateToday() {
    final now = DateTime.now();
    return DateTime(now.year, now.month, now.day);
  }

  /// generate a DateTime object of specific day
  DateTime generateSpecificDay(int year, int month, int day) {
    return DateTime(year, month, day);
  }

  /// generate today's specific day of week id
  int generateTodayDayOfWeekId() {
    return generateToday().weekday;
  }

  /// generate today's specific day of week name
  String generateTodayDayOfWeekName() {
    return "${_constWeek.weekMap[generateTodayDayOfWeekId()]!}曜日";
  }
}