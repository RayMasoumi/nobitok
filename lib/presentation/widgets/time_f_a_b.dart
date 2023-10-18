import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_image_widget.dart';

class DateFAB extends StatelessWidget {
  const DateFAB({
    super.key,
    required this.onPressed,
  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'DateFAB',
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      onPressed: onPressed,
      child: CustomImage(
        path: 'assets/icons/calendar-search.png',
        width: 24.w,
        height: 24.h,
      ),
    );
  }
}
