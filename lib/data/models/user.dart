import 'appointment.dart';

class User {
  final int userId;
  final String username;
  final String userEmail;
  final String userPhoneNumber;
  final List<Appointment> appointments;
  final List<Appointment> preAppointments;

  User({
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.userPhoneNumber,
    required this.appointments,
    required this.preAppointments,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'] as int,
      username: json['username'] as String,
      userEmail: json['email'] as String,
      userPhoneNumber: json['phoneNumber'] as String,
      appointments: [], //TODO
      preAppointments: [], //TODO
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': userId,
      'username': username,
      'email': userEmail,
      'phoneNumber': userPhoneNumber,
    };
  }
}
