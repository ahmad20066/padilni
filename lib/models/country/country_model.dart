import 'dart:convert';

import 'package:padilni/models/country/city_model.dart';

class CountryModel {
  final int id;
  final String title;
  final List<CityModel> cities;
  CountryModel({
    required this.id,
    required this.title,
    required this.cities,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'cities': cities.map((x) => x.toMap()).toList(),
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      cities:
          List<CityModel>.from(map['cities']?.map((x) => CityModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source));
}
