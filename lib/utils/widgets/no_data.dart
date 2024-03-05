import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "No Data",
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
  }
}
