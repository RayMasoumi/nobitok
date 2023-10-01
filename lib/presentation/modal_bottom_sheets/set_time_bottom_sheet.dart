import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../widgets/bottom_sheet_top_bar.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/time_input_text_field.dart';

class SetTimeBottomSheet extends StatefulWidget {
  const SetTimeBottomSheet({Key? key}) : super(key: key);

  @override
  State<SetTimeBottomSheet> createState() => _SetTimeBottomSheetState();
}

//@ textField controllers:
TextEditingController hourTextFieldController = TextEditingController();
TextEditingController minuteTextFieldController = TextEditingController();

class _SetTimeBottomSheetState extends State<SetTimeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 264.h,
      width: 375.w,
      child: SizedBox(
        height: 264.h,
        width: 375.w,
        child: CustomBottomSheet(
          halfScreen: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
// * title:
              const BottomSheetTopBar(title: 'ساعت را وارد کنید : '),
              SizedBox(
                height: 23.h,
              ),
// * time field:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
// * hour textField
                  const TimeInputTextField(
                    isMinute: false,
                  ),
                  SizedBox(
                    height: 72.h,
                    width: 24.w,
                    child: Center(
                      child: Text(
                        ':',
                        style: kBigNumberTextStyle.copyWith(fontSize: 57.w),
                      ),
                    ),
                  ),
// * minute textField
                  const TimeInputTextField(
                    isMinute: true,
                  ),
                ],
              ),
// * bottom divider:
              const PaddedDivider(topPadding: 15, bottomPadding: 16),

// * submit button:
              CustomButton(
                height: 46,
                width: 196,
                fontSize: 16,
                borderRadius: kBorderRadius12,
                color: kGreenColor,
                text: 'تایید',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
