import 'package:flutter/material.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

class SetTimeWidget extends StatelessWidget {
  const SetTimeWidget({
    super.key,
    required this.disabled,
  });
  final bool disabled;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 159,
          height: 40,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: kBorderRadius12,
            ),
          ),
          child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CustomImage(
                    path: 'assets/icons/clock-edit.png',
                    color: disabled ? const Color(0xff838383) : kBlue300,
                  ),
                  Text(
                    '12:00 AM',
                    style: kBold13TextStyle.copyWith(
                        color: const Color(0xff838383)),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
