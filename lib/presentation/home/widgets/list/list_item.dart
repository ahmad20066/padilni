import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padilni/models/product/product_model.dart';

class ListItem extends StatelessWidget {
  final ProductModel product;
  const ListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height*0.13,
      child: Card( 
        surfaceTintColor: Colors.white,
        semanticContainer: false,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Get.width*0.025)),
        elevation: 6,
        child: Padding(
          padding:  EdgeInsets.all(Get.width*0.02),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: Image.asset(
                  "assets/images/onboarding2.png",
                  height: Get.height * 0.15,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                children: [
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                        fontSize: Get.width*0.04, fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Text(
                    product.type,
                    style: GoogleFonts.poppins(fontSize: Get.width*0.025),
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
                  style: GoogleFonts.poppins(color: Colors.purple, fontSize: Get.width*0.031),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
