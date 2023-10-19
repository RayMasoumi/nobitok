import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';
import 'custom_image_widget.dart';
import 'info_card_widget.dart';

class CallCustomerWidget extends StatelessWidget {
  const CallCustomerWidget({
    super.key,
    required this.phoneNumber,
  });

  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //TODO call
      },
      child: InfoCardWidget(
        color: kBlue300Color,
        horizontalPadding: 14,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const CustomImage(
              path: 'assets/icons/call.png',
              height: 16,
              width: 16,
            ),
            Text(
              phoneNumber.toPersianDigit(),
              style: kBold13TextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
