import 'dart:convert';

class SubCategoryModel {
  final String title;
  final String description;
  final String image;
  final int id;
  SubCategoryModel({
    required this.title,
    required this.description,
    required this.image,
    required this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'id': id,
    };
  }

  factory SubCategoryModel.fromMap(Map<String, dynamic> map) {
    return SubCategoryModel(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      image: map['image'] ?? '',
      id: map['id']?.toInt() ?? 0,
    );
  }
}
