import 'dart:convert';

class ListItemModel {
  final int id;
  final String title;
  ListItemModel({
    required this.id,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
    };
  }

  factory ListItemModel.fromMap(Map<String, dynamic> map) {
    return ListItemModel(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ListItemModel.fromJson(String source) =>
      ListItemModel.fromMap(json.decode(source));
}
