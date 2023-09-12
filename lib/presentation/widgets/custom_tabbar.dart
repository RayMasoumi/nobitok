import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/styles.dart';

class CustomTabbar extends StatelessWidget {
  const CustomTabbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40.h,
          width: 330.w,
          color: const Color(0xffEBEDFF),
          child: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 2,
            indicatorColor: const Color(0xff6171FF),
            dividerColor: const Color(0xffEBEDFF),
            labelColor: const Color(0xff49454F),
            unselectedLabelStyle: kMedium12TextStyle,
            labelStyle: kBold12TextStyle,
            tabs: const [
              Tab(
                text: 'نوبت ها',
              ),
              Tab(
                text: 'پیش نوبت',
              ),
              Tab(
                text: 'پرونده ها',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
