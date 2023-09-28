import '../presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';

void setTimeInitialValue() {
  hourTextFieldController.text = DateTime.now().hour.toString();
  minuteTextFieldController.text = DateTime.now().minute.toString();
}
