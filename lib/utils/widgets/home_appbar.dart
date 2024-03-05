import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool hasLeading;
  final double height;
  final Color? color;
  const HomeAppbar(
      {Key? key,
      required this.text,
      this.color,
      this.hasLeading = false,
      this.height = 0.2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color,
      automaticallyImplyLeading: hasLeading,
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: color != Colors.transparent
                ? Colors.white
                : Color.fromRGBO(84, 85, 87, 0.8)),
      ),
      centerTitle: true,
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.all(Get.width * 0.03),
      //     child: const Icon(Icons.home),
      //   )
      // ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(Get.height * height);
}
