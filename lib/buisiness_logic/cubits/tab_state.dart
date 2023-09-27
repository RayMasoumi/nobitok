part of 'tab_cubit.dart';

@immutable
abstract class TabState {}

// *Define individual state classes for each tab
class AppointmentTabState extends TabState {
  AppointmentTabState();
}

class PreAppointmentTabState extends TabState {
  PreAppointmentTabState();
}

class DocumentsTabState extends TabState {
  DocumentsTabState();
}
