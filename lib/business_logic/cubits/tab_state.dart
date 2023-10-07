part of 'tab_cubit.dart';

@immutable
abstract class TabState {}

// *Define individual state classes for each tab

class TabLoadingState extends TabState {
  TabLoadingState() {
    debugPrint('tabLoading');
  }
}

class TabLoadingCompleteState extends TabState {
  TabLoadingCompleteState() {
    debugPrint('tabLoadingCompleted');
  }
}

class TabErrorState extends TabState {
  final String error;
  TabErrorState(this.error) {
    debugPrint('tabErrorState $error');
  }
}

class AppointmentTabState extends TabState {
  final List<Appointment> appointments;
  AppointmentTabState(this.appointments) {
    debugPrint('AppointmentTabState');
  }
}

class PreAppointmentTabState extends TabState {
  final List<Appointment> preAppointments;
  PreAppointmentTabState(this.preAppointments) {
    debugPrint('PreAppointmentTabState');
  }
}

class DocumentsTabState extends TabState {
  final List<Customer> customers;
  DocumentsTabState(this.customers) {
    debugPrint('DocumentsTabState');
  }
}
