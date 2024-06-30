import 'dart:convert';

import 'package:padilni/models/categories/sub_category_model.dart';

class CategoriesModel {
  final int id;
  final String image;
  final String title;
  // final List<SubCategoryModel> sub_categories;
  CategoriesModel({
    required this.id,
    required this.image,
    required this.title,
    // required this.sub_categories,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'title': title,
      // 'sub_categories': sub_categories.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
      title: map['title'] ?? '',
      // sub_categories: List<SubCategoryModel>.from(
      //     map['sub_categories']?.map((x) => SubCategoryModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoriesModel(id: $id, image: $image, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesModel &&
        other.id == id &&
        other.image == image &&
        other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ title.hashCode;
}
