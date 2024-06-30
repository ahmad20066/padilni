import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:padilni/models/order/order_model.dart';
import 'package:padilni/presentation/my_orders/widgets/my_order_widget.dart';

class MyOrdersList extends StatelessWidget {
  final List<OrderModel> orders;
  final bool isSend;
  MyOrdersList({
    Key? key,
    required this.orders,
    required this.isSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: REdgeInsets.only(bottom: 200.h),
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: orders.length,
      itemBuilder: (BuildContext context, int index) {
        return MyOrderWidget(
          order: orders[index],
          isSend: isSend,
        );
      },
    );
  }
}
