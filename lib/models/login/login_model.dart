
class LoginModel {
  final String email;
  final String password;
  final String device_type;
  final int device_uuid;
  final String notification_token;
  LoginModel({
    required this.email,
    required this.password,
    required this.device_type,
    required this.device_uuid,
    required this.notification_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'device_type': device_type,
      'device_uuid': device_uuid,
      'notification_token': notification_token,
    };
  }
}
