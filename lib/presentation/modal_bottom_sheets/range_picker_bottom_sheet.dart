import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/methods/calculate_date_method.dart';
import 'package:nobitok/methods/jalali_years_to_list.dart';
import 'package:nobitok/methods/selected_date_color.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/dropdown_for_year.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/styles.dart';
import '../../methods/calculate_date_of_index.dart';
import '../../methods/number_to_month.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/padded_divider.dart';

class RangePickerBottomSheet extends StatefulWidget {
  const RangePickerBottomSheet({super.key, required this.title});

  final String title;
  @override
  State<RangePickerBottomSheet> createState() => _RangePickerBottomSheetState();
}

class _RangePickerBottomSheetState extends State<RangePickerBottomSheet> {
  // int selectedStartIndex = 0;
  // int selectedEndIndex = 0;
  int selectedYear = Jalali.now().year;
  int selectedMonth = Jalali.now().month;
  List<int> calender = [];
  List<int> years = [];

  Jalali selectedStartDate = Jalali.now();
  Jalali selectedEndDate = Jalali.now();

  @override
  Widget build(BuildContext context) {
    calender = calculateDateOfIndex(selectedYear, selectedMonth);
    years = jalaliYearsToList();
    if (selectedStartDate.isAfter(selectedEndDate)) {
      Jalali temp = selectedStartDate;
      selectedStartDate = selectedEndDate;
      selectedEndDate = temp;
    }
    return Scaffold(
      body: CustomBottomSheet(
        isCalendar: true,
        backgroundColor: Colors.white,
        halfScreen: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: kBold14TextStyle,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.cancel_outlined,
                      size: 24.r,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              PaddedDivider(
                topPadding: 0.0,
                bottomPadding: 8.0.h,
              ),
              Row(
                // * plus 1 year
                children: [
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: selectedYear < Jalali.now().year + 99,
                    child: IconButton(
                      onPressed: () {
                        if (selectedYear < Jalali.now().year + 99) {
                          setState(() {
                            selectedYear++;
                          });
                        }
                      },
                      icon: const Icon(Icons.navigate_before),
                    ),
                  ),
                  // * year
                  DropdownForYear(
                    years: years,
                    selectedYear: selectedYear,
                    onChanged: (value) {
                      setState(() {
                        selectedYear = value ?? Jalali.now().year;
                      });
                    },
                    child: Text(
                      selectedYear.toString().toPersianDigit(),
                      style: kBold13TextStyle,
                    ),
                  ),
                  // * minus 1 year
                  Visibility(
                    maintainState: true,
                    maintainSize: true,
                    maintainAnimation: true,
                    visible: selectedYear > Jalali.now().year - 100,
                    child: IconButton(
                      onPressed: () {
                        if (selectedYear > Jalali.now().year - 100) {
                          setState(() {
                            selectedYear--;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                      ),
                    ),
                  ),
                  const Spacer(),
                  // * plus 1 month
                  Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    visible: selectedMonth < 12,
                    child: IconButton(
                      onPressed: () {
                        if (selectedMonth < 12) {
                          setState(() {
                            selectedMonth++;
                          });
                        }
                      },
                      icon: const Icon(Icons.navigate_before),
                    ),
                  ),
                  // * month
                  Text(
                    numberToMonth(selectedMonth),
                    style: kBold13TextStyle,
                  ),
                  // * minus 1 month
                  Visibility(
                    maintainState: true,
                    maintainAnimation: true,
                    maintainSize: true,
                    visible: selectedMonth > 1,
                    child: IconButton(
                      onPressed: () {
                        if (selectedMonth > 1) {
                          setState(() {
                            selectedMonth--;
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.navigate_next,
                      ),
                    ),
                  )
                ],
              ),
              // * calender
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1,
                  crossAxisCount: 7,
                  crossAxisSpacing: 20,
                ),
                itemCount: 49,
                itemBuilder: (context, index) {
                  Jalali indexDate = Jalali(1300, 1, 1);
                  // * first row to show days of the week
                  switch (index) {
                    case 0:
                      return Center(
                        child: Text(
                          'ش',
                          style: kBold16TextStyle,
                        ),
                      );
                    case 1:
                      return Center(
                        child: Text(
                          'ی',
                          style: kBold16TextStyle,
                        ),
                      );
                    case 2:
                      return Center(
                        child: Text(
                          'د',
                          style: kBold16TextStyle,
                        ),
                      );
                    case 3:
                      return Center(
                        child: Text(
                          'س',
                          style: kBold16TextStyle,
                        ),
                      );
                    case 4:
                      return Center(
                        child: Text(
                          'چ',
                          style: kBold16TextStyle,
                        ),
                      );
                    case 5:
                      return Center(
                        child: Text(
                          'پ',
                          style: kBold16TextStyle,
                        ),
                      );
                    case 6:
                      return Center(
                        child: Text(
                          'ج',
                          style: kBold16TextStyle,
                        ),
                      );
                    default:
                      if ((calender[index - 7] == 0)) {
                        indexDate = Jalali(1300, 1, 1);
                      } else {
                        indexDate = Jalali(
                            selectedYear, selectedMonth, calender[index - 7]);
                      }
                      // * days of the calender
                      return InkWell(
                        child: Center(
                          child: Container(
                            height: 50.r,
                            width: 50.r,
                            decoration: BoxDecoration(
                              color: selectedDateColor(
                                  selectedStartDate,
                                  selectedEndDate,
                                  indexDate,
                                  calender,
                                  selectedYear,
                                  selectedMonth),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                calender[index - 7] == 0
                                    ? ''
                                    : calender[index - 7]
                                        .toString()
                                        .toPersianDigit(),
                                style: kBold16TextStyle.copyWith(
                                  color: (indexDate.isAtSameMomentAs(
                                              selectedStartDate)) ||
                                          (indexDate.isAtSameMomentAs(
                                              selectedEndDate))
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (calender[index - 7] != 0) {
                            setSelectedDate(indexDate);
                            selectedStartDate = Jalali(selectedYear,
                                selectedMonth, calender[index - 7]);
                          }
                        },
                      );
                  }
                },
              ),
              PaddedDivider(topPadding: 0.0, bottomPadding: 8.0.h),
              CustomButton(
                height: 40.h,
                width: 107.w,
                fontSize: 14,
                borderRadius: kBorderRadius15,
                color: kGreenColor,
                text: 'تأیید',
                onPressed: () {
                  Navigator.of(context).pop(<String>[
                    formatDateJalali(selectedStartDate),
                    formatDateJalali(selectedEndDate)
                  ]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedDate(Jalali indexDate) {
    // * checks if selected is after start to make it start or end
    if (indexDate.isAfter(selectedStartDate)) {
      setState(() {
        selectedStartDate = indexDate;
      });
    } else {
      setState(() {
        selectedEndDate = selectedStartDate;
        selectedStartDate = indexDate;
      });
    }
  }
}
