import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/payment_cubit.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/dialog_alerts/error_alert.dart';
import 'package:nobitok/presentation/dialog_alerts/success_alert.dart';
import 'package:nobitok/presentation/widgets/bottom_sheet_top_bar.dart';
import 'package:nobitok/presentation/widgets/custom_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_labeled_text_field.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

class SetBoxCreditBottomSheet extends StatelessWidget {
  SetBoxCreditBottomSheet({super.key});

  TextEditingController creditController = TextEditingController();
  TextEditingController cashController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: CustomBottomSheet(
        halfScreen: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BottomSheetTopBar(
              title: 'میزان موجودی بدست امده صندوق را وارد کنید',
            ),
            PaddedDivider(
              topPadding: 8.0.h,
              bottomPadding: 8.0.h,
            ),
            CustomLabeledTextField(
              keyboardType: TextInputType.number,
              controller: creditController,
              hintText: 'موجودی مورد نظر را وارد کنید',
              label: 'موجودی اعتباری صندوق',
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomLabeledTextField(
              keyboardType: TextInputType.number,
              controller: cashController,
              hintText: 'موجودی مورد نظر را وارد کنید',
              label: 'موجودی نقدی صندوق',
            ),
            PaddedDivider(
              topPadding: 16.0.h,
              bottomPadding: 8.0.h,
            ),
            BlocListener<PaymentCubit, PaymentState>(
              listener: (context, state) {
                if (state is PaymentSending) {
                  context.loaderOverlay.show();
                } else if (state is PaymentSendingCompleted) {
                  context.loaderOverlay.hide();
                  successAlert(context, 'اطلاعات با موفقیت ثبت شد');
                } else if (state is PaymentSendingFailed) {
                  context.loaderOverlay.hide();
                  errorAlert(context, 'خطا در ارسال اطلاعات');
                } else {
                  context.loaderOverlay.hide();
                  errorAlert(context, 'خطا');
                }
              },
              child: CustomButton(
                height: 40.0,
                width: double.infinity,
                fontSize: 14,
                borderRadius: kBorderRadius10,
                color: kGreenColor,
                text: 'تایید',
                onPressed: () async {
                  if (cashController.text.isEmpty &&
                      creditController.text.isEmpty) {
                    errorAlert(context, 'لطفا فیلد‌های خواسته شده را پر کنید');
                  } else {
                    String cash =
                        cashController.text.isEmpty ? '0' : cashController.text;
                    String credit = creditController.text.isEmpty
                        ? '0'
                        : creditController.text;

                    await context
                        .read<PaymentCubit>()
                        .sendEndOfDay(cash, credit);
                    if (context.mounted) {
                      Navigator.of(context).pop();
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
