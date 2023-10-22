import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_cubit.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_state.dart';
import 'package:nobitok/business_logic/cubits/tab_cubit.dart';
import 'package:nobitok/presentation/dialog_alerts/success_alert.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/call_customer_widget.dart';
import 'package:nobitok/presentation/widgets/customer_document_number_widget.dart';
import 'package:nobitok/presentation/widgets/customer_name_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../business_logic/cubits/auth_cubit.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../../methods/calculate_time_method.dart';
import '../../methods/custom_jalali_date_picker.dart';
import '../dialog_alerts/error_alert.dart';
import '../dialog_alerts/no_internet_alert.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_topbar.dart';
import '../widgets/padded_divider.dart';
import '../widgets/seperated_list_view_widget.dart';
import '../widgets/set_date_widget.dart';
import '../widgets/set_time_widget.dart';

class PreAppointmentsCustomerInfoBottomSheet extends StatefulWidget {
  const PreAppointmentsCustomerInfoBottomSheet({super.key});

  @override
  State<PreAppointmentsCustomerInfoBottomSheet> createState() =>
      _PreAppointmentsCustomerInfoBottomSheetState();
}

class _PreAppointmentsCustomerInfoBottomSheetState
    extends State<PreAppointmentsCustomerInfoBottomSheet> {
  String date = '';
  String time = '';
  @override
  void initState() {
    time = context
        .read<AppointmentDetailCubit>()
        .getAppointmentDetails()
        .appointmentDetail
        .appointmentTime
        .toString()
        .toPersianDigit();
    date = context
        .read<AppointmentDetailCubit>()
        .getAppointmentDetails()
        .appointmentDetail
        .appointmentDate
        .toPersianDate()
        .toPersianDigit();
    super.initState();
  }

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
                  'تاریخ پیش نوبت : ',
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
                      text: date,
                      onPressed: () async {
                        await updatedSelectedDate();
                      },
                    ),
                    SetTimeWidget(
                      disabled: false,
                      text: time,
                      onPressed: () async {
                        await updatedSelectedTime();
                      },
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

// * buttons:
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 // CustomButton(
//                 //     height: 32,
//                 //     width: 88,
//                 //     fontSize: 12,
//                 //     borderRadius: kBorderRadius8,
//                 //     color: kTextFieldBorderColor,
//                 //     text: 'فاکتور',
//                 //     onPressed: () {}),
//               ],
//             ),
            const Spacer(),
// * bottom divider:
            const PaddedDivider(topPadding: 0, bottomPadding: 16),
// * submit as appointment button:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BlocListener<AppointmentDetailCubit, AppointmentDetailsState>(
                  listener: (context, state) {
                    if (state is AppointmentDetailLoading) {
                      context.loaderOverlay.show();
                    } else if (state is AppointmentDetailSent) {
                      context.loaderOverlay.hide();
                      Navigator.of(context).pop();
                      successAlert(context, 'نوبت با موفقیت ثبت شد');
                    } else if (state is AppointmentDetailEdited) {
                      context.loaderOverlay.hide();
                      Navigator.of(context).pop();
                      successAlert(context, 'نوبت با موفقیت ویرایش شد');
                    } else if (state is AppointmentDetailError) {
                      context.loaderOverlay.hide();
                      if (state.error.contains(kServerException)) {
                        noInternetAlert(context);
                        // print('server exception');
                      } else if (state.error.contains('401')) {
                        context.read<AuthCubit>().refreshToken();
                      } else {
                        errorAlert(context, 'خطا در بارگیری اطلاعات');
                        // print('an exception');
                      }
                    } else {
                      context.loaderOverlay.hide();
                      errorAlert(context, 'خطا');
                    }
                  },
// * submit as appointment button
                  child: CustomButton(
                    height: 40,
                    width: 159,
                    fontSize: 14,
                    borderRadius: kBorderRadius8,
                    color: kGreenColor,
                    text: 'ثبت به عنوان نوبت',
                    onPressed: () async {
                      await appointmentDetails
                          .createAppointmentFromPreAppointment();
                      if (context.mounted) {
                        context.read<TabCubit>().changeTab(kPreAppointmentsKey);
                      }
                    },
                  ),
                ),
// * edit pre-appointment button:
                CustomButton(
                  height: 40,
                  width: 159,
                  fontSize: 14,
                  borderRadius: kBorderRadius8,
                  color: kYellowColor,
                  text: 'تبت تغییرات',
                  onPressed: () async {
                    //TODO
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> updatedSelectedDate() async {
    String newSelectedDate =
        await customJalaliDatePicker(context, 'تاریخ مورد نظر را انتخاب کنید:');
    setState(() {
      date = newSelectedDate;
    });
  }

  Future<void> updatedSelectedTime() async {
    try {
      String newSelectedTime = await showModalBottomSheet(
        context: context,
        builder: (context) => const SetTimeBottomSheet(),
        isScrollControlled: true,
      );
      setState(() {
        time = formatTimeString(newSelectedTime);
      });
    } catch (e) {
      setState(() {
        time = formatTimeString(
            '${DateTime.now().hour.toString()} : ${DateTime.now().minute.toString()}');
      });
    }
  }
}
