import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/business_logic/cubits/new_document_cubit.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/data/models/customer.dart';
import 'package:nobitok/presentation/dialog_alerts/success_alert.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/medical_form_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/custom_description_text_field.dart';
import 'package:nobitok/presentation/widgets/custom_labeled_text_field.dart';
import 'package:nobitok/presentation/widgets/custom_text_field_for_create_document.dart';

import '../../business_logic/cubits/auth_cubit.dart';
import '../../business_logic/cubits/new_document_state.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../../constants/colors.dart';
import '../../constants/strings.dart';
import '../../constants/styles.dart';
import '../../methods/custom_jalali_date_picker.dart';
import '../dialog_alerts/error_alert.dart';
import '../dialog_alerts/no_internet_alert.dart';
import '../widgets/custom_button.dart';
import '../widgets/padded_divider.dart';

class CreateNewDocumentScreen extends StatefulWidget {
  const CreateNewDocumentScreen({super.key});

  @override
  State<CreateNewDocumentScreen> createState() =>
      _CreateNewDocumentScreenState();
}

class _CreateNewDocumentScreenState extends State<CreateNewDocumentScreen> {
  final nameController = TextEditingController();
  final nationalIdController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthDateController = TextEditingController();

  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
// * icon:
                  Icon(
                    MdiIcons.accountCircle,
                    color: kBlue500Color,
                    size: 24.r,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
// * sheet title:
                  Text(
                    'تشکیل پرونده',
                    style: kTitle15TextStyle,
                  ),
                  const Spacer(),
// * document number
//                   CustomButton(
//                     height: 40.h,
//                     width: 160.w,
//                     fontSize: 13.sp,
//                     borderRadius: BorderRadius.circular(12),
//                     color: kGreenColor,
//                     text: 'شماره پرونده: ۱۲۳۴۵۶۷۸',
//                     onPressed: () {},
//                   ),
                ],
              ),
              PaddedDivider(topPadding: 8.0.h, bottomPadding: 8.0.h),
              CustomTextFieldForCreateDocument(
                label: 'نام و نام خانوادگی',
                hintText: 'نام و نام خانوادگی',
                controller: nameController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomTextFieldForCreateDocument(
                label: 'کد ملی',
                hintText: 'کد ملی',
                controller: nationalIdController,
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomTextFieldForCreateDocument(
                label: 'شماره تلفن',
                hintText: '09123456789',
                controller: phoneNumberController,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(
                height: 18.h,
              ),
// * birth date text field
              GestureDetector(
                onTap: () {
                  updateSelectedDate();
                },
                child: CustomLabeledTextField(
                  icon: Icon(
                    MdiIcons.calendarSearch,
                  ),
                  keyboardType: TextInputType.none,
                  controller: birthDateController,
                  hintText: birthDateController.text,
                  label: 'تاریخ تولد',
                  disabled: true,
                ),
              ),
              PaddedDivider(topPadding: 8.0.h, bottomPadding: 8.0.h),
              Text(
                'توضیحات:',
                style: kBold14TextStyle,
              ),
// * description text field
              CustomDescriptionTextField(
                controller: descriptionController,
              ),
              SizedBox(
                height: 16.h,
              ),
// * blue buttons
              Row(
                children: [
                  CustomButton(
                    height: 40.h,
                    width: 115.w,
                    fontSize: 14.sp,
                    borderRadius: kBorderRadius8,
                    color: kBlue300Color,
                    text: 'فرم پزشکی',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) => const MedicalFormBottomSheet(),
                        isScrollControlled: true,
                      );
                    },
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  // CustomButton(
                  //   height: 40.h,
                  //   width: 115.w,
                  //   fontSize: 14.sp,
                  //   borderRadius: kBorderRadius8,
                  //   color: kBlue300Color,
                  //   text: 'عکس مشتری',
                  //   onPressed: () {},
                  // ),
                ],
              ),
              const Spacer(),
              PaddedDivider(topPadding: 0.0, bottomPadding: 8.0.h),
// * main buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocListener<NewDocumentCubit, NewDocumentState>(
                    listener: (context, state) {
                      if (state is NewDocumentSending) {
                        context.loaderOverlay.show();
                      } else if (state is NewDocumentSent) {
                        context.loaderOverlay.hide();
                        Navigator.of(context).pop();
                        successAlert(context, 'پرونده با موفقیت ایجاد شد');
                        context.read<TabCubit>().changeTab(kDocumentsKey);
                      } else if (state is NewDocumentFailed) {
                        context.loaderOverlay.hide();
                        if (state.error.contains(kServerException)) {
                          noInternetAlert(context);
                          // print('server exception');
                        } else if (state.error.contains('401')) {
                          context.read<AuthCubit>().refreshToken();
                        } else if (state.error.contains('209')) {
                          errorAlert(context,
                              'اطلاعات داده شده معتبر نیستند، دوباره امتحان کنید');
                          nationalIdController.clear();
                          phoneNumberController.clear();
                          // print('auth exception');
                        } else if (state.error.contains('208')) {
                          errorAlert(
                              context, 'یک پرونده با این اطلاعات وجود دارد.');
                          nameController.clear();
                          nationalIdController.clear();
                          phoneNumberController.clear();
                          // print('auth exception');
                        } else {
                          errorAlert(context, 'خطا در بارگذاری اطلاعات');
                        }
                      } else {
                        context.loaderOverlay.hide();
                        errorAlert(context, 'خطا');
                      }
                    },
                    child: CustomButton(
                      height: 48.h,
                      width: 195.w,
                      fontSize: 14,
                      borderRadius: kBorderRadius8,
                      color: kGreenColor,
                      text: 'ثبت پرونده',
                      onPressed: () async {
                        if (nameController.text.isEmpty ||
                            nationalIdController.text.isEmpty ||
                            phoneNumberController.text.isEmpty ||
                            birthDateController.text.isEmpty) {
                          errorAlert(
                              context, 'لطفا اطلاعات خواسته شده را پر کنید');
                        } else {
                          Customer customer = Customer(
                            customerId: 0,
                            customerName: nameController.text,
                            customerPhoneNumber: phoneNumberController.text,
                            customerDateOfBirth: birthDateController.text,
                            customerIdCode: nationalIdController.text,
                            customerDescription: descriptionController.text,
                          );
                          NewDocumentCubit newDocumentCubit =
                              context.read<NewDocumentCubit>();
                          newDocumentCubit.setNewCustomer(customer);
                          await newDocumentCubit.sendInfoToCreate(customer);
                        }
                      },
                    ),
                  ),
                  CustomButton(
                    height: 48.h,
                    width: 115.w,
                    fontSize: 14,
                    borderRadius: kBorderRadius8,
                    color: kRed600Color,
                    text: 'انصراف',
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> updateSelectedDate() async {
    String newSelectedDate =
        await customJalaliDatePicker(context, 'تاریخ تولد را مشخص نمایید :');
    setState(() {
      birthDateController.text = newSelectedDate;
    });
  }
}
