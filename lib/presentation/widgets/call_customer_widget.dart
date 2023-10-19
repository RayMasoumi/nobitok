import 'package:flutter/material.dart';
import 'package:nobitok/presentation/dialog_alerts/error_alert.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:url_launcher/url_launcher.dart';

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
      onTap: () async {
        try {
          final Uri launchUri = Uri(
            scheme: 'tel',
            path: phoneNumber,
          );
          await launchUrl(launchUri);
        } catch (e) {
          errorAlert(context, 'خطا در تماس با شماره مورد نظر');
        }
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
