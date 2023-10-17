import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/data/models/service.dart';

import '../../constants/strings.dart';
import '../../constants/styles.dart';
import 'custom_input_quantity_widget.dart';

class ServicesListTile extends StatefulWidget {
  const ServicesListTile({
    super.key,
    required this.services,
    required this.index,
    required this.checkboxOnChanged,
  });

  final List<Service> services;
  final int index;
  final Function(bool?) checkboxOnChanged;

  @override
  State<ServicesListTile> createState() => _ServicesListTileState();
}

class _ServicesListTileState extends State<ServicesListTile> {
  bool isChecked = false; //TODO change later
  int? quantity;
  List<int> selectedServicesIds = []; //TODO change initial value
  @override
  Widget build(BuildContext context) {
    // * set factor:
    //TODO selectedServicesIds = ??
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
                      widget.services[widget.index].serviceName!,
                      style: kBold13TextStyle,
                      textAlign: TextAlign.start,
                    ),
                    const Spacer(),
                  ],
                ),
// * service price:
                Row(
                  children: [
                    Text(widget.services[widget.index].servicePrice.toString()),
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
                      child: Checkbox(
                        activeColor: kGreenColor,
                        value: isChecked,
                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                          widget.checkboxOnChanged(isChecked);
                        },
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
                CustomInputQuantityWidget(
                  service: widget.services[widget.index],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
