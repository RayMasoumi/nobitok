import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/strings.dart';
import '../../constants/styles.dart';
import 'custom_input_quantity_widget.dart';

class ServicesListTile extends StatelessWidget {
  const ServicesListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
// * right side of the tile:
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * service name:
                Row(
                  children: [
                    Text(
                      'ترمیم پوست',
                      style: kBold13TextStyle,
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                  ],
                ),
// * service price:
                const Row(
                  children: [
                    Text('100.000'),
                    Text(' $kCurrency'),
                  ],
                ),
              ],
            ),
          ),
// * left side of the tile:
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
// * checkbox:
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 18.h,
                      width: 18.w,
                      child: Checkbox(
                        value: false,
                        onChanged: (value) {},
                        side: const BorderSide(
                          color: Color(0xff49454F),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                  ],
                ),

// * quantity:
                const CustomInputQuantityWidget(
                  index: 5,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
