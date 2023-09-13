import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({
    super.key,
    required this.iconPath,
    required this.title,
  });

  final String iconPath;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
// * icon and title:
        Row(
          children: [
// * icon:
            CustomImage(
              path: iconPath,
              width: 24,
              height: 24,
            ),
            SizedBox(
              width: 8.w,
            ),
// * sheet title:
            Text(
              title,
              style: kTitle15TextStyle,
            ),
          ],
        ),
        const Spacer(),
// * close icon:
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const CustomImage(
              path: 'assets/icons/cancel.png', width: 24, height: 24),
        ),
      ],
    );
  }
}
