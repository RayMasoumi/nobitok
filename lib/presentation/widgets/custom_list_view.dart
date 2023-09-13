import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.listTile,
  });

  final Widget listTile;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Container(
        height: 88.h,
        width: 335.w,
        margin: EdgeInsets.only(
          left: 6.w,
          right: 6.w,
          bottom: 10.h,
          top: 6.h,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              color: Color(0x1E000000),
              blurRadius: 8,
              offset: Offset(0, 0),
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 11.h, bottom: 8.h),
          child: listTile,
        ),
      );
    });
  }
}
