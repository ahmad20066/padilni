import 'dart:convert';

class UserModel {
  final String? email;
  final String? name;
  final String? password;
  final String? notification_token;
  final String? device_uuid;
  final String? code;
  final String? device_type;
  final String? image;
  final String? phone;
  final String? birthdate;
  final String? gender, location;
  final int? id;

  UserModel(
      {this.email,
      this.name,
      this.phone,
      this.gender,
      this.id,
      this.birthdate,
      this.image,
      this.location,
      this.password,
      this.device_type,
      this.code,
      this.notification_token,
      this.device_uuid});

  Map<String, dynamic> userRegisterToJson() {
    return {"email": email, "password": password, "name": name, "phone": phone};
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

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'notification_token': notification_token,
      'device_uuid': device_uuid,
      'code': code,
      'device_type': device_type,
      'location': location,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        email: map['email'],
        id: map['id'],
        name: map['name'],
        gender: map['gender'],
        image: map['image'],
        phone: map['phone'],
        birthdate: map['birthdate'],
        location: map['location']);
  }
}
