import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padilni/models/product/product_model.dart';

class ListItem extends StatelessWidget {
  final ProductModel product;
  const ListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      semanticContainer: false,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                "assets/images/onboarding2.png",
                height: Get.height * 0.15,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Row(
              children: [
                Text(
                  product.name,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  product.type,
                  style: GoogleFonts.poppins(fontSize: 10),
                ),
              ],
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "30\$",
                style: GoogleFonts.poppins(color: Colors.purple, fontSize: 13),
              ),
            )
          ],
        ),
      ),
    );
  }
}
