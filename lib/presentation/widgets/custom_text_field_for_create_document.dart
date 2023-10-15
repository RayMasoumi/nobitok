import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/presentation/widgets/custom_labeled_text_field.dart';

import '../../constants/colors.dart';

class CustomTextFieldForCreateDocument extends StatelessWidget {
  const CustomTextFieldForCreateDocument({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
  });

  final String label;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomLabeledTextField(
          keyboardType: keyboardType,
          controller: controller,
          hintText: hintText,
          label: label,
        ),
        SizedBox(
          width: 8.w,
        ),
        Icon(
          MdiIcons.circleEditOutline,
          size: 24.r,
          color: kTextFieldBorderColor,
        ),
      ],
    );
  }
}
