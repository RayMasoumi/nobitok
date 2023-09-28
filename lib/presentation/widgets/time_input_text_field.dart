import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../../methods/check_time_format_method.dart';
import '../modal_bottom_sheets/set_time_bottom_sheet.dart';

class TimeInputTextField extends StatelessWidget {
  const TimeInputTextField({
    super.key,
    required this.isMinute,
  });

  final bool isMinute;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.h,
      width: 120.h,
      child: TextFormField(
        onChanged: (value) {
          checkTimeFormat(value, isMinute);
        },
        style: kBigNumberTextStyle,
        controller:
            isMinute ? minuteTextFieldController : hourTextFieldController,
        enableSuggestions: false,
        autocorrect: false,
        textInputAction: TextInputAction.none,
        enabled: true,
        textAlign: TextAlign.center,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: kBorderRadius8,
            borderSide: const BorderSide(
              color: kTextFieldBorderColor,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: kBorderRadius8,
            borderSide: const BorderSide(color: kTextFieldBorderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: kBorderRadius8,
            borderSide: const BorderSide(color: kBlue200),
          ),

          contentPadding: EdgeInsets.symmetric(
              vertical: 9.h, horizontal: 16.w), // Adjust the bottom padding
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
