import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:text_scroll/text_scroll.dart';

class IncomeAmountWidget extends StatelessWidget {
  const IncomeAmountWidget({
    super.key,
    required this.amount,
    required this.isCash,
  });

  final double amount;
  final bool isCash;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 125.w),
          child: TextScroll(
            isCash ? 'میزان درآمد نقدی' : 'درآمد از طریق کارت',
            style: kCardTextStyle,
            pauseBetween: const Duration(seconds: 10),
            velocity: const Velocity(
              pixelsPerSecond: Offset(10, 0),
            ),
            textDirection: TextDirection.rtl,
            mode: TextScrollMode.endless,
          ),
        ),
        Text(
          '$amount $kCurrency',
          style: kCardTextStyle,
        )
      ],
    );
  }
}
