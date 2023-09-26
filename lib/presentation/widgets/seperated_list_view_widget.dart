import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles.dart';

class SeperatedListViewWidget extends StatelessWidget {
  const SeperatedListViewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208.h,
      width: 335.w,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            leadingAndTrailingTextStyle: kLight13TextStyle,
            leading: const Text('پاکسازی صورت'),
            trailing: const Text('100000 تومان'),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 0,
          );
        },
        itemCount: 3,
      ),
    );
  }
}
