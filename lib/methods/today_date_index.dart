import 'package:persian_datetime_picker/persian_datetime_picker.dart';

int todayDateIndex(List<int> calender) {
  for (int i = 0; i < calender.length; i++) {
    if (calender[i] == Jalali.now().day) {
      return i;
    }
  }
  return 0;
}
