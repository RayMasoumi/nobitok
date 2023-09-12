import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';

import '../../constants/styles.dart';

class AppointmentListTile extends StatelessWidget {
  const AppointmentListTile({
    super.key,
  });

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
                  'علی کیانی',
                  style: kBold14TextStyle,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 18,
                ),
                SizedBox(
                  width: 9.w,
                ),
                const Text('سنیدبیبمیسمبی'),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
// * list tile trailing:
      trailing: Column(
        children: [
          Text(
            '1402/8/13',
            style: kBold12TextStyle,
          ),
          const Spacer(),
          CustomButton(
              height: 32,
              width: 83,
              fontSize: 12,
              borderRadius: kBorderRadius13,
              color: const Color(0xff6171FF),
              text: 'جزئیات',
              onPressed: () {}),
        ],
      ),
    );
  }
}
