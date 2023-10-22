part of 'search_cubit.dart';

abstract class SearchState {
  final String query;
  final List<Appointment> appointmentResults;
  final List<Customer> customerResults;

  const SearchState(
      {this.query = '',
      this.appointmentResults = const [],
      this.customerResults = const []});
}

class SearchInitialState extends SearchState {}

class SearchLoading extends SearchState {}

class AppointmentSearchResultsState extends SearchState {
  AppointmentSearchResultsState({super.appointmentResults});
}

class CustomerSearchResultsState extends SearchState {
  CustomerSearchResultsState({super.customerResults});
}

class SearchEmpty extends SearchState {}
