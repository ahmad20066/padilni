import 'dart:convert';

class BannerModel {
  final int id;
  final String image;
  BannerModel({
    required this.id,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
    };
  }

  factory BannerModel.fromMap(Map<String, dynamic> map) {
    return BannerModel(
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
    );
  }
}
