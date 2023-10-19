import '../presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';

void setTimeInitialValue() {
  hourTextFieldController.text = DateTime.now().hour.toString();
  minuteTextFieldController.text = DateTime.now().minute.toString();
}

String getTimeInitialValue() {
  String hour = DateTime.now().hour.toString();
  String minute = DateTime.now().minute.toString();
  return '$hour:$minute';
}
