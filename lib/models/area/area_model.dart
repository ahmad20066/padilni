import 'dart:convert';

class AreaModel {
  final int id;
  final String title;
  AreaModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory AreaModel.fromMap(Map<String, dynamic> map) {
    return AreaModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }
}
