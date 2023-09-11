import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.fontSize,
    required this.borderRadius,
    required this.color,
    required this.text,
    required this.onPressed,
  });

  final double height;
  final double width;
  final double fontSize;
  final Function() onPressed;
  final BorderRadius borderRadius;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: kBold20TextStyle.copyWith(fontSize: fontSize),
        ),
      ),
    );
  }
}
