part of 'tab_cubit.dart';

@immutable
abstract class TabState {
  final String? hintText;
  const TabState(this.hintText);
}

// *Define individual state classes for each tab
class TabLoadingState extends TabState {
  TabLoadingState(super.hintText) {
    debugPrint('tabLoading');
  }
}

class TabLoadingCompleteState extends TabState {
  TabLoadingCompleteState(super.hintText) {
    debugPrint('tabLoadingCompleted');
  }
}

class TabErrorState extends TabState {
  final String error;
  TabErrorState(this.error) : super('') {
    debugPrint('tabErrorState $error');
  }
}

class AppointmentTabState extends TabState {
  final List<Appointment> appointments;
  AppointmentTabState(this.appointments, super.hintText) {
    debugPrint('AppointmentTabState');
  }
}

class PreAppointmentTabState extends TabState {
  final List<Appointment> preAppointments;
  PreAppointmentTabState(this.preAppointments, super.hintText) {
    debugPrint('PreAppointmentTabState');
  }
}

class DocumentsTabState extends TabState {
  final List<Customer> customers;
  DocumentsTabState(this.customers, super.hintText) {
    debugPrint('DocumentsTabState');
  }
}
