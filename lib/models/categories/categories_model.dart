import 'dart:convert';

class CategoriesModel {
  final int id;
  final String image;
  final String name;
  CategoriesModel({
    required this.id,
    required this.image,
    required this.name,
  });

  CategoriesModel copyWith({
    int? id,
    String? image,
    String? name,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory CategoriesModel.fromMap(Map<String, dynamic> map) {
    return CategoriesModel(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesModel.fromJson(String source) =>
      CategoriesModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoriesModel(id: $id, image: $image, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoriesModel &&
        other.id == id &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ name.hashCode;
}
