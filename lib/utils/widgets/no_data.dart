import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "no_Data".tr,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
