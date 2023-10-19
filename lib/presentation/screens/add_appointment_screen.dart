import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/business_logic/cubits/document_details_state.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/methods/cast_invoice_item_to_service.dart';
import 'package:nobitok/methods/custom_jalali_date_picker.dart';
import 'package:nobitok/methods/get_today_date.dart';
import 'package:nobitok/methods/set_time_initial_value_method.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/custom_top_bar_w_padding.dart';
import 'package:nobitok/presentation/widgets/horizontal_padding.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../business_logic/cubits/document_details_cubit.dart';
import '../../business_logic/cubits/service_cubit.dart';
import '../../constants/styles.dart';
import '../../data/models/customer.dart';
import '../../data/models/invoice_item.dart';
import '../../methods/calculate_time_method.dart';
import '../dialog_alerts/success_alert.dart';
import '../modal_bottom_sheets/documents_service_list.dart';
import '../modal_bottom_sheets/set_time_bottom_sheet.dart';
import '../widgets/call_customer_widget.dart';
import '../widgets/customer_document_number_widget.dart';
import '../widgets/customer_name_widget.dart';
import '../widgets/seperated_list_view_widget.dart';
import '../widgets/set_date_widget.dart';
import '../widgets/set_time_widget.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({
    super.key,
  });

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  String date = getTodayDate();
  String time = formatTimeString(getTimeInitialValue());

  // * a list of services:
  List<InvoiceItem> invoiceItems = [];

  @override
  Widget build(BuildContext context) {
    final Customer customerDetail =
        context.read<DocumentDetailsCubit>().getDocumentDetails();
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
              CustomerNameWidget(
                name: customerDetail.customerName,
              ),
              SizedBox(
                height: 16.h,
              ),
// * call and doc number
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
// * phone number card:
                  CallCustomerWidget(
                      phoneNumber: customerDetail.customerPhoneNumber),
// * file code card:
                  CustomerDocumentNumberWidget(
                    docNumber:
                        customerDetail.customerDocumentCode!.toPersianDigit(),
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
                        text: date,
                        onPressed: updateSelectedDate,
                      ),
                      SetTimeWidget(
                        disabled: false,
                        text: time,
                        onPressed: updateSelectedTime,
                      ),
                    ],
                  ),
                  const PaddedDivider(topPadding: 16, bottomPadding: 8),
                ],
              ),
              Center(
                // alignment: invoiceItems.isEmpty
                //     ? Alignment.topRight
                //     : Alignment.center,
                child: invoiceItems.isEmpty
                    ? Text(
                        'جهت ثبت نوبت خدمات را وارد کنید : ',
                        style: kBold14TextStyle,
                      )
                    :
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
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: invoiceItems.isEmpty
                    ? Container(
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
// * empty invoice >> add service button:
                        child: Center(
                          child: CustomButton(
                            height: 40,
                            width: 160,
                            fontSize: 13,
                            borderRadius: kBorderRadius12,
                            color: kBlue300Color,
                            text: 'افزودن خدمت',
                            onPressed: () async {
                              await context
                                  .read<ServiceCubit>()
                                  .fetchServicesFromRepository();
                              if (context.mounted) {
                                invoiceItems = await showModalBottomSheet(
                                      context: context,
                                      builder: (context) =>
                                          DocumentsServiceBottomSheet(),
                                      isScrollControlled: true,
                                    ) ??
                                    [];
                                setState(() {});
                              }
                            },
                          ),
                        ))
                    :
// * invoice is not empty >> show it:
// * invoice list:
                    Column(
                        children: [
// * listView
                          SeparatedListViewWidget(
                            invoiceItems: invoiceItems,
                          ),
                        ],
                      ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Visibility(
                  visible: invoiceItems.isNotEmpty,
                  child: CustomButton(
                    height: 40,
                    width: 160,
                    fontSize: 13,
                    borderRadius: kBorderRadius12,
                    color: kBlue300Color,
                    text: 'افزودن خدمت',
                    onPressed: () async {
                      await context
                          .read<ServiceCubit>()
                          .fetchServicesFromRepository();
                      if (context.mounted) {
                        invoiceItems = await showModalBottomSheet(
                              context: context,
                              builder: (context) => DocumentsServiceBottomSheet(
                                serviceList:
                                    castInvoiceItemToService(invoiceItems),
                              ),
                              isScrollControlled: true,
                            ) ??
                            [];
                        setState(() {});
                      }
                    },
                  ),
                ),
              ),
              const PaddedDivider(topPadding: 8, bottomPadding: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocListener<DocumentDetailsCubit, DocumentDetailsState>(
                    listener: (context, state) {
                      if (state is DocumentDetailLoading) {
                        context.loaderOverlay.show();
                      }
                      if (state is DocumentDetailAppointmentAdded) {
                        context.loaderOverlay.hide();
                        Navigator.pop(context);
                        Navigator.pop(context);
                        successAlert(context, 'نوبت با موفقیت ثبت شد.');
                      } else if (state is DocumentDetailError) {
                        context.loaderOverlay.hide();
                        //TODO errorAlert();
                      }
                    },
                    child: CustomButton(
                        height: 50,
                        width: 203,
                        fontSize: 14,
                        borderRadius: kBorderRadius8,
                        color: kGreenColor,
                        text: 'تایید نوبت',
                        onPressed: () async {
                          await context
                              .read<DocumentDetailsCubit>()
                              .addNewAppointment(time, date,
                                  customerDetail.customerId, invoiceItems);
                        }),
                  ),
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

  Future<void> updateSelectedDate() async {
    String newSelectedDate =
        await customJalaliDatePicker(context, 'تاریخ مورد نظر را انتخاب کنید:');
    setState(() {
      date = newSelectedDate;
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
      time = formatTimeString(newSelectedTime);
    });
  }
}
