import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/models/payment.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/styles.dart';
import 'custom_image_widget.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({
    super.key,
    required this.payments,
    required this.index,
  });

  final List<Payment> payments;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
// * list tile leading:
      leading: SizedBox(
        width: 150.w,
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.person_outlined,
                  size: 24.w,
                ),
                SizedBox(
                  width: 7.w,
                ),
                Text(
                  payments[index].paymentCustomerName,
                  style: kBold14TextStyle,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  payments[index].paymentDate.toPersianDate(),
                  style: kBold12TextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
// * list tile trailing:
      trailing: SizedBox(
        // width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' ${payments[index].paymentAmount} ',
                  style: kBold14TextStyle,
                ),
                Text(
                  kCurrency,
                  style: kBold14TextStyle,
                ),
                SizedBox(
                  width: 7.w,
                ),
                const CustomImage(
                  height: 18,
                  path: 'assets/icons/tag.png',
                  width: 18,
                ),
              ],
            ),
            const Spacer(),
            Text(
              payments[index].paymentType == 1
                  ? 'میزان درآمد نقدی'
                  : 'میزان درآمد از طریق کارت',
              style: kBold14TextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
