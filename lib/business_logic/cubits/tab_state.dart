part of 'tab_cubit.dart';

@immutable
abstract class TabState {}

// *Define individual state classes for each tab
class AppointmentTabState extends TabState {
  final List<Appointment> appointments;
  AppointmentTabState(this.appointments);
}

class PreAppointmentTabState extends TabState {
  final List<Appointment> preAppointments;
  PreAppointmentTabState(this.preAppointments);
}

class DocumentsTabState extends TabState {
  final List<dynamic> documents;
  DocumentsTabState(this.documents);
}
