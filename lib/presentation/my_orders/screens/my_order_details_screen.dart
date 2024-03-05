import 'package:flutter/material.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';

class MyOrderDetailsScreen extends StatelessWidget {
  const MyOrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Details"),
    );
  }
}
