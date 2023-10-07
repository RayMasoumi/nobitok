import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../constants/styles.dart';

class CustomTopBarWPadding extends StatelessWidget {
  const CustomTopBarWPadding({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
// * icon:
            Icon(
              icon,
              color: kBlue500Color,
              size: 24.r,
            ),
            SizedBox(
              width: 8.w,
            ),
// * sheet title:
            Text(
              title,
              style: kTitle15TextStyle,
            ),
            const Spacer(),
            // * back icon:
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
              iconSize: 24.r,
            ),
          ],
        ),
        const PaddedDivider(topPadding: 0, bottomPadding: 8),
      ],
    );
  }
}
