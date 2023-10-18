import 'package:persian_number_utility/persian_number_utility.dart';

import '../presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';

void setTimeInitialValue() {
  hourTextFieldController.text =
      DateTime.now().hour.toString().toPersianDigit();
  minuteTextFieldController.text =
      DateTime.now().minute.toString().toPersianDigit();
}

String getTimeInitialValue() {
  String hour = DateTime.now().hour.toString();
  String minute = DateTime.now().minute.toString();
  return '$hour:$minute';
}
