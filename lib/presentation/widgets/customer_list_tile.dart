import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/data/models/appointment.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import 'custom_button.dart';

class CustomerListTile extends StatelessWidget {
  const CustomerListTile({
    super.key,
    required this.isAppointment,
    required this.appointments,
    required this.index,
    required this.onDetailsPressed,
  });

  final bool isAppointment;
  final List<Appointment> appointments;
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
                  appointments[index].customerName,
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
                        'ساعت: ${appointments[index].appointmentTime?.toPersianDigit()}',
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
                        appointments[index].appointmentCustomerPhoneNumber!,
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
          Text(
            appointments[index].appointmentDate.toPersianDate(),
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
              onPressed: onDetailsPressed),
        ],
      ),
    );
  }
}
