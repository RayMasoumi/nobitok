import '../presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';

void checkTimeFormat(String value, bool isMinute) {
  if (value.isNotEmpty) {
    if (!isMinute && int.parse(value) >= 24) {
      print('wrong hour input');
      hourTextFieldController.text = 23.toString();
    } else if (isMinute && int.parse(value) >= 60) {
      print('wrong minute input');
      minuteTextFieldController.text = 59.toString();
    }
  }
}
