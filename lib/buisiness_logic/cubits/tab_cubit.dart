import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  int currentIndex;

  TabCubit(this.currentIndex, super.initialState);

  void changeTab(int currentIndex) {
    TabState newState;

    // * Depending on the tab index, you can fetch and update data here
    if (currentIndex == 0) {
      newState = AppointmentTabState();
    } else if (currentIndex == 1) {
      newState = PreAppointmentTabState();
    } else {
      newState = DocumentsTabState();
    }

    emit(newState);
  }

  //TODO fetch data based on tab state
  // You can implement similar methods to fetch data for other tabs
  // List<String> fetchTab1Data() {
  //   // Implement your data fetching logic for tab 1 here
  //   // Return the fetched data
  // }
  //
  // List<String> fetchTab2Data() {
  //   // Implement your data fetching logic for tab 2 here
  //   // Return the fetched data
  // }
  //
  // List<String> fetchTab3Data() {
  //   // Implement your data fetching logic for tab 3 here
  //   // Return the fetched data
  // }
}
