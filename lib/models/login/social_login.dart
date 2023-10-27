import 'dart:convert';

class SocialLoginModel {
  final String name;
  final String email;
  final String signup_method;
  final String social_id;
  final String device_type;
  final String device_uuid;
  final String notification_token;
  SocialLoginModel({
    required this.name,
    required this.email,
    required this.signup_method,
    required this.social_id,
    required this.device_type,
    required this.device_uuid,
    required this.notification_token,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'signup_method': signup_method,
      'social_id': social_id,
      'device_type': device_type,
      'device_uuid': device_uuid,
      'notification_token': notification_token,
    };
  }

  factory SocialLoginModel.fromMap(Map<String, dynamic> map) {
    return SocialLoginModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      signup_method: map['signup_method'] ?? '',
      social_id: map['social_id']?.toInt() ?? 0,
      device_type: map['device_type'] ?? '',
      device_uuid: map['device_uuid'] ?? '',
      notification_token: map['notification_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory SocialLoginModel.fromJson(String source) =>
      SocialLoginModel.fromMap(json.decode(source));
}
