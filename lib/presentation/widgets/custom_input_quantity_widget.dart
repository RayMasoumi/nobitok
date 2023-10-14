import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/data/models/service.dart';
import 'package:nobitok/methods/change_quantity_method.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';

import '../../constants/sizes.dart';

class CustomInputQuantityWidget extends StatelessWidget {
  const CustomInputQuantityWidget({
    super.key,
    required this.service,
  });

  final Service service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      height: 40.h,
      width: 124.w,
      decoration: BoxDecoration(
        borderRadius: kBorderRadius12,
        color: Colors.white,
        border: Border.all(color: kDividerColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: const CustomImage(path: 'assets/icons/Add.png'),
            onTap: () {
              changeQuantity(true, service);
            },
          ),
          Expanded(
            child: Text(
              service.serviceQuantity.toString(),
              textAlign: TextAlign.center,
              style: kBold13TextStyle,
            ),
          ),
          GestureDetector(
            child: const CustomImage(path: 'assets/icons/subtract.png'),
            onTap: () {
              changeQuantity(false, service);
            },
          ),
        ],
      ),
    );
  }
}
