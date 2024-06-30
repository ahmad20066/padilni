import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/change_password/controllers/change_password_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    return Scaffold(
      appBar: CustomAppBar(
        text: "change_password".tr,
        hasHomeIcon: false,
      ),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
              width: double.infinity,
            ),
            CustomFormField(
                hinttext: "current_password".tr,
                controller: controller.currentPasswordController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "current_password_required".tr;
                  }
                }),
            SizedBox(
              height: 20.h,
            ),
            CustomFormField(
                hinttext: "new_password".tr,
                controller: controller.newPasswordController,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "new_password_required".tr;
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
                    onpressed: () {
                      if (controller.formKey.currentState!.validate()) {
                        controller.changePassword();
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
