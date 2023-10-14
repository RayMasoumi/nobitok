import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_cubit.dart';
import 'package:nobitok/methods/get_today_date.dart';
import 'package:nobitok/presentation/widgets/customer_name_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/custom_topbar.dart';
import '../widgets/info_card_widget.dart';
import '../widgets/padded_divider.dart';
import '../widgets/seperated_list_view_widget.dart';
import '../widgets/set_date_widget.dart';
import '../widgets/set_time_widget.dart';

class PreAppointmentsCustomerInfoBottomSheet extends StatelessWidget {
  const PreAppointmentsCustomerInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final AppointmentDetailCubit appointmentDetails =
        context.read<AppointmentDetailCubit>();
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
            const PaddedDivider(topPadding: 0, bottomPadding: 8),
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
// * id and birth info:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'کد ملی: ${appointmentDetails.getAppointmentDetails().customerDetail.customerIdCode}',
                      style: kLight14TextStyle,
                    ),
                    Text(
                      'تاریخ تولد: ${appointmentDetails.getAppointmentDetails().customerDetail.customerDateOfBirth.toPersianDate()}',
                      style: kLight14TextStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 24.h,
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
                        color: kBlue300Color,
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
                              appointmentDetails
                                  .getAppointmentDetails()
                                  .customerDetail
                                  .customerPhoneNumber,
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
                          'شماره پرونده : ${appointmentDetails.getAppointmentDetails().customerDetail.customerDocumentCode}',
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
                  'تکمیل شده در تاریخ : ',
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
                      disabled: true,
                      text: getTodayDate(),
                      onPressed: () {},
                    ),
                    SetTimeWidget(
                      disabled: true,
                      text:
                          ' ${DateTime.now().minute.toString()} : ${DateTime.now().hour.toString()}',
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

// * buttons:
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
// * bottom divider:
            const PaddedDivider(topPadding: 0, bottomPadding: 16),
// * bottom buttons:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * submit appointment button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 14,
                  borderRadius: kBorderRadius8,
                  color: kGreenColor,
                  text: 'ثبت به عنوان نوبت',
                  onPressed: () {},
                ),
// * edit button:
                CustomButton(
                  height: 40,
                  width: 160,
                  fontSize: 14,
                  borderRadius: kBorderRadius8,
                  color: kYellowColor,
                  text: 'ویرایش',
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
