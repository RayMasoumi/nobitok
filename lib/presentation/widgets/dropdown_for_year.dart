import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class DropdownForYear extends StatelessWidget {
  const DropdownForYear(
      {super.key,
      required this.child,
      required this.years,
      required this.selectedYear,
      required this.onChanged});

  final Widget child;
  final List<int> years;
  final int selectedYear;
  final Function(int?) onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<int>(
        hint: child,
        items: years
            .map((item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        value: selectedYear,
        onChanged: onChanged,
        buttonStyleData: const ButtonStyleData(
          width: 60,
        ),
        dropdownStyleData: const DropdownStyleData(
          maxHeight: 200,
          width: 100,
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
        ),
      ),
    );
  }
}
