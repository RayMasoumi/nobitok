import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/styles.dart';

import '../../business_logic/cubits/appointment_details_cubit.dart';
import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/search_cubit.dart';
import '../../constants/strings.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/customer_list_tile.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/padded_divider.dart';
import '../widgets/searchbar_widget.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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

// * Display search results
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchResults) {
                  final searchResults = state.results;
                  return CustomListView(
                    onRefresh: () async {},
                    tileLeftPadding: 0,
                    tileRightPadding: 0,
                    tileTopPadding: 16,
                    tileBottomPadding: 8,
                    listTileBuilder: (index) {
                      return CustomerListTile(
                        isAppointment: false,
                        appointments: searchResults,
                        index: index,
                        onDetailsPressed: () async {
                          // * creating instances
                          final appointmentDetailCubit =
                              context.read<AppointmentDetailCubit>();
                          final appointmentsList =
                              context.read<AppointmentsCubit>();
                          // * giving this appointment as a parameter to fetch its data
                          await appointmentDetailCubit.fetchAppointmentDetail(
                              appointmentsList
                                  .getAppointments(kPreAppointmentsKey)[index]);
                        },
                      );
                    },
                    itemCount: searchResults.length,
                  );
                } else {
                  return Expanded(
                    child: Center(
                      child: Text(
                        "نتیجه ای یافت نشد",
                        style: kBold14TextStyle,
                      ), // Display a message if no results.
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
