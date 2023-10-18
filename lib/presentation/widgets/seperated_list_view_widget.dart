import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/styles.dart';
import '../../data/models/invoice_item.dart';

class SeparatedListViewWidget extends StatelessWidget {
  const SeparatedListViewWidget({
    super.key,
    required this.invoiceItems,
  });

  final List<InvoiceItem> invoiceItems;
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
            leading: Text(invoiceItems[index].invoiceItemServiceName ?? 'خدمت'),
            trailing: Text(
                '${invoiceItems[index].invoiceItemPrice.toString().seRagham().toPersianDigit()} تومان'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: invoiceItems.length,
      ),
    );
  }
}
