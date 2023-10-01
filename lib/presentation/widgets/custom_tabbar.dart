import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/strings.dart';

import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../../constants/styles.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      width: 330.w,
      color: const Color(0xffEBEDFF),
      child: BlocListener<TabCubit, TabState>(
        listener: (context, state) {
          if (state is PreAppointmentTabState) {
// * add pre-appointments to user's appointment list:
            context
                .read<AppointmentsCubit>()
                .addAppointments(kPreAppointmentsKey, state.preAppointments);
          }
        },
        child: TabBar(
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          indicatorColor: const Color(0xff6171FF),
          dividerColor: const Color(0xffEBEDFF),
          labelColor: const Color(0xff49454F),
          unselectedLabelStyle: kMedium12TextStyle,
          labelStyle: kBold12TextStyle,
          onTap: (tab) {
            final tabCubit = context.read<TabCubit>();
            switch (tab) {
              case 0:
                tabCubit.changeTab(kAppointmentsKey);
                break;
              case 1:
                tabCubit.changeTab(kPreAppointmentsKey);
                break;
              // case 2:
              //   tabCubit.changeTab(2);
              //   break;
              default:
            }
          },
          tabs: const [
            Tab(
              text: 'نوبت‌ها',
            ),
            Tab(
              text: 'پیش‌نوبت',
            ),
            Tab(
              text: 'پرونده‌ها',
            ),
          ],
        ),
      ),
    );
  }
}
