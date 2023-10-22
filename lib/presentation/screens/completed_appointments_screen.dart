import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/completed_customer_info.dart';
import 'package:nobitok/presentation/widgets/horizontal_padding.dart';

import '../../business_logic/cubits/appointment_details_cubit.dart';
import '../../business_logic/cubits/appointment_details_state.dart';
import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/appointments_state.dart';
import '../../business_logic/cubits/auth_cubit.dart';
import '../../constants/strings.dart';
import '../../methods/custom_jalali_range_picker.dart';
import '../dialog_alerts/error_alert.dart';
import '../dialog_alerts/no_internet_alert.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/customer_list_tile.dart';
import '../widgets/time_f_a_b.dart';

class CompletedAppointmentsScreen extends StatelessWidget {
  const CompletedAppointmentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocListener<AppointmentsCubit, AppointmentsState>(
        listener: (context, state) {
          if (state is AppointmentsLoading) {
            context.loaderOverlay.show();
          } else if (state is AppointmentsLoadingCompleted) {
            context.loaderOverlay.hide();
          } else if (state is AppointmentsLoadingFailed) {
            context.loaderOverlay.hide();
            if (state.error.contains(kServerException)) {
              noInternetAlert(context);
              // print('server exception');
            } else if (state.error.contains('401')) {
              context.read<AuthCubit>().refreshToken();
            } else {
              errorAlert(context, 'خطا در بارگیری اطلاعات');
              // print('an exception');
            }
          }
        },
        child: DateFAB(
          onPressed: () async {
            // setTimeInitialValue();
            // showModalBottomSheet(
            //   context: context,
            //   builder: (context) => const SetTimeBottomSheet(),
            //   isScrollControlled: true,
            // );
            String startDate;
            String endDate;
            List<String> dates;
            dates = await customJalaliRangePicker(
                context, 'بازه مورد نظر را انتخاب کنید :');
            startDate = dates[0];
            endDate = dates[1];

            if (context.mounted) {
              await context
                  .read<AppointmentsCubit>()
                  .fetchCompletedAppointmentsByRange(startDate, endDate);
            }
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: HorizontalPadding(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
// * searchbar:
//             const SearchbarWidget(),
//             // * first divider:
//             const PaddedDivider(
//               topPadding: 12,
//               bottomPadding: 12,
//             ), // * end of first divider
            // * list view
            Flexible(
              child:
                  BlocListener<AppointmentDetailCubit, AppointmentDetailsState>(
                listener: (context, state) {
// * states of fetching appointment details are being handled here
                  if (state is CompletedAppointmentDetailLoaded) {
                    context.loaderOverlay.hide();
                    showModalBottomSheet(
                      context: context,
                      builder: (context) =>
                          const CompletedCustomerInfoBottomSheet(),
                      isScrollControlled: true,
                    );
                  } else if (state is AppointmentDetailLoading) {
                    context.loaderOverlay.show();
                  } else if (state is AppointmentDetailError) {
                    context.loaderOverlay.hide();
                    if (state.error.contains(kServerException)) {
                      noInternetAlert(context);
                      // print('server exception');
                    } else if (state.error.contains('401')) {
                      context.read<AuthCubit>().refreshToken();
                    } else {
                      errorAlert(context, 'خطا در بارگیری اطلاعات');
                      // print('an exception');
                    }
                  }
                },
                child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
                  builder: (context, state) {
                    return CustomListView(
                      onRefresh: () async {
                        // * store the fetched data
// * add appointments to user's appointment list:
                        await context
                            .read<AppointmentsCubit>()
                            .fetchTodayCompletedAppointments();
                      },
                      tileLeftPadding: 0,
                      tileRightPadding: 0,
                      tileTopPadding: 16,
                      tileBottomPadding: 8,
                      listTileBuilder: (index) {
                        return CustomerListTile(
                          isAppointment: true,
                          appointments: context
                              .read<AppointmentsCubit>()
                              .getAppointments(kCompletedAppointmentsKey),
                          index: index,
                          onDetailsPressed: () async {
                            // * creating instances
                            final appointmentDetailCubit =
                                context.read<AppointmentDetailCubit>();
                            final appointmentsList =
                                context.read<AppointmentsCubit>();
                            // * giving this appointment as a parameter to fetch its data
                            await appointmentDetailCubit
                                .fetchCompletedAppointmentDetail(
                                    appointmentsList.getAppointments(
                                        kCompletedAppointmentsKey)[index]);
                          },
                        );
                      },
                      itemCount: context
                          .read<AppointmentsCubit>()
                          .getAppointments(kCompletedAppointmentsKey)
                          .length,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
