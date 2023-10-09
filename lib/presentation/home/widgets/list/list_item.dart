import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padilni/models/product/product_model.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/triangle_button.dart';
import 'package:vector_math/vector_math.dart' as vector;

class ListItem extends StatelessWidget {
  final ProductModel product;
  const ListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.13,
      child: Stack(
        children: [
          Card(
            surfaceTintColor: Colors.white,
            semanticContainer: false,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Get.width * 0.025)),
            elevation: 6,
            child: Padding(
              padding: EdgeInsets.all(Get.width * 0.02),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
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
                            fontSize: Get.width * 0.04,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Text(
                        product.type,
                        style: GoogleFonts.poppins(fontSize: Get.width * 0.025),
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
                      style: GoogleFonts.poppins(
                          color: Colors.purple, fontSize: Get.width * 0.031),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment(1, 1.2),
              child: Container(
                height: Get.height * 0.2,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 5,
                      left: Get.width * 0.15,
                      child: Chip(
                          visualDensity: VisualDensity(vertical: -4),
                          backgroundColor: AppColors.fifthcolor,
                          label: Text(
                            "exchange     ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    Positioned(right: 0, bottom: 0, child: TriangleButton()),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
