import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final bool hasLeading;
  const HomeAppbar({Key? key, required this.text, this.hasLeading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: hasLeading,
      title: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
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
  Size get preferredSize => Size.fromHeight(Get.height * 0.2);
}
