import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/searchbar_widget.dart';

import '../../constants/styles.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_input_quantity_widget.dart';

class ServiceBottomSheet extends StatelessWidget {
  const ServiceBottomSheet({super.key});

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
              iconPath: 'assets/icons/services.png',
              title: 'خدمات',
            ),
// * divider:
            const PaddedDivider(topPadding: 8, bottomPadding: 24),
// * search bar:
            const SearchbarWidget(), //TODO change later
// * divider:
            const PaddedDivider(topPadding: 12, bottomPadding: 16),
// * listView:
            Expanded(
              child: CustomListView(
                tileLeftPadding: 4,
                tileRightPadding: 10,
                tileTopPadding: 8,
                tileBottomPadding: 8,
                listTile: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
// * right side:
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
// * service name:
                            Row(
                              children: [
                                Text(
                                  'ترمیم پوست',
                                  style: kBold13TextStyle,
                                  textAlign: TextAlign.start,
                                ),
                                const Spacer(),
                              ],
                            ),
// * service price:
                            const Row(
                              children: [
                                Text('100.000'),
                                Text(' $kCurrency'),
                              ],
                            ),
                          ],
                        ),
                      ),
// * left side:
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
// * checkbox:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 18.h,
                                  width: 18.w,
                                  child: Checkbox(
                                    value: false,
                                    onChanged: (value) {},
                                    side: const BorderSide(
                                      color: Color(0xff49454F),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12.w,
                                ),
                              ],
                            ),

// * quantity:
                            const CustomInputQuantityWidget(
                              index: 5,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
// * bottom divider:
            const PaddedDivider(topPadding: 4, bottomPadding: 16),
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
// * add service button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 13,
                  borderRadius: kBorderRadius12,
                  color: kYellowColor,
                  text: 'افزودن خدمات',
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
