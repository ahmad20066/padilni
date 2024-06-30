import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class ItemModel {
  int id;
  int category_id;
  int? sub_category_id;
  String status;
  String title;
  String description;
  double price;
  List<AddImage> images;
  int area_id;
  int? country_id;
  int? city_id;
  String? category;
  ItemModel(
      {required this.id,
      required this.status,
      required this.area_id,
      this.country_id,
      this.city_id,
      this.sub_category_id,
      required this.category_id,
      required this.title,
      required this.description,
      required this.price,
      required this.images,
      this.category});

  Future<Map<String, dynamic>> toMap() async {
    return {
      'id': id,
      'area_id': area_id.toString(),
      'category_id': category_id.toString(),
      // 'sub_category_id': category_id.toString(),
      'title': title,
      'is_active': "1",
      "status": status,
      'description': description,
      'price': price,
      'images': await Future.wait(images.map((x) => x.toMap())),
    };
  }

  factory ItemModel.fromMap(Map<String, dynamic> map) {
    print(map['images']);
    return ItemModel(
      id: map['id']?.toInt() ?? 0,
      status: map['status'] ?? "",
      area_id: map['area_id'] ?? 0,
      country_id: map['country_id'] ?? 0,
      city_id: map['city_id'] ?? 0,
      category_id: map['category_id']?.toInt() ?? 0,
      sub_category_id: map['sub_category_id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      category: map['category'],
      images: map['images'] == null
          ? map['image'] != null
              ? (map['image'] as List).map((e) => AddImage.fromMap(e)).toList()
              : []
          : (map['images'] as List).map((e) => AddImage.fromMap(e)).toList(),
    );
  }
}

class AddImage {
  int? id;
  File? imageFile;
  String? image;
  int is_default;
  int? flag;
  AddImage(
      {this.imageFile, this.is_default = 0, this.image, this.flag, this.id});

  Future<Map<String, dynamic>> toMap() async {
    print("-------");
    return {
      if (imageFile != null)
        'imageFile': await MultipartFile.fromFile(imageFile!.path),
      if (id != null) "id": id,
      'is_default': is_default,
      if (flag != null) 'flag': flag
    };
  }

  factory AddImage.fromMap(Map<String, dynamic> map) {
    return AddImage(
      image: map['image'],
      id: map['id'],
      is_default: map['is_default']?.toInt() ?? 0,
    );
  }
}
