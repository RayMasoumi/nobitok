import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/business_logic/cubits/appointments_cubit.dart';
import 'package:nobitok/business_logic/cubits/tab_cubit.dart';
import 'package:nobitok/constants/strings.dart';

import '../../data/models/appointment.dart';
import '../../data/models/customer.dart';
import 'customer_cubit.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TabCubit tabCubit;
  final AppointmentsCubit appointmentsCubit;
  final CustomerCubit customerCubit;
  List<Appointment> appointmentSearchResult = [];
  List<Customer> customerSearchResult = [];
  SearchCubit(this.tabCubit, this.appointmentsCubit, this.customerCubit)
      : super(SearchInitialState());

  // * returns a list to search for different kinds of appointments to go through
  List<Appointment> getAppointmentsInitialList() {
    if (tabCubit.state is AppointmentTabState) {
      return appointmentsCubit.getAppointments(kAppointmentsKey);
    } else if (tabCubit.state is PreAppointmentTabState) {
      return appointmentsCubit.getAppointments(kPreAppointmentsKey);
    } else {
      return appointmentsCubit.getAppointments(kCompletedAppointmentsKey);
    }
  }

  // * returns a list to search for different documents(customers) to go through
  List<Customer> getCustomersInitialList() {
    return customerCubit.getCustomers();
  }

  List<Appointment> onAppointmentSearchTextChanged(String query) {
    // * Clear the previous search results.
    appointmentSearchResult.clear();

    // * Convert the query to lowercase for case-insensitive search.
    final lowerCaseQuery = query.toLowerCase();

    // * Apply search logic based on the current tab state.
    appointmentSearchResult = getAppointmentsInitialList().where((item) {
      final customerName = item.customerName.toLowerCase();
      return customerName.contains(lowerCaseQuery);
    }).toList();
    emit(AppointmentSearchResultsState(
        appointmentResults: appointmentSearchResult));
    print('*************');
    print(appointmentSearchResult.length);
    for (Appointment item in appointmentSearchResult) {
      print(item.customerName);
    }
    return appointmentSearchResult;
  }

  List<Customer> onCustomerSearchTextChanged(String query) {
    // * Clear the previous search results.
    customerSearchResult.clear();

    // * Convert the query to lowercase for case-insensitive search.
    final lowerCaseQuery = query.toLowerCase();

    // * Apply search logic based on the current tab state:
    customerSearchResult = getCustomersInitialList().where((element) {
      final customerName = element.customerName.toLowerCase();
      return customerName.contains(lowerCaseQuery);
    }).toList();

    emit(CustomerSearchResultsState(customerResults: customerSearchResult));
    print('*****customer search result state emitted********');
    print(customerSearchResult.length);
    for (Customer item in customerSearchResult) {
      print(item.customerName);
    }
    return customerSearchResult;
  }
}
