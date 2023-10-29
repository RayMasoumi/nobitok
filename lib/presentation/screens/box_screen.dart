import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/payment_list_tile.dart';

import '../../methods/custom_jalali_range_picker.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/income_amount_widget.dart';
import '../widgets/padded_divider.dart';
import '../widgets/searchbar_widget.dart';
import '../widgets/time_f_a_b.dart';

class BoxScreen extends StatelessWidget {
  const BoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
// * floating action button:
      floatingActionButton: Row(
        children: [
          DateFAB(onPressed: () async {
            String startDate;
            String endDate;
            List<String> dates;
            dates = await customJalaliRangePicker(
                context, 'بازه مورد نظر را انتخاب کنید :');
            startDate = dates[0];
            endDate = dates[1];
            // * apply date search for box
            if (context.mounted) {
              //TODO  await
            }
          }),
          // const AddDocumentFAB(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: HorizontalPadding(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
// * searchbar:
            const SearchbarWidget(
              isHomeScreen: true,
            ),
// * first divider:
            const PaddedDivider(
              topPadding: 12,
              bottomPadding: 12,
            ), // * end of first divider
// * income card:
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              width: 335,
              height: 104,
              decoration: ShapeDecoration(
                color: const Color(0xFFF6F6F6),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 1, color: Color(0xFFDFDFDF)),
                  borderRadius: kBorderRadius12,
                ),
              ),
              child: Column(
                children: [
                  const IncomeAmountWidget(
                    amount: 700000,
                    isCash: true,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  const IncomeAmountWidget(
                    amount: 0,
                    isCash: false,
                  ),
                ],
              ),
            ),

// * second divider:
            const PaddedDivider(
              topPadding: 12,
              bottomPadding: 12,
            ),
            // * after divider:
            Expanded(
              child: CustomListView(
                onRefresh: () async {},
                tileLeftPadding: 0,
                tileRightPadding: 0,
                tileTopPadding: 16,
                tileBottomPadding: 8,
                listTileBuilder: (index) {
                  return PaymentListTile(
                      payments: const [], index: index, isCash: true);
                },
                itemCount: [].length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
