import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/presentation/exchange/controllers/payment_controller.dart';
import 'package:padilni/presentation/exchange/widgets/confirm_dialog.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';

class PriceScreen extends StatelessWidget {
  const PriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print(Shared.getstring("fcm_token"));
    final controller = Get.put(PaymentController());
    return Scaffold(
      appBar: CustomAppBar(text: "payment".tr),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text("write_price".tr),
            SizedBox(
              height: 20.h,
              width: double.infinity,
            ),
            CustomFormField(
                hinttext: "price".tr,
                type: TextInputType.number,
                controller: controller.priceController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "Field is required";
                  }
                }),
            SizedBox(
              height: 40.h,
            ),
            Obx(() => controller.status.value == RequestStatus.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    onpressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await showDialog(
                            context: context,
                            builder: (context) {
                              return ConfirmDialog();
                            });
                        if (result) {
                          controller.exchangeWithCash();
                        } else {}
                      }
                    },
                    child: Text(
                      "submit".tr,
                      style: TextStyle(color: Colors.white),
                    ),
                    buttomColor: AppColors.secondaryColor))
          ],
        ),
      ),
    );
  }
}
