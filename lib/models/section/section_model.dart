import 'dart:convert';

class SectionModel {
  final int id;
  final String title;
  SectionModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory SectionModel.fromMap(Map<String, dynamic> map) {
    return SectionModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }
}
