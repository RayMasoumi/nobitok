import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/presentation/widgets/call_customer_widget.dart';
import 'package:nobitok/presentation/widgets/custom_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/customer_document_number_widget.dart';
import 'package:nobitok/presentation/widgets/customer_name_widget.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../widgets/custom_button.dart';
import '../widgets/print_document_widget.dart';

class DocumentInfoBottomSheet extends StatelessWidget {
  const DocumentInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
// * top bar
            const CustomTopBar(
              iconPath: 'assets/icons/account_circle.png',
              title: 'اطلاعات مشتری',
            ),
            const PaddedDivider(topPadding: 0, bottomPadding: 8.0),
// * name
            const CustomerNameWidget(name: 'name'),
            SizedBox(
              height: 16.h,
            ),
// * id and birth info:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'کد ملی: 123456789',
                  style: kLight14TextStyle,
                ),
                Text(
                  'تاریخ تولد: 1111',
                  style: kLight14TextStyle,
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * phone number
                CallCustomerWidget(phoneNumber: '09123456789'),
// * doc number
                CustomerDocumentNumberWidget(docNumber: '12345'),
              ],
            ),
            const PaddedDivider(topPadding: 8.0, bottomPadding: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * details
                Text(
                  'جزئیات:',
                  style: kBold20TextStyle.copyWith(
                    color: Colors.black,
                  ),
                ),
// * print doc
                const PrintDocumentWidget(),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x1E000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(10.0.r),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8.0.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'شماره یک',
                                style: kBold13TextStyle,
                              ),
                              Text(
                                '1401/01/01',
                                style: kBold13TextStyle,
                              ),
                              Text(
                                '700.000 تومان',
                                style: kBold13TextStyle,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0.h,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leadingAndTrailingTextStyle: kBold13TextStyle,
                                leading: const Text(
                                  'ریش',
                                ),
                                trailing: const Text(
                                  '100.000 تومان',
                                ),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                visualDensity:
                                    const VisualDensity(vertical: -4),
                              );
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      endIndent: 8.0.w,
                      indent: 8.0.w,
                    );
                  },
                  itemCount: 3,
                ),
              ),
            ),
            const PaddedDivider(topPadding: 8, bottomPadding: 16),

            CustomButton(
              height: 40,
              width: double.infinity,
              fontSize: 15,
              borderRadius: kBorderRadius12,
              color: kGreenColor,
              text: 'ثبت نوبت',
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
