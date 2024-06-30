import 'dart:convert';

class MessageModel {
  final int id;
  final String body;
  final int to;
  final int exchange_id;
  bool sent;
  bool is_mine;
  final String created_at;
  MessageModel({
    required this.id,
    required this.body,
    required this.to,
    required this.exchange_id,
    this.sent = true,
    required this.created_at,
    this.is_mine = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'to': to,
      'exchange_id': exchange_id,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['id']?.toInt() ?? 0,
      body: map['body'] ?? '',
      to: map['to']?.toInt() ?? 0,
      created_at: map['created_at'] ?? "",
      exchange_id: map['exchange_id']?.toInt() ?? 0,
      // sent: map['sent'] ?? false,
      is_mine: map['is_mine'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
