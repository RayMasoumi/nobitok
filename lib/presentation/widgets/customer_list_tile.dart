import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import 'custom_button.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({
    super.key,
    required this.isAppointment,
    required this.isDocument,
  });

  final bool isAppointment;
  final bool isDocument;

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
            // * is Appointment:
            isAppointment
                ? Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        size: 18,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        'سنیدبیبمیسمبی',
                        style: kMedium12TextStyle,
                      ),
                      const Spacer(),
                    ],
                  )
                // * is preAppointment:
                : Row(
                    children: [
                      const Icon(
                        Icons.contacts_outlined,
                        size: 18,
                      ),
                      SizedBox(
                        width: 9.w,
                      ),
                      Text(
                        '0916455145656',
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
          Visibility(
            visible: !isDocument,
            child: Text(
              '1402/8/13',
              style: kBold12TextStyle,
            ),
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
