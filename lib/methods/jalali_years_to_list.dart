import 'package:persian_datetime_picker/persian_datetime_picker.dart';

List<int> jalaliYearsToList() {
  List<int> years = [];

  for (int i = Jalali.now().year - 100; i < Jalali.now().year + 100; i++) {
    years.add(i);
  }
  return years;
}
