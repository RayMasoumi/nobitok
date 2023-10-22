import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetVerticalPadding extends StatelessWidget {
  const BottomSheetVerticalPadding({
    super.key,
    required this.child,
    this.isCalendar = false,
  });

  final Widget child;
  final bool isCalendar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        bottom: isCalendar ? 10.h : 22.h,
      ),
      child: child,
    );
  }
}
