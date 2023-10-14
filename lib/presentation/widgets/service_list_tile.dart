import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/data/models/service.dart';

import '../../constants/strings.dart';
import '../../constants/styles.dart';
import 'custom_input_quantity_widget.dart';

class ServicesListTile extends StatelessWidget {
  const ServicesListTile({
    super.key,
    required this.services,
    required this.index,
  });

  final List<Service> services;
  final int index;

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
                      services[index].serviceName!,
                      style: kBold13TextStyle,
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                  ],
                ),
// * service price:
                Row(
                  children: [
                    Text(services[index].servicePrice.toString()),
                    const Text(' $kCurrency'),
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
                      child: Builder(builder: (context) {
                        return Checkbox(
                          value: false,
                          onChanged: (value) {
                            value = !value!;
                          },
                          side: const BorderSide(
                            color: Color(0xff49454F),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                  ],
                ),

// * quantity:
                CustomInputQuantityWidget(
                  service: services[index],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
