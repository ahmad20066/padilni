import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatelessWidget {
  final String title;

  const TitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: AlignmentDirectional(-0.8, 1),
          child: Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.grey,
          indent: Get.width * 0.1,
          endIndent: Get.width * 0.4,
        )
      ],
    );
  }
}
