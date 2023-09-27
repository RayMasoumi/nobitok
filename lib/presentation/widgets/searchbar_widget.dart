import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/presentation/widgets/custom_icon_widget.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({
    super.key,
  });

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
            CustomIcon(
                iconPath: 'assets/icons/bell-outline.png', iconSize: 24.w),
            SizedBox(
              width: 8.w,
            ),
            Icon(
              Icons.menu,
              size: 24.w,
            ),
          ],
        ),
      ),
    );
  }
}
