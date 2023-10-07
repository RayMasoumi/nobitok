import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../../data/models/customer.dart';
import 'custom_button.dart';

class DocumentListTile extends StatelessWidget {
  const DocumentListTile(
      {super.key,
      required this.index,
      required this.onDetailsPressed,
      required this.customers});

  final List<Customer> customers;
  final int index;
  final Function() onDetailsPressed;

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
                  customers[index].customerName,
                  style: kBold14TextStyle,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.contacts_outlined,
                  size: 18,
                ),
                SizedBox(
                  width: 9.w,
                ),
                Text(
                  customers[index].customerPhoneNumber,
                  style: kMedium12TextStyle,
                ),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
// * list tile trailing:
      trailing: Column(
        children: [
          const Spacer(),
          CustomButton(
              height: 32,
              width: 83,
              fontSize: 12,
              borderRadius: kBorderRadius13,
              color: const Color(0xff6171FF),
              text: 'جزئیات',
              onPressed: onDetailsPressed),
        ],
      ),
    );
  }
}
