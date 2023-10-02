import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_cubit.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/custom_tabbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/get_appointment_detail_cubit.dart';
import '../../business_logic/cubits/get_appointment_detail_state.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../../constants/styles.dart';
import '../../data/models/appointment.dart';
import '../../methods/set_time_initial_value_method.dart';
import '../modal_bottom_sheets/appointments_customer_info.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/customer_list_tile.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/searchbar_widget.dart';
import '../widgets/time_f_a_b.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
// * floating action button:
        floatingActionButton: BlocBuilder<TabCubit, TabState>(
          builder: (context, state) {
            if (state is DocumentsTabState) {
              return Padding(
                padding: EdgeInsets.only(left: 28.w),
                child: Container(
                  decoration: BoxDecoration(
                    color: kLightGreyColor,
                    borderRadius: BorderRadius.circular(19),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(4.r),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // * first fab
                          TimeFAB(
                            onPressed: () {
                              setTimeInitialValue();
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    const SetTimeBottomSheet(),
                                isScrollControlled: true,
                              );
                            },
                          ),
                          // * second fab
                          SizedBox(
                            width: 200.w,
                            child: FloatingActionButton(
                              backgroundColor: kGreenColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(19),
                              ),
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    MdiIcons.fileDocumentEditOutline,
                                    size: 24.r,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'ایجاد پرونده جدید',
                                    style: kTitle15TextStyle.copyWith(
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
              );
            } else {
              // * we're not on tab document so we only have this fab
              return TimeFAB(
                onPressed: () {
                  setTimeInitialValue();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SetTimeBottomSheet(),
                    isScrollControlled: true,
                  );
                },
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: HorizontalPadding(
          child: Column(
            children: [
              SizedBox(
                height: 8.h,
              ),
// * searchbar:
              const SearchbarWidget(),
// * first divider:
              const PaddedDivider(
                topPadding: 12,
                bottomPadding: 12,
              ), // * end of first divider
// * tab bar:
              const CustomTabBar(),
// * second divider:
              const PaddedDivider(
                topPadding: 12,
                bottomPadding: 12,
              ), // * after divider:
// * Tab content
              Flexible(
                child: TabBarView(
                  children: [
                    // * appointments list view:
                    BlocListener<GetAppointmentDetailCubit,
                        GetAppointmentDetailState>(
                      listener: (context, state) {
                        // * states of fetching appointment details are being handled here
                        if (state is GetAppointmentDetailLoaded) {
                          context.loaderOverlay.hide();
                          context
                              .read<AppointmentDetailCubit>()
                              .setAppointmentDetail(state.appointmentDetail);
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                const AppointmentsCustomerInfoBottomSheet(),
                            isScrollControlled: true,
                          );
                        } else if (state is GetAppointmentDetailLoading) {
                          context.loaderOverlay.show();
                        } else if (state is GetAppointmentDetailError) {
                          context.loaderOverlay.hide();
                          // todo show appropriate alert
                        }
                      },
                      child: Builder(builder: (context) {
                        return CustomListView(
                          tileLeftPadding: 0,
                          tileRightPadding: 0,
                          tileTopPadding: 16,
                          tileBottomPadding: 8,
                          listTileBuilder: (index) {
                            return CustomerListTile(
                              isAppointment: true,
                              isDocument: false,
                              appointments: context
                                  .read<AppointmentsCubit>()
                                  .getAppointments(kAppointmentsKey),
                              index: index,
                              onDetailsPressed: () async {
                                // * creating instances
                                final appointmentDetailCubit =
                                    context.read<GetAppointmentDetailCubit>();
                                final appointmentsList =
                                    context.read<AppointmentsCubit>();
                                // * giving this appointment as a parameter to fetch its data
                                await appointmentDetailCubit
                                    .fetchAppointmentDetail(
                                        appointmentsList.getAppointments(
                                            kAppointmentsKey)[index]);
                              },
                            );
                          },
                          list: context
                              .read<AppointmentsCubit>()
                              .getAppointments(kAppointmentsKey),
                        );
                      }),
                    ),

// *Tab 2 content
                    // * pre-appointments list view:
                    BlocBuilder<AppointmentsCubit,
                        Map<String, List<Appointment>>>(
                      builder: (context, state) {
                        return CustomListView(
                          tileLeftPadding: 0,
                          tileRightPadding: 0,
                          tileTopPadding: 16,
                          tileBottomPadding: 8,
                          listTileBuilder: (index) {
                            return CustomerListTile(
                              isAppointment: false,
                              isDocument: false,
                              appointments: context
                                  .read<AppointmentsCubit>()
                                  .getAppointments(kPreAppointmentsKey),
                              index: index,
                              onDetailsPressed: () {},
                            );
                          },
                          list: context
                              .read<AppointmentsCubit>()
                              .getAppointments(kPreAppointmentsKey),
                        );
                      },
                    ),

// *Tab 3 content
                    // * documents list view:
                    BlocBuilder<AppointmentsCubit,
                        Map<String, List<Appointment>>>(
                      builder: (context, state) {
                        return CustomListView(
                          tileLeftPadding: 0,
                          tileRightPadding: 0,
                          tileTopPadding: 16,
                          tileBottomPadding: 8,
                          listTileBuilder: (index) {
                            return CustomerListTile(
                              isAppointment: false,
                              isDocument: true,
                              appointments: const [],
                              index: index,
                              onDetailsPressed: () {},
                            );
                          },
                          list: const [],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
