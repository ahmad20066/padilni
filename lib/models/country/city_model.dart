import 'dart:convert';

import 'package:padilni/models/area/area_model.dart';

class CityModel {
  final int id;
  final String title;
  final List<AreaModel> areas;
  CityModel({
    required this.id,
    required this.title,
    required this.areas,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'areas': areas.map((x) => x.toMap()).toList(),
    };
  }

  factory CityModel.fromMap(Map<String, dynamic> map) {
    return CityModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      areas:
          List<AreaModel>.from(map['areas']?.map((x) => AreaModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CityModel.fromJson(String source) =>
      CityModel.fromMap(json.decode(source));
}
