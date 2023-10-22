import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nobitok/constants/sizes.dart';
import 'package:nobitok/constants/styles.dart';

import '../../business_logic/cubits/appointment_details_cubit.dart';
import '../../business_logic/cubits/appointments_cubit.dart';
import '../../business_logic/cubits/search_cubit.dart';
import '../../business_logic/cubits/tab_cubit.dart';
import '../../constants/strings.dart';
import '../widgets/custom_list_view.dart';
import '../widgets/customer_list_tile.dart';
import '../widgets/horizontal_padding.dart';
import '../widgets/padded_divider.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({super.key});

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void onSearchTextChanged(String query) {
    // * Listen for changes in the search bar text input
    // * When text changes, navigate to the SearchResultsScreen
    query = query.trim();
    if (query.isNotEmpty) {
      // * Update the search query in the SearchCubit.
      context.read<SearchCubit>().onSearchTextChanged(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: HorizontalPadding(
        child: Column(
          children: [
            SizedBox(
              height: 8.h,
            ),
// * searchbar:
            BlocBuilder<TabCubit, TabState>(
              builder: (context, state) {
                return TextField(
                  onChanged: (query) {
                    onSearchTextChanged(query);
                  },
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    errorMaxLines: 1,
                    border: InputBorder.none,
                    hintText: context.read<TabCubit>().state.hintText!,
                    hintStyle: kBold14TextStyle.copyWith(
                      color: const Color(0xff5D5D5D),
                    ),
                  ),
                  controller: searchController,
                );
              },
            ),
// * first divider:
            const PaddedDivider(
              topPadding: 12,
              bottomPadding: 12,
            ), // * end of first divider

// * Display search results
            SizedBox(
              height: kHeight - 200,
              child: BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchResults) {
                    print('in search result screen');
                    final searchResults = state.results;
                    print(searchResults.length);
                    return CustomListView(
                      onRefresh: () async {},
                      tileLeftPadding: 0,
                      tileRightPadding: 0,
                      tileTopPadding: 16,
                      tileBottomPadding: 8,
                      listTileBuilder: (index) {
                        return CustomerListTile(
                          isAppointment: true,
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
                                appointmentsList.getAppointments(
                                    kPreAppointmentsKey)[index]);
                          },
                        );
                      },
                      itemCount: searchResults.length,
                    );
                  } else {
                    return Expanded(
                      child: Center(
                        child: Text(
                          "نتیجه ای یافت نشد!",
                          style: kBold16TextStyle.copyWith(fontSize: 19),
                        ), // Display a message if no results.
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
