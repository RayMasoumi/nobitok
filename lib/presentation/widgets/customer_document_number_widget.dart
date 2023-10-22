import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/styles.dart';
import 'info_card_widget.dart';

class CustomerDocumentNumberWidget extends StatelessWidget {
  const CustomerDocumentNumberWidget({
    super.key,
    required this.docNumber,
  });

  final String docNumber;
  @override
  Widget build(BuildContext context) {
    return InfoCardWidget(
      width: 170,
      horizontalPadding: 14,
      color: const Color(0xffC8C8C8),
      child: Center(
        child: Text(
          'شماره پرونده : ${docNumber.toPersianDigit()}',
          style: kBold13TextStyle.copyWith(color: Colors.white, fontSize: 12.w),
        ),
      ),
    );
  }
}
