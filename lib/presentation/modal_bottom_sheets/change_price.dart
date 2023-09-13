import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../constants/styles.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/custom_list_view.dart';

class ChangePriceBottomSheet extends StatelessWidget {
  const ChangePriceBottomSheet({super.key});

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
              iconPath: 'assets/icons/cash.png',
              title: 'اطلاعات مشتری',
            ),
            SizedBox(
              height: 8.h,
            ),
// * enter new price text:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'قیمت جدید دلخواه خود را وارد کنید : ',
                  style: kBold13TextStyle,
                  textAlign: TextAlign.start,
                ),
              ],
            ),
// * divider:
            const PaddedDivider(topPadding: 16, bottomPadding: 16),
// * listView:
            Expanded(
              child: CustomListView(
                height: 58,
                tileLeftPadding: 12,
                tileRightPadding: 12,
                tileTopPadding: 12,
                tileBottomPadding: 12,
                listTile: Card(
                  elevation: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // * leading:
                      Text(
                        'ترمیم پوست',
                        style: kBold13TextStyle,
                        // textAlign: TextAlign.start,
                      ),
// *  trailing:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '100000 تومان',
                            style: kBold13TextStyle.copyWith(
                              color: const Color(0xff7A7A7A),
                            ),
                          ),
                          SizedBox(
                            width: 7.w,
                          ),
                          const CustomImage(path: 'assets/icons/edit.png'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

// * bottom divider:
            const PaddedDivider(topPadding: 4, bottomPadding: 32),
// * bottom buttons:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * submit button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 13,
                  borderRadius: kBorderRadius12,
                  color: kGreenColor,
                  text: 'تایید',
                  onPressed: () {},
                ),
// * change price button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 13,
                  borderRadius: kBorderRadius12,
                  color: kYellowColor,
                  text: 'تغییر قیمت',
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
