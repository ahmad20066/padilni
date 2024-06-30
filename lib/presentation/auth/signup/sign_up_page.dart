import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/login/controller/login_controller.dart';
import 'package:padilni/presentation/auth/signup/logic/sign_up_controller.dart';
import 'package:padilni/presentation/auth/widgets/custom_row_button.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import '../../../utils/colors.dart';

// ignore: must_be_immutable
class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var signUpKey = GlobalKey<FormState>();

  var signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(text: "signup".tr),
        body: SingleChildScrollView(
          child: Form(
            key: signUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetHeight(height: Get.height * 0.05),
                Center(
                  child: Text(
                    "add_details".tr,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                GetHeight(height: Get.height * 0.03),
                CustomFormField(
                  hinttext: "name".tr,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "required_field".tr;
                    }
                    if (!GetUtils.isUsername(v)) {
                      return "invalid_username".tr;
                    }
                    return null;
                  },
                  controller: nameController,
                  // suffix: SvgPicture.asset("assets/images/person.svg"),
                  suffix: Icon(
                    Icons.person,
                    size: 19.sp,
                  ),
                ),
                GetHeight(height: Get.height * 0.01),
                CustomFormField(
                  hinttext: "email".tr,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "required_field".tr;
                    }
                    if (!GetUtils.isEmail(v)) {
                      return "email_valid".tr;
                    }
                    return null;
                  },
                  controller: emailController,
                  // suffix: SvgPicture.asset("assets/images/email.svg"),
                  suffix: Icon(
                    Icons.email,
                    size: 19.sp,
                  ),
                ),
                GetHeight(height: Get.height * 0.01),
                CustomFormField(
                  hinttext: "phone".tr,
                  validator: (v) {
                    if (v!.isEmpty) {
                      return "required_field".tr;
                    }
                    if (!GetUtils.isPhoneNumber(v)) {
                      return "phone_valid".tr;
                    }
                    return null;
                  },
                  controller: phoneController,
                  // suffix: SvgPicture.asset("assets/images/email.svg"),
                  type: TextInputType.number,
                  suffix: Icon(
                    Icons.phone,
                    size: 19.sp,
                  ),
                ),
                GetHeight(height: Get.height * 0.01),
                Obx(
                  () => CustomFormField(
                      obscure: signUpController.passwordObscure.value,
                      hinttext: "password".tr,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "password_valid".tr;
                        }
                        return null;
                      },
                      controller: passwordController,
                      suffix: IconButton(
                          onPressed: () {
                            signUpController.passwordObscure.value =
                                !signUpController.passwordObscure.value;
                          },
                          icon: signUpController.passwordObscure.isTrue
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 19.sp,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 19.sp,
                                ))),
                ),
                GetHeight(height: Get.height * 0.01),
                Obx(() => CustomFormField(
                      obscure: signUpController.confirmPasswordObscure.value,
                      suffix: IconButton(
                          onPressed: () {
                            signUpController.confirmPasswordObscure.value =
                                !signUpController.confirmPasswordObscure.value;
                          },
                          icon: signUpController.confirmPasswordObscure.isTrue
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 19.sp,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 19.sp,
                                )),
                      hinttext: "confirm_password".tr,
                      validator: (v) {
                        if (v!.isEmpty) {
                          return "required_field".tr;
                        }
                        if (v.compareTo(passwordController.text) != 0) {
                          return "check_the_password_again".tr;
                        }
                        return null;
                      },
                      controller: confirmPasswordController,
                    )),
                GetHeight(height: Get.height * 0.02),
                SizedBox(
                  width: Get.width * 0.87,
                  child: Obx(
                    () => signUpController.requeststatus.value ==
                            RequestStatus.loading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            buttomColor: AppColors.fifthcolor,
                            onpressed: () {
                              if (signUpKey.currentState!.validate()) {
                                signUpController.userRegister(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    phone: phoneController.text,
                                    name: nameController.text);
                              }
                            },
                            child: Row(children: [
                              GetWidth(width: Get.width * 0.3),
                              Text(
                                "signup".tr,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: AppColors.primaryColor,
                                        fontSize: 18.sp),
                              ),
                              GetWidth(width: Get.width * 0.14),
                              SizedBox(
                                  height: Get.height * 0.026,
                                  child: const VerticalDivider(
                                    color: AppColors.seventhColor,
                                  )),
                              GetWidth(width: Get.width * 0.025),
                              SvgPicture.asset("assets/images/sign_up_icon.svg")
                            ])),
                  ),
                ),
                GetHeight(height: Get.height * 0.07),
                Column(
                  children: [
                    Text(
                      "or".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.fourthColor),
                    ),
                    Text("sign_up_with".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.fourthColor))
                  ],
                ),
                GetHeight(height: Get.height * 0.03),
                SizedBox(
                  width: Get.width * 0.87,
                  child: CustomButton(
                      buttomColor: AppColors.facebookColor,
                      onpressed: () {
                        Get.find<LoginController>().facebookLogin();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/Facebook.svg"),
                          GetWidth(width: Get.width * 0.03),
                          Text(
                            "signup_with_facebook".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      )),
                ),
                GetHeight(height: Get.height * 0.01),
                SizedBox(
                  width: Get.width * 0.87,
                  child: CustomButton(
                      buttomColor: AppColors.googleColor,
                      onpressed: () {
                        // Get.find<LoginController>().googlelogin();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/google.svg"),
                          GetWidth(width: Get.width * 0.03),
                          Text(
                            "signup_with_google".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      )),
                ),
                GetHeight(height: Get.height * 0.03),
                CustomRowButton(
                    text1: "already_have_an_acoount".tr,
                    text2: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        " " + "login".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.googleColor),
                      ),
                    )),
                SizedBox(
                  height: 50.h,
                )
              ],
            ),
          ),
        ));
  }
}
