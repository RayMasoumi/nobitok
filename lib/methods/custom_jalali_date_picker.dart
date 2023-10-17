// import 'package:flutter/material.dart';
// import 'package:nobitok/constants/colors.dart';
// import 'package:persian_datetime_picker/persian_datetime_picker.dart';
//
// import 'constants/sizes.dart';
//
// Future<String> customJalaliDatePicker(
//     BuildContext context, String title) async {
//   Jalali? picked = await showPersianDatePicker(
//       context: context,
//       helpText: title,
//       initialDate: Jalali.now(),
//       firstDate: Jalali(1385, 8),
//       lastDate: Jalali(1450, 9),
//       initialEntryMode: PDatePickerEntryMode.calendarOnly,
//       initialDatePickerMode: PDatePickerMode.year,
//       builder: (context, child) {
//         return Theme(
//           data: ThemeData(
//             colorSchemeSeed: kBlue300Color,
//             dialogTheme: DialogTheme(
//               shape: RoundedRectangleBorder(
//                 borderRadius: kBorderRadius15,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       });
//   picked ??= Jalali.now();
//   return picked.toJalaliDateTime();
// }

import 'package:flutter/material.dart';
import 'package:nobitok/methods/calculate_date_method.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/date_picker_bottom_sheet.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

Future<String> customJalaliDatePicker(BuildContext context) async {
  Jalali selectedDate = await showModalBottomSheet(
    context: context,
    builder: (context) => const DatePickerBottomSheet(),
  );
  return formatDateJalali(selectedDate);
}
