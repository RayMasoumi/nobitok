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
    required this.alreadySelectedServices,
  });

  final List<Service> services;
  final int index;
  final Function(bool?) checkboxOnChanged;
  final List<Service> alreadySelectedServices;

  @override
  State<ServicesListTile> createState() => _ServicesListTileState();
}

class _ServicesListTileState extends State<ServicesListTile> {
  int quantity = 0; // Initialize quantity to 0

  @override
  Widget build(BuildContext context) {
    // * Calculate the initial quantity based on already selected items
    for (Service service in widget.alreadySelectedServices) {
      if (service.serviceId == widget.services[widget.index].serviceId) {
        quantity = service.serviceQuantity;
      }
    }
    bool isChecked =
        widget.alreadySelectedServices.contains(widget.services[widget.index]);

    return Card(
      elevation: 0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Row(
                  children: [
                    Text(widget.services[widget.index].servicePrice.toString()),
                    const Text(' $kCurrency'),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                            widget.checkboxOnChanged(isChecked);
                          });
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
                CustomInputQuantityWidget(
                  quantity: !isChecked ? 0 : quantity,
                  onQuantityChanged: (int newQuantity) {
                    setState(() {
                      quantity = newQuantity;
                      widget.services[widget.index].serviceQuantity = quantity;

                      print('input quantity widget');
                      print(quantity);
                      print(widget.services[widget.index].serviceQuantity);
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
