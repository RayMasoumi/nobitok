import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:text_scroll/text_scroll.dart';

class MedicalFormItemsWidget extends StatelessWidget {
  const MedicalFormItemsWidget({
    super.key,
    required this.title,
    required this.onChanged,
    required this.isChecked,
  });

  final bool isChecked;

  final String title;
  final Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (kWidth - 3.5.w) / 2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 125.w),
            child: TextScroll(
              title,
              style: kBold13TextStyle,
              pauseBetween: const Duration(seconds: 10),
              velocity: const Velocity(pixelsPerSecond: Offset(10, 0)),
              textDirection: TextDirection.rtl,
              mode: TextScrollMode.endless,
            ),
          ),
          Checkbox(
            value: isChecked,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
