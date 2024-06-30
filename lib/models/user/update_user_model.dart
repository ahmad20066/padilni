import 'dart:convert';

import 'package:dio/dio.dart';

class UpdateUserModel {
  final String? image;
  final String? phone;
  final String? name;
  final String? birthdate;
  final String? gender;
  final String? language;
  UpdateUserModel({
    this.image,
    this.name,
    this.phone,
    this.language,
    this.birthdate,
    this.gender,
  });

  Future<Map<String, dynamic>> toMap() async {
    return {
      if (language != null && language!.isNotEmpty) 'language': language,
      if (image != null && image!.isNotEmpty)
        'image': await MultipartFile.fromFile(image!),
      if (phone != null && phone!.isNotEmpty) 'phone': phone,
      if (birthdate != null && birthdate!.isNotEmpty) 'birthdate': birthdate,
      if (gender != null && gender!.isNotEmpty) 'gender': gender,
      if (name != null && name!.isNotEmpty) 'name': name,
    };
  }

  factory UpdateUserModel.fromMap(Map<String, dynamic> map) {
    return UpdateUserModel(
      image: map['image'],
      phone: map['phone'],
      birthdate: map['birthdate'],
      gender: map['gender'],
    );
  }
}
