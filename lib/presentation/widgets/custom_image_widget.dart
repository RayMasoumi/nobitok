import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImage extends StatelessWidget {
  const CustomImage({
    super.key,
    required this.path,
    this.color,
    this.width = 24,
    this.height = 24,
  });

  final String path;
  final Color? color;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height.h,
      width: width.w,
      color: color,
    );
  }
}
