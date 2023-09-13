import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetVerticalPadding extends StatelessWidget {
  const BottomSheetVerticalPadding({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24.h,
        bottom: 22.h,
      ),
      child: child,
    );
  }
}
