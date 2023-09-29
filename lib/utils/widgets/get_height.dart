import 'package:flutter/material.dart';

class GetHeight extends StatelessWidget {
  const GetHeight({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: height,
    );
  }
}