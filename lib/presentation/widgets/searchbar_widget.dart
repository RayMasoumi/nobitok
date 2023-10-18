import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/constants/styles.dart';
import 'package:nobitok/presentation/widgets/custom_icon_widget.dart';

class SearchbarWidget extends StatefulWidget {
  const SearchbarWidget({
    super.key,
  });

  @override
  State<SearchbarWidget> createState() => _SearchbarWidgetState();
}

class _SearchbarWidgetState extends State<SearchbarWidget> {
  final List<String> dropdownItems = [
    'لیست تکمیل شده‌ها',
  ];

  String? dropdownSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 40,
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: const Color(0xFFF6F6F6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 12.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: const Color(0xffC2C8FF),
              radius: 30,
              child: Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.w,
                ),
              ),
            ),
            const CustomIcon(
                iconPath: 'assets/icons/magnifier.png', iconSize: 24),
            // const TextField(
            //   textDirection: TextDirection.rtl,
            //   textAlign: TextAlign.start,
            //   decoration: InputDecoration(
            //       hintText: 'جستجو',
            //       hintStyle: TextStyle(color: Color(0xff5D5D5D))),
            // ),
            const Spacer(),

            InkWell(
              onTap: () async {},
              child: CustomIcon(
                  iconPath: 'assets/icons/bell-outline.png', iconSize: 24.w),
            ),
            SizedBox(
              width: 8.w,
            ),
            DropdownButton2<String>(
              customButton: Icon(
                Icons.menu,
                size: 24.w,
              ),
              items: dropdownItems
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: kBold14TextStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
              value: dropdownSelectedValue,
              onChanged: (value) {
                setState(() {
                  dropdownSelectedValue = value;
                  Navigator.of(context)
                      .pushNamed(kCompletedAppointmentsScreenRoute);
                });
              },
              buttonStyleData: ButtonStyleData(
                width: 5.w,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 160.w,
                elevation: 0,
                decoration: BoxDecoration(
                  borderRadius: kBorderRadius17,
                ),
                offset: Offset(140.w, 15.h),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
                padding: EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
