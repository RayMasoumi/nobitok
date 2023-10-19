import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nobitok/business_logic/cubits/appointment_details_cubit.dart';
import 'package:nobitok/business_logic/cubits/appointments_state.dart';
import 'package:nobitok/business_logic/cubits/customer_cubit.dart';
import 'package:nobitok/business_logic/cubits/document_details_cubit.dart';
import 'package:nobitok/business_logic/cubits/document_details_state.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/methods/custom_jalali_range_picker.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/document_info.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/pre_appointments_customers_info.dart';
import 'package:nobitok/presentation/widgets/custom_tabbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../business_logic/cubits/appointment_details_state.dart';
import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../../constants/styles.dart';
import '../modal_bottom_sheets/appointments_customer_info.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/customer_list_tile.dart';
import '../widgets/document_list_tile.dart';
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
              return SizedBox(
                width: 200.w,
                child: FloatingActionButton(
                  heroTag: 'AddDocumentFAB',
                  backgroundColor: kGreenColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(19),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(kCreateNewDocumentScreenRoute);
                  },
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
                        style: kTitle15TextStyle.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              // * we're not on tab document so we only have this fab
              return BlocListener<AppointmentsCubit, AppointmentsState>(
                listener: (context, state) {
                  if (state is AppointmentsLoading) {
                    context.loaderOverlay.show();
                  } else if (state is AppointmentsLoadingCompleted) {
                    context.loaderOverlay.hide();
                    // todo show alert
                  } else if (state is AppointmentsLoadingFailed) {
                    context.loaderOverlay.hide();
                    // todo show alert
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
                    if (state is AppointmentTabState) {
                      if (context.mounted) {
                        await context
                            .read<AppointmentsCubit>()
                            .fetchAppointmentsByRange(startDate, endDate);
                      }
                    } else if (state is PreAppointmentTabState) {
                      if (context.mounted) {
                        await context
                            .read<AppointmentsCubit>()
                            .fetchPreAppointmentsByRange(startDate, endDate);
                      }
                    }
                  },
                ),
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
              const SearchbarWidget(
                isHomeScreen: true,
              ),
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
// * Tab 1 content
              Flexible(
                child: TabBarView(
                  children: [
                    // * appointments list view:
                    BlocListener<AppointmentDetailCubit,
                        AppointmentDetailsState>(
                      listener: (context, state) {
// * states of fetching appointment details are being handled here
                        if (state is AppointmentDetailLoaded) {
                          context.loaderOverlay.hide();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                const AppointmentsCustomerInfoBottomSheet(),
                            isScrollControlled: true,
                          );
                        } else if (state is AppointmentDetailLoading) {
                          context.loaderOverlay.show();
                        } else if (state is AppointmentDetailError) {
                          context.loaderOverlay.hide();
                          // todo show appropriate alert
                        }
                      },
                      child: BlocBuilder<TabCubit, TabState>(
                        builder: (context, state) {
                          return BlocBuilder<AppointmentsCubit,
                              AppointmentsState>(
                            builder: (context, state) {
                              return CustomListView(
                                tileLeftPadding: 0,
                                tileRightPadding: 0,
                                tileTopPadding: 16,
                                tileBottomPadding: 8,
                                listTileBuilder: (index) {
                                  return CustomerListTile(
                                    isAppointment: true,
                                    appointments: context
                                        .read<AppointmentsCubit>()
                                        .getAppointments(kAppointmentsKey),
                                    index: index,
                                    onDetailsPressed: () async {
                                      // * creating instances
                                      final appointmentDetailCubit = context
                                          .read<AppointmentDetailCubit>();
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
                                itemCount: context
                                    .read<AppointmentsCubit>()
                                    .getAppointments(kAppointmentsKey)
                                    .length,
                              );
                            },
                          );
                        },
                      ),
                    ),

// *Tab 2 content
                    // * pre-appointments list view:
                    BlocListener<AppointmentDetailCubit,
                        AppointmentDetailsState>(
                      listener: (context, state) {
// * states of fetching pre-appointment details are being handled here
                        if (state is AppointmentDetailLoaded) {
                          context.loaderOverlay.hide();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                const PreAppointmentsCustomerInfoBottomSheet(),
                            isScrollControlled: true,
                          );
                        } else if (state is AppointmentDetailLoading) {
                          context.loaderOverlay.show();
                        } else if (state is AppointmentDetailError) {
                          context.loaderOverlay.hide();
                          // todo show appropriate alert
                        }
                      },
                      child: BlocBuilder<AppointmentsCubit, AppointmentsState>(
                        builder: (context, state) {
                          return BlocBuilder<TabCubit, TabState>(
                            builder: (context, state) {
                              return CustomListView(
                                tileLeftPadding: 0,
                                tileRightPadding: 0,
                                tileTopPadding: 16,
                                tileBottomPadding: 8,
                                listTileBuilder: (index) {
                                  return CustomerListTile(
                                    isAppointment: false,
                                    appointments: context
                                        .read<AppointmentsCubit>()
                                        .getAppointments(kPreAppointmentsKey),
                                    index: index,
                                    onDetailsPressed: () async {
                                      // * creating instances
                                      final appointmentDetailCubit = context
                                          .read<AppointmentDetailCubit>();
                                      final appointmentsList =
                                          context.read<AppointmentsCubit>();
                                      // * giving this appointment as a parameter to fetch its data
                                      await appointmentDetailCubit
                                          .fetchAppointmentDetail(
                                              appointmentsList.getAppointments(
                                                  kPreAppointmentsKey)[index]);
                                    },
                                  );
                                },
                                itemCount: context
                                    .read<AppointmentsCubit>()
                                    .getAppointments(kPreAppointmentsKey)
                                    .length,
                              );
                            },
                          );
                        },
                      ),
                    ),

// *Tab 3 content
                    // * documents list view:
                    BlocListener<DocumentDetailsCubit, DocumentDetailsState>(
                      listener: (context, state) {
// * states of fetching documents details are being handled here
                        if (state is DocumentDetailLoaded) {
                          context.loaderOverlay.hide();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) =>
                                const DocumentInfoBottomSheet(),
                            isScrollControlled: true,
                          );
                        } else if (state is DocumentDetailLoading) {
                          context.loaderOverlay.show();
                        } else if (state is DocumentDetailError) {
                          context.loaderOverlay.hide();
                          // todo show appropriate alert
                        }
                      },
                      child: BlocBuilder<TabCubit, TabState>(
                        builder: (context, state) {
                          return CustomListView(
                            tileLeftPadding: 0,
                            tileRightPadding: 0,
                            tileTopPadding: 16,
                            tileBottomPadding: 8,
                            isDocument: true,
                            listTileBuilder: (index) {
                              return DocumentListTile(
                                index: index,
                                onDetailsPressed: () async {
                                  // * creating instances
                                  final documentDetailCubit =
                                      context.read<DocumentDetailsCubit>();
                                  final customer = context
                                      .read<CustomerCubit>()
                                      .getCustomers()[index];
                                  // * giving the customer its id as a parameter to fetch its data
                                  await documentDetailCubit
                                      .fetchDocumentDetail(customer.customerId);
                                },
                                customers: context
                                    .read<CustomerCubit>()
                                    .getCustomers(),
                              );
                            },
                            itemCount: context
                                    .read<CustomerCubit>()
                                    .getCustomers()
                                    .length +
                                1,
                          );
                        },
                      ),
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
