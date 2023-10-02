import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/resetpassword/reset_password_controller.dart';
import 'package:padilni/presentation/auth/widgets/custom_pin_put.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/loader.dart';

import '../../../utils/colors.dart';
import '../../../utils/widgets/get_width.dart';

// ignore: must_be_immutable
class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  var emailController = TextEditingController();
  var codeController = TextEditingController();
  final ResetPasswordController controller =
      Get.put<ResetPasswordController>(ResetPasswordController());
  var pinPutController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "Reset Password"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetHeight(height: Get.height * 0.06),
            Center(
              child: Column(
                children: [
                  Text(
                    "Please enter your email to receive a ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text("link to create a new password via email",
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
            ),
            GetHeight(height: Get.height * 0.01),
            CustomFormField(
              onChanged: (v) {
                controller.forgotPasswordStatus.value = RequestStatus.begin;
              },
              hinttext: "Your Email",
              controller: emailController,
              validator: (v) {
                return;
              },
              suffix:SvgPicture.asset( "assets/images/email.svg"),
            ),
            GetHeight(height: Get.height * 0.04),
            Obx(() =>
                controller.forgotPasswordStatus.value == RequestStatus.success
                    ? Center(
                        child: CustomPinPut(controller: pinPutController,
                        validator: (val){

                          if(val!.isEmpty && val.length!=4)
                          {
                            return "Enter valid PinPut";
                          } 
                          return null ;
                        },)
                      )
                    : Container()),
            SizedBox(
              height: Get.height * 0.05,
            ),
            SizedBox(
                width: Get.width * 0.87,
                child: Obx(() {
                  switch (controller.forgotPasswordStatus.value) {
                    case RequestStatus.loading:
                      return const Loader();
                    case RequestStatus.begin:
                      return CustomButton(
                          buttomColor: AppColors.fifthcolor,
                          onpressed: () {
                            controller.forgotPassword(emailController.text);
                          },
                          child: Row(children: [
                            GetWidth(width: Get.width * 0.33),
                            Text(
                              "Send",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            GetWidth(width: Get.width * 0.16),
                            SizedBox(
                                height: Get.height * 0.026,
                                child: const VerticalDivider(
                                  color: AppColors.seventhColor,
                                )),
                            GetWidth(width: Get.width * 0.025),
                            SvgPicture.asset("assets/images/send_icon.svg")
                          ]));
                    case RequestStatus.success:
                      return controller.verifyStatus.value ==
                              RequestStatus.loading
                          ? Loader()
                          : CustomButton(
                              buttomColor: AppColors.fifthcolor,
                              onpressed: () {
                                controller.forgotPasswordVerify(
                                    emailController.text, pinPutController.text);
                              },
                              child: Row(children: [
                                GetWidth(width: Get.width * 0.33),
                                Text(
                                  "Verify",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(color: AppColors.primaryColor),
                                ),
                                GetWidth(width: Get.width * 0.16),
                                SizedBox(
                                    height: Get.height * 0.026,
                                    child: const VerticalDivider(
                                      color: AppColors.seventhColor,
                                    )),
                                GetWidth(width: Get.width * 0.025),
                                Icon(
                                  Icons.verified,
                                  color: Colors.white,
                                )
                              ]));
                    default:
                      return CustomButton(
                          buttomColor: AppColors.fifthcolor,
                          onpressed: () {
                            controller.forgotPassword(emailController.text);
                          },
                          child: Row(children: [
                            GetWidth(width: Get.width * 0.33),
                            Text(
                              "Send",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            GetWidth(width: Get.width * 0.16),
                            SizedBox(
                                height: Get.height * 0.026,
                                child: const VerticalDivider(
                                  color: AppColors.seventhColor,
                                )),
                            GetWidth(width: Get.width * 0.025),
                            SvgPicture.asset("assets/images/send_icon.svg")
                          ]));
                  }
                })),
            GetHeight(height: Get.height * 0.09),
            Padding(
              padding: EdgeInsets.all(Get.width * 0.08),
              child: Image.asset("assets/images/reset_image.png"),
            )
          ],
        ),
      ),
    );
  }
}