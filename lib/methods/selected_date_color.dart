import 'package:flutter/material.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

Color selectedDateColor(Jalali start, Jalali end, Jalali index,
    List<int> calender, int year, int month) {
  if (index.isAtSameMomentAs(start)) {
    return kBlue300Color;
  } else if (index.isAtSameMomentAs(end)) {
    return kBlue300Color;
  } else if (index.isAfter(start) && index.isBefore(end)) {
    print(index);
    return kBlue300Color.withOpacity(0.5);
  } else {
    return Colors.transparent;
  }
}
