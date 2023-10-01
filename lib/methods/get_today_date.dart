import 'package:persian_datetime_picker/persian_datetime_picker.dart';

String getTodayDate({bool tomorrow = false}) {
  String day = tomorrow
      ? (Jalali.now().day + 1).toString()
      : Jalali.now().day.toString();
  String month = Jalali.now().month.toString();
  String year = Jalali.now().year.toString();

  if (int.parse(day) < 10) {
    day = '0$day';
  }
  if (int.parse(month) < 10) {
    month = '0$month';
  }
  return '$year/$month/$day';
}
