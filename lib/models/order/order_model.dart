import 'dart:convert';

import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/models/user/user_model.dart';

class OrderModel {
  final int id;
  final UserModel exchange_user;
  final UserModel owner_user;
  final ItemModel? my_item;
  final ItemModel? exchanged_item;
  final String status;
  final String exchange_type;
  final double? price;
  final double? extra_money;
  final double? offer_money;
  OrderModel({
    required this.id,
    required this.exchange_user,
    required this.owner_user,
    this.my_item,
    this.exchanged_item,
    required this.status,
    required this.exchange_type,
    this.price,
    this.extra_money,
    this.offer_money,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'exchange_user': exchange_user.toMap(),
      'owner_user': owner_user.toMap(),
      'my_item': my_item?.toMap(),
      'exchanged_item': exchanged_item?.toMap(),
      'status': status,
      'exchange_type': exchange_type,
      'price': price,
      'extra_money': extra_money,
      'offer_money': offer_money,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt() ?? 0,
      exchange_user: UserModel.fromMap(map['exchange_user']),
      owner_user: UserModel.fromMap(map['owner_user']),
      my_item:
          map['my_item'] != null ? ItemModel.fromMap(map['my_item']) : null,
      exchanged_item: map['exchanged_item'] != null
          ? ItemModel.fromMap(map['exchanged_item'])
          : null,
      status: map['status'] ?? '',
      exchange_type: map['exchange_type'] ?? '',
      price: map['price']?.toDouble(),
      extra_money: map['extra_money']?.toDouble(),
      offer_money: map['offer_money']?.toDouble(),
    );
  }
}
