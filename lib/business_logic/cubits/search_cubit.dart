import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/appointment.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialState());

  void search(String query, List<Appointment> allAppointments) {
    final filteredAppointments = allAppointments
        .where((appointment) =>
            appointment.appointmentCustomerName.contains(query))
        .toList();
    emit(SearchState(query: query, results: filteredAppointments));
  }
}
