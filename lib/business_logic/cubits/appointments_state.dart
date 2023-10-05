import '../../data/models/appointment.dart';

class AppointmentsState {
  final Map<String, List<Appointment>> allAppointments;

  AppointmentsState({required this.allAppointments});
}
