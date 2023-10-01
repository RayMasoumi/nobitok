import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/styles.dart';
import '../../data/models/appointment_detail.dart';

class SeparatedListViewWidget extends StatelessWidget {
  const SeparatedListViewWidget({
    super.key,
    required this.appointmentDetail,
  });

  final AppointmentDetail appointmentDetail;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208.h,
      width: 335.w,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leadingAndTrailingTextStyle: kLight13TextStyle,
            leading: Text(appointmentDetail
                    .invoiceDetail.invoiceItems[index].invoiceItemServiceName ??
                'خدمت'),
            trailing: Text(
                '${appointmentDetail.invoiceDetail.invoiceItems[index].invoiceItemPrice.toString().seRagham()} تومان'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: appointmentDetail.invoiceDetail.invoiceItems.length,
      ),
    );
  }
}
