
class ConstWeek {
  static String mondayName = "月";
  static int mondayId = 1;

  static String tuesdayName = "火";
  static int tuesdayId = 2;

  static String wednesdayName = "水";
  static int wednesdayId = 3;

  static String thursdayName = "木";
  static int thursdayId = 4;

  static String fridayName = "金";
  static int fridayId = 5;

  static String saturdayName = "土";
  static int saturdayId = 6;

  static String sundayName = "日";
  static int sundayId = 7;

  Map<int, String> weekMap = {
    ConstWeek.mondayId: ConstWeek.mondayName,
    ConstWeek.tuesdayId: ConstWeek.tuesdayName,
    ConstWeek.wednesdayId: ConstWeek.wednesdayName,
    ConstWeek.thursdayId: ConstWeek.thursdayName,
    ConstWeek.fridayId: ConstWeek.fridayName,
    ConstWeek.saturdayId: ConstWeek.saturdayName,
    ConstWeek.sundayId: ConstWeek.sundayName,
  };
}