import 'package:persian_datetime_picker/persian_datetime_picker.dart';

String formatDateJalali(Jalali date) {
  String year = date.year.toString();
  String month = formatMonthJalali(date.month.toString());
  String day = formatDayJalali(date.day.toString());
  return '$year/$month/$day';
}

String formatDateString(String date) {
  List<String> listOfDate = date.split('/');
  String year = listOfDate[0];
  String month = formatMonthJalali(listOfDate[1]);
  String day = formatDayJalali(listOfDate[2]);
  return '$day $month $year';
}

String formatDayJalali(String day) {
  return day.length == 2 ? day : '0$day';
}

String formatMonthJalali(String month) {
  return month.length == 2 ? month : '0$month';
}

////$$$$$$
// Expanded(
// flex: 4,
// child: OutlinedButton(
// onPressed: () async {
// var pickedDate = await showPersianDatePicker(
// context: context,
// initialDate: Jalali.now(),
// firstDate: Jalali(1402),
// lastDate: Jalali(1420),
// );
// setState(() {
// //to set 0 before 1 digit dates:
//
// //day
// String? day = pickedDate?.day.toString().length == 2
// ? pickedDate?.day.toString()
//     : '0${pickedDate?.day.toString()}';
//
// //month
// String? month = pickedDate?.month.toString().length == 2
// ? pickedDate?.month.toString()
//     : '0${pickedDate?.month.toString()}';
//
// //year
// String? year = pickedDate?.year.toString();
//
// //date
// NewTransactionScreen.date = '$year/$month/$day';
// });
// },
