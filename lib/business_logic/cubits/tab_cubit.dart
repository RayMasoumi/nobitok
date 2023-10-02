import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/services/auth_service.dart';
import 'package:nobitok/data/services/get_pre_appointment_service.dart';

import '../../data/models/appointment.dart';
import '../../methods/get_today_date.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit(
    this.authService,
  ) : super(AppointmentTabState(const [])) {
    _initialize();
  }
  final AuthService authService;

  Future<void> _initialize() async {
    try {
      final todayAppointments = await authService.fetchTodayAppointments();
      emit(AppointmentTabState(todayAppointments));
    } catch (error) {
      throw Exception('$kServerException:$error');
    }
  }

  void changeTab(String newTabKey) async {
    TabState newState;

    emit(TabLoadingState());

    try {
      // * Depending on the tab index, you can fetch and update data here
      if (newTabKey == kAppointmentsKey) {
        List<Appointment> appointments;
        appointments = await authService.fetchTodayAppointments();
        emit(TabLoadingCompleteState());

        emit(AppointmentTabState(appointments));
      } else if (newTabKey == kPreAppointmentsKey) {
        List<Appointment> preAppointments;
        preAppointments = await PreAppointmentService()
            .fetchPreAppointments(getTodayDate(), '1402/11/10');
        //TODO
        emit(TabLoadingCompleteState());

        emit(PreAppointmentTabState(preAppointments));
      } else if (newTabKey == kDocumentsKey) {
        newState = DocumentsTabState(const []); //TODO
        emit(TabLoadingCompleteState());

        emit(newState);
      }
    } catch (error) {
      emit(TabLoadingCompleteState());
      emit(TabErrorState('$error'));
    }
  }
}
