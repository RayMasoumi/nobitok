import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/business_logic/cubits/customer_cubit.dart';
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
          if (state is TabLoadingState) {
            context.loaderOverlay.show();
          } else if (state is TabLoadingCompleteState) {
            context.loaderOverlay.hide();
          }
// * tab data loaded successfully:
          else if (state is PreAppointmentTabState) {
// * store the fetched data
// * add pre-appointments to user's appointment list:
            context
                .read<AppointmentsCubit>()
                .addAppointments(kPreAppointmentsKey, state.preAppointments);
          } else if (state is AppointmentTabState) {
// * store the fetched data
// * add appointments to user's appointment list:
            context
                .read<AppointmentsCubit>()
                .addAppointments(kAppointmentsKey, state.appointments);
          } else if (state is DocumentsTabState) {
            context.read<CustomerCubit>().addCustomers(state.customers);
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
              case 2:
                tabCubit.changeTab(kDocumentsKey);
                break;
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
