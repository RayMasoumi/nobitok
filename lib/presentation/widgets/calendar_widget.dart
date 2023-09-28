import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

class DateRangePickerBottomSheet extends StatefulWidget {
  const DateRangePickerBottomSheet({super.key});

  @override
  DateRangePickerBottomSheetState createState() =>
      DateRangePickerBottomSheetState();
}

class DateRangePickerBottomSheetState
    extends State<DateRangePickerBottomSheet> {
  JalaliRange? selectedDateRange;

  Future<void> _showDateRangePicker(BuildContext context) async {
    final picked = await showPersianDateRangePicker(
      context: context,
      initialEntryMode: PDatePickerEntryMode.calendar,
      initialDateRange: JalaliRange(
        start: Jalali(1400, 1, 2),
        end: Jalali(1400, 1, 10),
      ),
      firstDate: Jalali(1385, 8),
      lastDate: Jalali(1450, 9),
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => _showDateRangePicker(context),
            child: Text('Pick Date Range'),
          ),
          if (selectedDateRange != null)
            Text(
              'Selected Date Range: ${selectedDateRange!.start} - ${selectedDateRange!.end}',
              style: TextStyle(fontSize: 18),
            ),
        ],
      ),
    );
  }
}
