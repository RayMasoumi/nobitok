import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.iconPath,
    this.iconColor,
    required this.iconSize,
  });

  final String iconPath;
  final Color? iconColor;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return ImageIcon(
      AssetImage(iconPath),
      color: iconColor,
      size: iconSize.w,
    );
  }
}
