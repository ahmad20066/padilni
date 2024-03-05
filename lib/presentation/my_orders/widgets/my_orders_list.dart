import 'package:flutter/material.dart';

import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/presentation/my_orders/widgets/my_order_widget.dart';

class MyOrdersList extends StatelessWidget {
  List<OrderModel> orders = [];
  MyOrdersList({
    Key? key,
    required this.orders,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        return MyOrderWidget(
          order: orders[index],
        );
      },
    );
  }
}
