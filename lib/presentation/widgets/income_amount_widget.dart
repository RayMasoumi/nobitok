import 'package:flutter/material.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/styles.dart';

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
        Text(
          isCash ? 'میزان درآمد نقدی' : 'درآمد از طریق کارت',
          style: kCardTextStyle,
        ),
        Text(
          '$amount $kCurrency',
          style: kCardTextStyle,
        )
      ],
    );
  }
}
