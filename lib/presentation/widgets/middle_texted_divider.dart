import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class MiddleTextedDivider extends StatelessWidget {
  const MiddleTextedDivider({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        const Expanded(
          child: Divider(
            color: kDividerColor,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Text(
            text,
            style: kGrey12BoldTextStyle,
          ),
        ),
        const Expanded(
          child: Divider(
            color: kDividerColor,
          ),
        ),
      ],
    );
  }
}
