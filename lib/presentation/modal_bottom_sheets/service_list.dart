import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/searchbar_widget.dart';
import 'package:nobitok/presentation/widgets/thick_list_tile.dart';

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
              iconPath: 'assets/icons/account_circle.png',
              title: 'اطلاعات مشتری',
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
                listTile: ThickListTile(
// * leading:
                  leading: SizedBox(
                    width: 120.w,
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
// *  trailing:
                  trailing: SizedBox(
                    width: 125.w,
                    height: 69.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),
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
                        const Spacer(),

// * quantity:
                        const CustomInputQuantityWidget(
                          index: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
