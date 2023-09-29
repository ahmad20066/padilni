import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  final List<Widget> children;
  final double initialSize;
  final double maxSize;
  final double minSize;
  const BodyContainer(
      {super.key,
      required this.children,
      this.initialSize = 0.73,
      this.maxSize = 0.85,
      this.minSize = 0.73});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialSize,
      maxChildSize: maxSize,
      minChildSize: minSize,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    offset: Offset(0, -6), color: Color.fromRGBO(0, 0, 0, 0.16))
              ],
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              )),
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              controller: scrollController,
              children: children),
        );
      },
    );
  }
}
