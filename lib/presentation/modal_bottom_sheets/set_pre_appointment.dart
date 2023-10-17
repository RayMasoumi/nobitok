import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/methods/calculate_date_method.dart';
import 'package:nobitok/methods/calculate_time_method.dart';
import 'package:nobitok/methods/custom_jalali_date_picker.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/call_customer_widget.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/customer_document_number_widget.dart';
import 'package:nobitok/presentation/widgets/customer_name_widget.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:nobitok/presentation/widgets/seperated_list_view_widget.dart';
import 'package:nobitok/presentation/widgets/set_date_widget.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

import '../../business_logic/cubits/appointment_details_cubit.dart';
import '../../constants/styles.dart';
import '../../methods/set_time_initial_value_method.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';
import '../widgets/set_time_widget.dart';

class SetPreAppointmentBottomSheet extends StatefulWidget {
  const SetPreAppointmentBottomSheet({super.key});

  @override
  State<SetPreAppointmentBottomSheet> createState() =>
      _SetPreAppointmentBottomSheetState();
}

class _SetPreAppointmentBottomSheetState
    extends State<SetPreAppointmentBottomSheet> {
  String selectedDate = formatDateJalali(Jalali.now());
  String selectedTime =
      formatTimeString('${DateTime.now().hour}:${DateTime.now().minute}');

  @override
  Widget build(BuildContext context) {
    final appointmentDetails = context.read<AppointmentDetailCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                CustomerNameWidget(
                  name: appointmentDetails
                      .getAppointmentDetails()
                      .customerDetail
                      .customerName,
                ),
                SizedBox(
                  height: 16.h,
                ),

// * file code & number:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
// * phone number card:
                    CallCustomerWidget(
                      phoneNumber: appointmentDetails
                          .getAppointmentDetails()
                          .customerDetail
                          .customerPhoneNumber,
                    ),
// * file code card:
                    CustomerDocumentNumberWidget(
                        docNumber: appointmentDetails
                                .getAppointmentDetails()
                                .customerDetail
                                .customerDocumentCode ??
                            ''),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SetDateWidget(
                      disabled: false,
                      text: selectedDate,
                      onPressed: updateSelectedDate,
                    ),
                    SetTimeWidget(
                      disabled: false,
                      text: selectedTime,
                      onPressed: updateSelectedTime,
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
                SeparatedListViewWidget(
                  appointmentDetail: appointmentDetails.getAppointmentDetails(),
                ),
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
// * bottom divider
            const PaddedDivider(topPadding: 0, bottomPadding: 32),
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

  Future<void> updateSelectedDate() async {
    String newSelectedDate = await customJalaliDatePicker(context);
    setState(() {
      selectedDate = newSelectedDate;
    });
  }

  Future<void> updateSelectedTime() async {
    setTimeInitialValue();
    String newSelectedTime = await showModalBottomSheet(
      context: context,
      builder: (context) => const SetTimeBottomSheet(),
      isScrollControlled: true,
    );
    setState(() {
      selectedTime = formatTimeString(newSelectedTime);
    });
  }
}
