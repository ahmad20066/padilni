import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:padilni/models/product/product_model.dart';
import 'package:padilni/utils/colors.dart';

class ItemWidget extends StatelessWidget {
  final ProductModel product;
  const ItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Get.height * 0.01),
      height: Get.height * 0.3,
      width: Get.width,
      child: Stack(
        children: [
          Container(
            // height: Get.height * 0.3,
            // width: Get.width,
            child: Image.asset(
              "assets/images/onboarding2.png",
              // height: Get.height * 0.15,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: Get.width,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    width: Get.width * 0.1,
                  ),
                  Text(
                    product.name,
                    style: GoogleFonts.poppins(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Container(
                    padding: EdgeInsets.all(5),
                    height: Get.height * 0.06,
                    width: Get.width * 0.35,
                    decoration: BoxDecoration(
                        color: AppColors.fifthcolor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            bottomLeft: Radius.circular(40))),
                    child: Row(children: [
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      CircleAvatar(
                        // radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.edit_square,
                          color: Color.fromRGBO(74, 75, 77, 1),
                        ),
                      ),
                      SizedBox(
                        width: Get.width * 0.05,
                      ),
                      CircleAvatar(
                        // radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.delete_forever,
                          color: Color.fromRGBO(74, 75, 77, 1),
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
