import 'dart:convert';

import 'package:padilni/data/enums/exchange_type.dart';
import 'package:padilni/presentation/exchange/widgets/exchange_type.dart';

class ExchangeRequestModel {
  final int exchanged_item;
  final int? my_item;
  final double? extra_money;
  final double? offer_money;
  final double? price;
  final ExchangeTypeEnum exchange_type;
  ExchangeRequestModel({
    required this.exchanged_item,
    this.my_item,
    this.extra_money,
    this.offer_money,
    this.price,
    required this.exchange_type,
  });

  Map<String, dynamic> toMap() {
    return {
      'exchanged_item': exchanged_item,
      if (my_item != null) 'my_item': my_item,
      if (extra_money != null) 'extra_money': extra_money,
      if (offer_money != null) 'offer_money': offer_money,
      if (price != null) 'price': price,
      'exchange_type': exchange_type.name,
    };
  }

  factory ExchangeRequestModel.fromMap(Map<String, dynamic> map) {
    return ExchangeRequestModel(
      exchanged_item: map['exchanged_item']?.toInt() ?? 0,
      my_item: map['my_item']?.toInt(),
      extra_money: map['extra_money']?.toDouble(),
      offer_money: map['offer_money']?.toDouble(),
      price: map['price']?.toDouble(),
      exchange_type: map['exchange_type'] == "cash"
          ? ExchangeTypeEnum.cash
          : ExchangeTypeEnum.change,
    );
  }
}
