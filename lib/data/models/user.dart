class User {
  final int userId;
  final String username;
  final String userEmail;
  final String userPhoneNumber;

  User({
    required this.userId,
    required this.username,
    required this.userEmail,
    required this.userPhoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['id'] as int,
      username: json['username'] as String,
      userEmail: json['email'] as String,
      userPhoneNumber: json['phoneNumber'] as String,
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
