import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/exchange/controllers/exchange_controller.dart';
import 'package:padilni/presentation/exchange/widgets/confirm_dialog.dart';
import 'package:padilni/presentation/exchange/widgets/exchange_type.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/routes/app_routes.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/get_height.dart';

class ExchangeScreen extends StatelessWidget {
  const ExchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ExchangeController());
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        title: Text(
          "exchange".tr,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        elevation: 0.0,
      ),
      body: SizedBox(
        width: Get.width,
        child: Stack(children: [
          Positioned(
              bottom: 0,
              right: -Get.width * 0.35,
              left: 0,
              top: Get.height * 0.01,
              child: Padding(
                padding: EdgeInsets.all(Get.width * 0.12),
                child: Image.asset("assets/images/Path 2.png"),
              )),
          Positioned(
              bottom: Get.height * 0.7,
              right: 20,
              left: 20,
              top: Get.height * 0.02,
              child: InkWell(
                onTap: () {
                  Get.toNamed(AppRoutes.exchangeViaItemRoute);
                },
                child: ExchangeType(
                  icon: Icons.swap_horiz,
                  text: "exchange_with_item".tr,
                ),
              )),
          Positioned(
              bottom: Get.height * 0.48,
              right: Get.width * 0.05,
              left: Get.width * 0.05,
              top: Get.height * 0.24,
              child: InkWell(
                onTap: () async {
                  // await showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return ConfirmDialog();
                  //     });
                  Get.toNamed(AppRoutes.cashExchangeRoute);
                },
                child: ExchangeType(
                  icon: Icons.attach_money,
                  text: "exchange_cash".tr,
                ),
              ))
        ]),
      ),
    );
  }
}
