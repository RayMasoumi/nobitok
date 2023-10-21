import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:nobitok/business_logic/cubits/appointments_cubit.dart';
import 'package:nobitok/business_logic/cubits/tab_cubit.dart';
import 'package:nobitok/constants/strings.dart';

import '../../data/models/appointment.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final TabCubit tabCubit;
  final AppointmentsCubit appointmentsCubit;
  List<dynamic> searchResult = [];
  SearchCubit(this.tabCubit, this.appointmentsCubit)
      : super(SearchInitialState());

  List<dynamic> getList() {
    if (tabCubit.state is AppointmentTabState) {
      return appointmentsCubit.getAppointments(kAppointmentsKey);
    } else if (tabCubit.state is PreAppointmentTabState) {
      return appointmentsCubit.getAppointments(kPreAppointmentsKey);
    } else {
      return appointmentsCubit.getAppointments(kDocumentsKey);
    }
  }

  List<dynamic> onSearchTextChanged(String query) {
    // * Clear the previous search results.
    searchResult.clear();
    // * initialize the original list to search through:

    // * Apply search logic based on the current tab state.
    searchResult =
        getList().where((element) => element.contains(query)).toList();
    emit(SearchResults());
    return searchResult;
  }
}
