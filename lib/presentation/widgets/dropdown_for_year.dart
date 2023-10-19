import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class DropdownForYear extends StatelessWidget {
  const DropdownForYear({
    super.key,
    required this.child,
    required this.years,
    required this.selectedYear,
    required this.onChanged,
  });

  final Widget child;
  final List<int> years;
  final int selectedYear;
  final Function(int?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        hint: child,
        items: years
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.toString().toPersianDigit(),
                    style: kBold14TextStyle,
                  ),
                ))
            .toList(),
        value: selectedYear,
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          width: 60.w,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200.h,
          width: 100.w,
        ),
        menuItemStyleData: MenuItemStyleData(
          height: 40.h,
        ),
      ),
    );
  }
}
