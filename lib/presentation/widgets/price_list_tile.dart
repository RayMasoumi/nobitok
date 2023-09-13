import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles.dart';
import 'custom_image_widget.dart';

class PriceListTile extends StatelessWidget {
  const PriceListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // * leading:
          Text(
            'ترمیم پوست',
            style: kBold13TextStyle,
            // textAlign: TextAlign.start,
          ),
// *  trailing:
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '100000 تومان',
                style: kBold13TextStyle.copyWith(
                  color: const Color(0xff7A7A7A),
                ),
              ),
              SizedBox(
                width: 7.w,
              ),
              const CustomImage(path: 'assets/icons/edit.png'),
            ],
          ),
        ],
      ),
    );
  }
}
