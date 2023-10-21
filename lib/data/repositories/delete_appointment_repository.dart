import '../../constants/strings.dart';
import '../services/delete_appointment_service.dart';

class DeleteAppointmentRepository {
  final DeleteAppointmentService deleteAppointmentService;

  DeleteAppointmentRepository({required this.deleteAppointmentService});

  Future<bool> deleteAppointment(
    int appointmentId,
  ) async {
    final response =
        await deleteAppointmentService.deleteAppointment(appointmentId);
    if (response.statusCode == 500) {
      return true;
    } else {
// ! error'
      throw Exception('$kDeleteAppointmentException:${response.statusCode}');
    }
  }
}
