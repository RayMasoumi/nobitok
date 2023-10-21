import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/medical_form_items_widget.dart';
import 'package:nobitok/presentation/widgets/custom_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/custom_topbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../business_logic/cubits/new_document_cubit.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../data/models/document.dart';
import '../widgets/custom_button.dart';

class MedicalFormBottomSheet extends StatefulWidget {
  const MedicalFormBottomSheet({super.key});

  @override
  State<MedicalFormBottomSheet> createState() => _MedicalFormBottomSheetState();
}

class _MedicalFormBottomSheetState extends State<MedicalFormBottomSheet> {
  Document document = Document(documentId: 0, customerId: 0);

  @override
  void initState() {
    document = context.read<NewDocumentCubit>().state.newDocument ??
        Document(documentId: 0, customerId: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBottomSheet(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: [
            const CustomTopBar(
              iconPath: 'assets/icons/account_circle.png',
              title: 'فرم پزشکی',
            ),
            SizedBox(
              height: 8.0.h,
            ),
            Text(
              'در صورت وجود هر یک از موارد زیر خواهشمند است مشخص نمایید',
              style: kBold13TextStyle,
            ),
            PaddedDivider(
              topPadding: 0.0,
              bottomPadding: 0.0.h,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                height: 465.h,
                child: Wrap(
                  direction: Axis.vertical,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    MedicalFormItemsWidget(
                      title: 'مصرف هر نوع دارو :',
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          document.drugConsume = value!;
                        });
                      },
                      isChecked: document.drugConsume,
                    ),
                    MedicalFormItemsWidget(
                      title: 'مصرف سیگار یا الکل :',
                      onChanged: (value) {
                        setState(() {
                          document.smokingOrAlcoholConsumption = value!;
                        });
                      },
                      isChecked: document.smokingOrAlcoholConsumption,
                    ),
                    MedicalFormItemsWidget(
                      title: 'بیماری های تیروئیدی :',
                      onChanged: (value) {
                        setState(() {
                          document.thyroidDisease = value!;
                        });
                      },
                      isChecked: document.thyroidDisease,
                    ),
                    MedicalFormItemsWidget(
                      title: 'حساسیت دارویی :',
                      onChanged: (value) {
                        setState(() {
                          document.medicalAllergy = value!;
                        });
                      },
                      isChecked: document.medicalAllergy,
                    ),
                    MedicalFormItemsWidget(
                      title: 'بیماری قلبی و عروقی :',
                      onChanged: (value) {
                        setState(() {
                          document.cardiovascularDisease = value!;
                        });
                      },
                      isChecked: document.cardiovascularDisease,
                    ),
                    MedicalFormItemsWidget(
                      title: 'فشار خون :',
                      isChecked: document.bloodPressure,
                      onChanged: (value) {
                        setState(() {
                          document.bloodPressure = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.daccutane,
                      title: 'مصرف داکوتان :',
                      onChanged: (value) {
                        setState(() {
                          document.daccutane = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.hiv,
                      title: 'ایدز :',
                      onChanged: (value) {
                        setState(() {
                          document.hiv = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      title: 'بیماری های عصبی :',
                      isChecked: document.neuropsychiatricDiseases,
                      onChanged: (value) {
                        setState(() {
                          document.neuropsychiatricDiseases = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.roaccutane,
                      title: 'مصرف راکوتان :',
                      onChanged: (value) {
                        setState(() {
                          document.roaccutane = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.acutanConsumption,
                      title: 'مصرف آکوتان :',
                      onChanged: (value) {
                        setState(() {
                          document.acutanConsumption = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.breastFeeding,
                      title: 'شیردهی :',
                      onChanged: (value) {
                        setState(() {
                          document.breastFeeding = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.pregnancy,
                      title: 'بارداری :',
                      onChanged: (value) {
                        setState(() {
                          document.pregnancy = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.diabetes,
                      title: 'دیابت :',
                      onChanged: (value) {
                        setState(() {
                          document.diabetes = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.hepatitis,
                      title: 'هپاتیت :',
                      onChanged: (value) {
                        setState(() {
                          document.hepatitis = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.tattoo,
                      title: 'تاتو :',
                      onChanged: (value) {
                        setState(() {
                          document.tattoo = value!;
                        });
                      },
                    ),
                    MedicalFormItemsWidget(
                      isChecked: document.herpes,
                      title: 'تبخال :',
                      onChanged: (value) {
                        setState(() {
                          document.herpes = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            PaddedDivider(topPadding: 0.0, bottomPadding: 8.0.h),
// * buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                  height: 48.h,
                  width: 195.w,
                  fontSize: 14,
                  borderRadius: kBorderRadius8,
                  color: kGreenColor,
                  text: 'ثبت پرونده',
                  onPressed: () async {
                    NewDocumentCubit newDocumentCubit =
                        context.read<NewDocumentCubit>();
                    newDocumentCubit.setNewDocument(document);

                    Navigator.of(context).pop();
                  },
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
            ),
          ],
        ),
      ),
    );
  }
}
