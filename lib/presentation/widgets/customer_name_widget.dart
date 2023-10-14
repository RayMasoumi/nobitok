import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles.dart';

class CustomerNameWidget extends StatelessWidget {
  const CustomerNameWidget({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('نام و نام خانوادگی :', style: kBold16TextStyle),
        SizedBox(
          width: 11.w,
        ),
        Text(
          name,
          style: kBold16TextStyle,
        ),
      ],
    );
  }
}
