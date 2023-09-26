import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/custom_topbar.dart';
import '../widgets/info_card_widget.dart';
import '../widgets/padded_divider.dart';
import '../widgets/seperated_list_view_widget.dart';
import '../widgets/set_date_widget.dart';
import '../widgets/set_time_widget.dart';

class CompletedCustomerInfoBottomSheet extends StatelessWidget {
  const CompletedCustomerInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
// * top bar:
            const CustomTopBar(
              iconPath: 'assets/icons/account_circle.png',
              title: 'اطلاعات مشتری',
            ),

// * divider:
            const PaddedDivider(topPadding: 0, bottomPadding: 8),
// * customer info :
            Column(
              children: [
// * name and last name:
                Row(
                  children: [
                    Text('نام و نام خانوادگی :', style: kBold16TextStyle),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text('رضا کیانی', style: kBold16TextStyle),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
// * id and birth info:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد ملی: 1748596587',
                      style: kLight14TextStyle,
                    ),
                    Text(
                      'تاریخ تولد: 1350/08/10',
                      style: kLight14TextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
// * file code & number:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
// * phone number card:
                    InkWell(
                      onTap: () {
                        //TODO call
                      },
                      child: InfoCardWidget(
                        color: kBlue300,
                        horizontalPadding: 14,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CustomImage(
                              path: 'assets/icons/call.png',
                              height: 16,
                              width: 16,
                            ),
                            Text(
                              '+989125879338',
                              style: kBold13TextStyle.copyWith(
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
// * file code card:
                    InfoCardWidget(
                      horizontalPadding: 14,
                      color: const Color(0xffC8C8C8),
                      child: Center(
                        child: Text(
                          'شماره پرونده : 87554',
                          style: kBold13TextStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
// * divider:
            const PaddedDivider(topPadding: 16, bottomPadding: 8),
// * date and time:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'تکمیل شده در تاریخ : ',
                  style: kBold14TextStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
// * date and time buttons:
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SetDateWidget(
                      disabled: true,
                    ),
                    SetTimeWidget(
                      disabled: true,
                    ),
                  ],
                ),
                const PaddedDivider(topPadding: 16, bottomPadding: 16),
              ],
            ),
            // * invoice list:
            Column(
              children: [
// * title:
                Row(
                  children: [
                    Text(
                      'خدمات دریافتی',
                      style: kBold14TextStyle,
                    ),
                    const Spacer(),
                    Text(
                      'مبلغ',
                      style: kBold14TextStyle,
                    ),
                    SizedBox(
                      width: 44.w,
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
// * listView
                const SeperatedListViewWidget(),
              ],
            ),

            const Spacer(),
// * bottom divider:
            const PaddedDivider(topPadding: 0, bottomPadding: 16),
// * submit button:
            CustomButton(
              height: 40,
              width: 335,
              fontSize: 15,
              borderRadius: kBorderRadius12,
              color: const Color(0xff7B88FF),
              text: 'چاپ فاکتور',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
