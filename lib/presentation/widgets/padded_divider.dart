import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';

class PaddedDivider extends StatelessWidget {
  const PaddedDivider({
    super.key,
    required this.topPadding,
    required this.bottomPadding,
  });

  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding.h,
        bottom: bottomPadding.h,
      ),
      child: const Column(
        children: [
          Divider(
            thickness: 1,
            color: kDividerColor,
          ),
        ],
      ),
    );
  }
}
