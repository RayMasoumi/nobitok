import 'package:persian_datetime_picker/persian_datetime_picker.dart';

String formatTimeJalali(Jalali time) {
  return '${formatHourJalali(time.hour.toString())}:${formatMinuteJalali(time.minute.toString())}';
}

String formatTimeString(String time) {
  List<String> listOfTime = time.split(':');
  return '${formatHourJalali(listOfTime[0])}:${formatMinuteJalali(listOfTime[1])}';
}

String formatHourJalali(String hour) {
  return hour.length == 2 ? hour : '0$hour';
}

String formatMinuteJalali(String minute) {
  return minute.length == 2 ? minute : '0$minute';
}
