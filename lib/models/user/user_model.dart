class UserModel {
  final String? email;
  final String? name;
  final String? password;
  final String? notification_token;
  final String? device_uuid;
  final String? code;
  final String? device_type;

  UserModel(
      {this.email,
      this.name,
      this.password,
      this.device_type,
      this.code,
      this.notification_token,
      this.device_uuid});

  Map<String, dynamic> userRegisterToJson() {
    return {"email": email, "password": password, "name": name};
  }

  Map<String, dynamic> userVerifyToJson() {
    return {
      "email": email,
      "code": code,
    };
  }

  Map<String, dynamic> loginToJSon() {
    return {
      'email': email,
      'password': password,
      'device_type': device_type,
      'device_uuid': device_uuid,
      'notification_token': notification_token,
    };
  }
}
