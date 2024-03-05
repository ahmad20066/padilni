import 'dart:convert';

import 'package:dio/dio.dart';

class ItemModel {
  final int id;
  final String? name;
  final String? description;
  final int? sub_category_id;
  final String? main_image;
  final List<String>? images;
  final double? price;
  ItemModel({
    required this.id,
    required this.name,
    required this.description,
    required this.sub_category_id,
    required this.main_image,
    required this.images,
    required this.price,
  });

  Future<Map<String, dynamic>> toMap() async {
    return {
      'id': id,
      'name': name,
      'description': description,
      'sub_category_id': sub_category_id,
      'main_image':
          main_image != null ? MultipartFile.fromFile(main_image!) : null,
      'images': images?.map((e) => MultipartFile.fromFile(e)).toList(),
      'price': price,
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    return ItemModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      sub_category_id: map['sub_category_id']?.toInt() ?? 0,
      main_image: map['main_image'] ?? '',
      images: List<String>.from(map['images']),
      price: map['price']?.toDouble() ?? 0.0,
    );
  }
}
