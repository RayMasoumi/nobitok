import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';

import '../../data/models/appointment.dart';
import '../../data/repositories/get_appointments_repository.dart';
import '../../data/repositories/get_pre_appointments_repository.dart';
import '../../methods/get_today_date.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit(
    this.appointmentsRepository,
    this.preAppointmentRepository,
  ) : super(AppointmentTabState(const []));
  final GetAppointmentsRepository appointmentsRepository;
  final PreAppointmentRepository preAppointmentRepository;

  void changeTab(String newTabKey) async {
    TabState newState;

    emit(TabLoadingState());

    try {
      // * Depending on the tab index, you can fetch and update data here
      if (newTabKey == kAppointmentsKey) {
        List<Appointment> appointments;
        appointments = await appointmentsRepository.fetchTodayAppointments();
        emit(TabLoadingCompleteState());

        emit(AppointmentTabState(appointments));
      } else if (newTabKey == kPreAppointmentsKey) {
        List<Appointment> preAppointments;
        preAppointments = await preAppointmentRepository.fetchPreAppointments(
            getTodayDate(), '1402/11/10');
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
