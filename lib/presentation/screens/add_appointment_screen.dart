import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_top_bar_w_padding.dart';
import 'package:nobitok/presentation/widgets/horizontal_padding.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../constants/styles.dart';
import '../widgets/call_customer_widget.dart';
import '../widgets/customer_document_number_widget.dart';
import '../widgets/customer_name_widget.dart';
import '../widgets/set_date_widget.dart';
import '../widgets/set_time_widget.dart';

class AddAppointmentScreen extends StatelessWidget {
  const AddAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: HorizontalPadding(
          child: Column(
            children: [
// * top bar
              CustomTopBarWPadding(
                icon: MdiIcons.clipboardTextPlayOutline,
                title: 'ثبت نوبت',
              ),
              const CustomerNameWidget(
                name: 'رضا کیانی',
              ),
              SizedBox(
                height: 16.h,
              ),
// * call and doc number
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
// * phone number card:
                  CallCustomerWidget(phoneNumber: '+989125879338'),
// * file code card:
                  CustomerDocumentNumberWidget(
                    docNumber: '87554',
                  ),
                ],
              ),
              const PaddedDivider(topPadding: 16, bottomPadding: 8),
// * date and time
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SetDateWidget(
                        disabled: false,
                        text: 'date',
                        onPressed: () async {
                          // showModalBottomSheet(
                          //   context: context,
                          //   builder: (context) => const SetDateBottomSheet(),
                          //   isScrollControlled: true,
                          // );
                        },
                        // todo,
                      ),
                      SetTimeWidget(
                        disabled: false,
                        text: 'time', onPressed: () {},
                        // todo
                      ),
                    ],
                  ),
                  const PaddedDivider(topPadding: 16, bottomPadding: 8),
                ],
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  'جهت ثبت نوبت خدمات را وارد کنید : ',
                  style: kBold14TextStyle,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  // todo ternary if a list is not empty then listview instead of button
                  child: Center(
                    child: CustomButton(
                      height: 40,
                      width: 160,
                      fontSize: 13,
                      borderRadius: kBorderRadius12,
                      color: kBlue300Color,
                      text: 'افزودن خدمت',
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              const PaddedDivider(topPadding: 8, bottomPadding: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                      height: 50,
                      width: 203,
                      fontSize: 14,
                      borderRadius: kBorderRadius8,
                      color: kGreenColor,
                      text: 'ثبت نوبت',
                      onPressed: () {
//todo
                      }),
                  CustomButton(
                      height: 50,
                      width: 120,
                      fontSize: 14,
                      borderRadius: kBorderRadius8,
                      color: kRed600Color,
                      text: 'انصراف',
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
              SizedBox(
                height: 8.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
