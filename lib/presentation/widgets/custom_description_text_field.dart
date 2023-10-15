import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/strings.dart';

class CustomDescriptionTextField extends StatelessWidget {
  const CustomDescriptionTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius12,
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 7,
            offset: Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.grey,
        textDirection: TextDirection.rtl,
        cursorHeight: 20,
        maxLines: 7,
        style: const TextStyle(
          fontFamily: kIranyekanFont,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(
            10.r,
          ),
          border: InputBorder.none,
          counter: Container(),
          hintText: '',
          hintStyle: TextStyle(
            color: kTextFieldHintColor,
            fontFamily: kIranyekanFont,
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
          ),
          hintMaxLines: 20,
        ),
      ),
    );
  }
}
