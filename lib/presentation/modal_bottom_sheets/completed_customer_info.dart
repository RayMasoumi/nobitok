import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/presentation/widgets/call_customer_widget.dart';
import 'package:nobitok/presentation/widgets/customer_document_number_widget.dart';
import 'package:nobitok/presentation/widgets/customer_name_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../business_logic/cubits/appointment_details_cubit.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_topbar.dart';
import '../widgets/padded_divider.dart';
import '../widgets/seperated_list_view_widget.dart';
import '../widgets/set_date_widget.dart';
import '../widgets/set_time_widget.dart';

class CompletedCustomerInfoBottomSheet extends StatelessWidget {
  const CompletedCustomerInfoBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final appointmentDetails = context.read<AppointmentDetailCubit>();
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
                      'کد ملی: ${appointmentDetails.getAppointmentDetails().customerDetail.customerIdCode?.toPersianDigit()}',
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
                    CallCustomerWidget(
                        phoneNumber: appointmentDetails
                            .getAppointmentDetails()
                            .customerDetail
                            .customerPhoneNumber),
// * file code card:
                    CustomerDocumentNumberWidget(
                      docNumber: appointmentDetails
                              .getAppointmentDetails()
                              .customerDetail
                              .customerDocumentCode ??
                          '',
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
                      text: appointmentDetails
                          .getAppointmentDetails()
                          .appointmentDetail
                          .appointmentDate
                          .toPersianDate(),
                      onPressed: () {},
                    ),
                    SetTimeWidget(
                      disabled: true,
                      text: appointmentDetails
                              .getAppointmentDetails()
                              .appointmentDetail
                              .appointmentTime ??
                          '00:00',
                      onPressed: () {},
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
                  invoiceItems: appointmentDetails
                      .getAppointmentDetails()
                      .invoiceDetail
                      .invoiceItems,
                ),
              ],
            ),

            const Spacer(),
// * bottom divider:
            const PaddedDivider(topPadding: 0, bottomPadding: 16),
// * submit button:
            CustomButton(
              height: 40,
              width: 335,
              fontSize: 15,
              borderRadius: kBorderRadius12,
              color: const Color(0xff7B88FF),
              text: 'چاپ فاکتور',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
