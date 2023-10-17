import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/widgets/custom_image_widget.dart';

import '../../constants/sizes.dart';

class CustomInputQuantityWidget extends StatefulWidget {
  const CustomInputQuantityWidget({
    super.key,
    required this.quantity,
    required this.onQuantityChanged,
  });

  final int quantity;
  final Function(int) onQuantityChanged;

  @override
  State<CustomInputQuantityWidget> createState() =>
      _CustomInputQuantityWidgetState();
}

class _CustomInputQuantityWidgetState extends State<CustomInputQuantityWidget> {
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
              setState(() {
                widget.onQuantityChanged(widget.quantity + 1);
              });
            },
          ),
          Expanded(
            child: Text(
              widget.quantity.toString(),
              textAlign: TextAlign.center,
              style: kBold13TextStyle,
            ),
          ),
          GestureDetector(
            child: const CustomImage(path: 'assets/icons/subtract.png'),
            onTap: () {
              setState(() {
                if (widget.quantity > 0) {
                  widget.onQuantityChanged(widget.quantity - 1);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
