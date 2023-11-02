import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/business_logic/cubits/payment_cubit.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_list_view.dart';
import 'package:nobitok/presentation/widgets/payment_list_tile.dart';

import '../../constants/styles.dart';
import '../../methods/custom_jalali_range_picker.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/income_amount_widget.dart';
import '../widgets/padded_divider.dart';
import '../widgets/set_box_budget_f_a_b.dart';
import '../widgets/time_f_a_b.dart';

class BoxScreen extends StatelessWidget {
  const BoxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
// * floating action button:
      floatingActionButton: Container(
        width: 335.w,
        height: 60.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFF4F4F4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(19),
          ),
        ),
        child: Row(
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
            SizedBox(
              width: 17.w,
            ),
            const SetBoxBudgetFAB(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: HorizontalPadding(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'پرداختی ها',
                    style: kBold14TextStyle,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      MdiIcons.arrowLeft,
                      size: 25.r,
                    ),
                  ),
                ],
              ),
            ),
// * first divider:
            const PaddedDivider(
              topPadding: 0,
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
              child: BlocBuilder<PaymentCubit, PaymentState>(
                builder: (context, state) {
                  return CustomListView(
                    onRefresh: () async {},
                    tileLeftPadding: 0,
                    tileRightPadding: 0,
                    tileTopPadding: 16,
                    tileBottomPadding: 8,
                    listTileBuilder: (index) {
                      return PaymentListTile(
                        payments: context.read<PaymentCubit>().getPayments(),
                        index:
                            context.read<PaymentCubit>().getPayments().length -
                                1 -
                                index,
                      );
                    },
                    itemCount:
                        context.read<PaymentCubit>().getPayments().length,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
