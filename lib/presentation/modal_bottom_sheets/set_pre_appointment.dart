import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/info_card_widget.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/seperated_list_view_widget.dart';
import 'package:nobitok/presentation/widgets/set_date_widget.dart';

import '../../constants/styles.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';

class SetPreAppointmentBottomSheet extends StatelessWidget {
  const SetPreAppointmentBottomSheet({super.key});

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
              iconPath: 'assets/icons/clipboard.png',
              title: 'ثبت پیش نوبت',
            ),
            SizedBox(
              height: 8.h,
            ),
// * enter date and time text:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'برای ثبت پیش نوبت تاریخ و ساعت را مشخص کنید : ',
                  style: kBold13TextStyle,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
// * divider:
            const PaddedDivider(topPadding: 16, bottomPadding: 8),
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
                  'جهت ثبت نوبت تاریخ را وارد کنید : ',
                  style: kBold14TextStyle,
                ),
                SizedBox(
                  height: 8.h,
                ),
// * date and time buttons:
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SetDateWidget(),
                    SetTimeWidget(),
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
// * invoice button:
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                    height: 32,
                    width: 88,
                    fontSize: 12,
                    borderRadius: kBorderRadius8,
                    color: kTextFieldBorderColor,
                    text: 'فاکتور',
                    onPressed: () {}),
              ],
            ),
            const Spacer(),
// * submit button:
            CustomButton(
              height: 40,
              width: 335,
              fontSize: 15,
              borderRadius: kBorderRadius12,
              color: kGreenColor,
              text: 'ثبت پیش نوبت',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class SetTimeWidget extends StatelessWidget {
  const SetTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 159,
          height: 40,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1),
              borderRadius: kBorderRadius12,
            ),
          ),
          child: TextButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CustomImage(path: 'assets/icons/clock-edit.png'),
                  Text(
                    '12:00 AM',
                    style: kBold13TextStyle.copyWith(
                        color: const Color(0xff838383)),
                  ),
                ],
              )),
        )
      ],
    );
  }
}
