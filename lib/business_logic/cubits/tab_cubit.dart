import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nobitok/constants/strings.dart';
import 'package:nobitok/data/models/customer.dart';
import 'package:nobitok/data/repositories/customers_repository.dart';

import '../../data/models/appointment.dart';
import '../../data/repositories/get_appointments_repository.dart';
import '../../data/repositories/get_pre_appointments_repository.dart';
import '../../methods/get_today_date.dart';

part 'tab_state.dart';

class TabCubit extends Cubit<TabState> {
  TabCubit(
    this.appointmentsRepository,
    this.preAppointmentRepository,
    this.customerRepository,
  ) : super(AppointmentTabState(const [], 'جستجو نوبت ها'));
  final GetAppointmentsRepository appointmentsRepository;
  final PreAppointmentRepository preAppointmentRepository;
  final CustomerRepository customerRepository;

  void changeTab(String newTabKey) async {
    emit(TabLoadingState(null));

    try {
      // * Depending on the tab index, you can fetch and update data here
      if (newTabKey == kAppointmentsKey) {
        List<Appointment> appointments;
        appointments = await appointmentsRepository.fetchTodayAppointments();
        emit(TabLoadingCompleteState(null));

        emit(AppointmentTabState(appointments, 'جستجو نوبت ها'));
      } else if (newTabKey == kPreAppointmentsKey) {
        List<Appointment> preAppointments;
        preAppointments = await preAppointmentRepository
            .fetchPreAppointmentsByRange(getTodayDate(), '1402/11/10');
        //TODO get all pre appointments
        emit(TabLoadingCompleteState(null));

        emit(PreAppointmentTabState(preAppointments, 'جستجو پسش نوبت ها'));
      } else if (newTabKey == kDocumentsKey) {
        List<Customer> customers = await customerRepository.fetchAllCustomers();
        emit(TabLoadingCompleteState(null));
        emit(DocumentsTabState(customers, 'جستجو پرونده ها'));
      }
    } catch (error) {
      emit(TabLoadingCompleteState(null));
      emit(TabErrorState('$error'));
    }
  }
}
