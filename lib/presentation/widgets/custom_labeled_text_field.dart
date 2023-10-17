import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';
import '../../constants/styles.dart';

class CustomLabeledTextField extends StatelessWidget {
  const CustomLabeledTextField({
    super.key,
    this.isPassword = false,
    required this.keyboardType,
    required this.controller,
    required this.hintText,
    required this.label,
    this.icon,
    this.disabled = false,
  });

  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String hintText;
  final String label;
  final Icon? icon;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h,
      width: 302.w,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          obscureText: isPassword,
          enableSuggestions: false,
          autocorrect: false,
          textDirection: keyboardType == TextInputType.phone
              ? TextDirection.ltr
              : TextDirection.rtl,
          textInputAction: TextInputAction.none,
          enabled: !disabled,
          textAlign: keyboardType == TextInputType.phone
              ? TextAlign.right
              : TextAlign.start,
          style: kTextFieldTextStyle,
          controller: controller,
          cursorColor: Colors.grey,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            suffixIcon: icon,
            suffixIconColor: kBlue400Color,
            floatingLabelStyle: kTextFieldLabelTextStyle,
            labelText: label,
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            labelStyle: kTextFieldLabelTextStyle,
            filled: true,
            fillColor: Colors.white,
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kRed600Color),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: kRed600Color),
            ),
            border: OutlineInputBorder(
              borderRadius: kBorderRadius8,
              borderSide: const BorderSide(color: kTextFieldBorderColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: kBorderRadius8,
              borderSide: const BorderSide(color: kTextFieldBorderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: kBorderRadius8,
              borderSide: const BorderSide(color: kTextFieldBorderColor),
            ),
            hintText: hintText,
            hintStyle: kHintTextStyle,
            contentPadding: EdgeInsets.only(
                bottom: 12.0.h, right: 13.w), // Adjust the bottom padding
          ),
          textAlignVertical: TextAlignVertical.center,
        ),
      ),
    );
  }
}
