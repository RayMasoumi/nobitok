import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/services/get_pre_appointment_service.dart';

import '../../data/models/appointment.dart';
import '../../data/services/auth_service.dart';
import '../../methods/get_today_date.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit(this.authService) : super(AppointmentTabState(const [])) {
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
        emit(TabLoadingCompleteState());
        newState =
            AppointmentTabState(await authService.fetchTodayAppointments());
        emit(newState);
      } else if (newTabKey == kPreAppointmentsKey) {
        emit(TabLoadingCompleteState());
        newState = PreAppointmentTabState(
          await PreAppointmentService()
              .fetchPreAppointments(getTodayDate(), '1402/11/10'),
        ); //TODO
        emit(newState);
      } else if (newTabKey == 'documentTab') {
        emit(TabLoadingCompleteState());
        newState = DocumentsTabState([]); //TODO
        emit(newState);
      }
    } catch (error) {
      emit(TabErrorState('$error'));
    } finally {
      emit(TabLoadingCompleteState());
    }
  }
}
