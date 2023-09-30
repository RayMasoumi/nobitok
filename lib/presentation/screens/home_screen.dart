import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/colors.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/presentation/modal_bottom_sheets/set_time_bottom_sheet.dart';
import 'package:nobitok/presentation/widgets/custom_tabbar.dart';
import 'package:nobitok/presentation/widgets/padded_divider.dart';

import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../../constants/enums/tab_state.dart';
import '../../methods/set_time_initial_value_method.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/customer_list_tile.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/searchbar_widget.dart';

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
            if (state == TabState.documents) {
              return Padding(
                padding: EdgeInsets.only(left: 28.w),
                child: Container(
                  decoration: const BoxDecoration(
                    color: kBlue50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {
                          setTimeInitialValue();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const SetTimeBottomSheet(),
                            isScrollControlled: true,
                          );
                        },
                        child: CustomImage(
                            path: 'assets/icons/calendar-search.png',
                            width: 24.w,
                            height: 24.h),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        onPressed: () {
                          setTimeInitialValue();
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => const SetTimeBottomSheet(),
                            isScrollControlled: true,
                          );
                        },
                        child: CustomImage(
                            path: 'assets/icons/calendar-search.png',
                            width: 24.w,
                            height: 24.h),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return FloatingActionButton(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                onPressed: () {
                  setTimeInitialValue();
                  showModalBottomSheet(
                    context: context,
                    builder: (context) => const SetTimeBottomSheet(),
                    isScrollControlled: true,
                  );
                },
                child: CustomImage(
                    path: 'assets/icons/calendar-search.png',
                    width: 24.w,
                    height: 24.h),
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
                    CustomListView(
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
                        );
                      },
                      tilesList: context
                          .read<AppointmentsCubit>()
                          .getAppointments(kAppointmentsKey),
                    ),

// *Tab 2 content
                    // * pre-appointments list view:
                    CustomListView(
                      tileLeftPadding: 0,
                      tileRightPadding: 0,
                      tileTopPadding: 16,
                      tileBottomPadding: 8,
                      listTileBuilder: (index) {
                        return CustomerListTile(
                          isAppointment: false,
                          isDocument: false,
                          appointments: const [],
                          index: index,
                        );
                      },
                      tilesList: const [],
                    ),

// *Tab 3 content
                    // * documents list view:
                    CustomListView(
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
                        );
                      },
                      tilesList: const [],
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
