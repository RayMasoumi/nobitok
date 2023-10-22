import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/methods/jalali_years_to_list.dart';
import 'package:nobitok/presentation/widgets/custom_button.dart';
import 'package:nobitok/presentation/widgets/dropdown_for_year.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../constants/styles.dart';
import '../../methods/calculate_date_of_index.dart';
import '../../methods/number_to_month.dart';
import '../../methods/today_date_index.dart';
import '../widgets/custom_bottom_sheet.dart';
import '../widgets/padded_divider.dart';

class DatePickerBottomSheet extends StatefulWidget {
  const DatePickerBottomSheet({super.key, required this.title});

  final String title;
  @override
  State<DatePickerBottomSheet> createState() => _DatePickerBottomSheetState();
}

class _DatePickerBottomSheetState extends State<DatePickerBottomSheet> {
  int selectedIndex = 0;
  int selectedYear = Jalali.now().year;
  int selectedMonth = Jalali.now().month;
  List<int> calender = [];
  List<int> years = [];

  Jalali selectedDate = Jalali.now();

  @override
  Widget build(BuildContext context) {
    calender = calculateDateOfIndex(selectedYear, selectedMonth);
    years = jalaliYearsToList();
    if (selectedIndex == 0) {
      selectedIndex = todayDateIndex(calender) + 7;
    }
    return Scaffold(
      body: CustomBottomSheet(
        backgroundColor: Colors.white,
        halfScreen: true,
        isCalendar: true,
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
                      // * days of the calender
                      return InkWell(
                        child: Center(
                          child: Container(
                            height: 50.r,
                            width: 50.r,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? kBlue300Color
                                  : Colors.transparent,
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
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (calender[index - 7] != 0) {
                            setSelectedIndex(index);
                            selectedDate = Jalali(selectedYear, selectedMonth,
                                calender[index - 7]);
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
                  Navigator.of(context).pop(selectedDate);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
