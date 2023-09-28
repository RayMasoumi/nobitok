import 'package:flutter/material.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';

class BottomSheetTopBar extends StatelessWidget {
  const BottomSheetTopBar({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// * icon and title:
          Text(
            title,
            style: kTitle15TextStyle,
          ),
// * close icon:
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const CustomImage(
                path: 'assets/icons/cancel.png', width: 24, height: 24),
          ),
        ],
      ),
    );
  }
}
