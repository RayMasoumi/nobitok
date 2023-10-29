import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/widgets/custom_icon_widget.dart';

import '../../constants/styles.dart';

class PaymentListTile extends StatelessWidget {
  const PaymentListTile({
    super.key,
    required this.payments,
    required this.index,
    required this.isCash,
  });

  final List<dynamic> payments; //TODO ??
  final int index;
  final bool isCash;

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
                  payments[index].customerName, //TODO
                  style: kBold14TextStyle,
                ),
              ],
            ),
            const Spacer(),
            Text(
              payments[index].appointmentDate.toPersianDate(),
              //TODO
              style: kMedium12TextStyle,
            ),
          ],
        ),
      ),
// * list tile trailing:
      trailing: Column(
        children: [
          const Row(
            children: [
              Text(' 700000'), //TODO
              Text(kCurrency),
              CustomIcon(
                iconPath: 'assets/icons/tag.png',
                iconSize: 18,
              ),
            ],
          ),
          const Spacer(),
          Text(
            isCash ? 'میزان درآمد نقدی' : 'میزان درآمد از طریق کارت',
            style: kBold14TextStyle,
          ),
        ],
      ),
    );
  }
}
