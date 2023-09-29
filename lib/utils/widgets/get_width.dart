import 'package:flutter/material.dart';

class GetWidth extends StatelessWidget {
  const GetWidth({super.key, required this.width});
  final double width;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: width,
    );
  }
}