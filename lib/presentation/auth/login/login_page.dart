import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/login/controller/login_controller.dart';
import 'package:padilni/presentation/auth/resetpassword/reset_password_page.dart';
import 'package:padilni/presentation/auth/widgets/custom_row_button.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import 'package:padilni/utils/widgets/loader.dart';
import '../../../utils/colors.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginController = Get.put<LoginController>(LoginController());
  GlobalKey<FormState> _formKey = GlobalKey();
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          text: "login".tr,
          hasLeading: false,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetHeight(height: Get.height * 0.07),
                Center(
                  child: Text(
                    "login_description".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontSize: Get.width * 0.035),
                  ),
                ),
                GetHeight(height: Get.height * 0.03),
                CustomFormField(
                  hinttext: "email".tr,
                  validator: (v) {
                    final bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(v!);
                    if (!emailValid) {
                      return "email_valid".tr;
                    }
                    return null;
                  },
                  controller: emailController,
                  suffix: Icon(
                    Icons.email,
                    size: 19.sp,
                  ),
                ),
                GetHeight(height: Get.height * 0.01),
                Obx(
                  () => CustomFormField(
                      obscure: controller.passwordObscure.value,
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
                            controller.passwordObscure.value =
                                !controller.passwordObscure.value;
                          },
                          icon: controller.passwordObscure.isTrue
                              ? Icon(
                                  Icons.visibility_off,
                                  size: 19.sp,
                                )
                              : Icon(
                                  Icons.visibility,
                                  size: 19.sp,
                                ))),
                ),
                GetHeight(height: Get.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 30.w,
                    ),
                    Obx(
                      () => Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.green,
                        value: loginController.rememberMePressed.value,
                        onChanged: (isChecked) {
                          loginController.onRemebermePressed();
                        },
                        side: MaterialStateBorderSide.resolveWith(
                          (Set<MaterialState> states) {
                            return const BorderSide(
                                color: AppColors.fourthColor);
                          },
                        ),
                      ),
                    ),
                    Text(
                      "remember_me".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.fourthColor),
                    )
                  ],
                ),
                GetHeight(height: Get.height * 0.02),
                SizedBox(
                    width: Get.width * 0.87,
                    child: Obx(() {
                      return controller.status.value == RequestStatus.loading
                          ? const Loader()
                          : CustomButton(
                              buttomColor: AppColors.fifthcolor,
                              onpressed: () {
                                if (_formKey.currentState!.validate()) {
                                  controller.login(emailController.text,
                                      passwordController.text);
                                }
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "login".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.primaryColor),
                                    ),
                                    // GetWidth(width: Get.width * 0.17),
                                    SizedBox(
                                        height: Get.height * 0.026,
                                        child: const VerticalDivider(
                                          color: Colors.white,
                                        )),
                                    GetWidth(width: Get.width * 0.025),
                                    SvgPicture.asset(
                                      "assets/images/send_icon.svg",
                                      color: Colors.white,
                                    )
                                  ]));
                    })),
                GetHeight(
                  height: Get.height * 0.035,
                ),
                Center(
                  child: CustomRowButton(
                      text1: "${"forgot_password".tr} ",
                      text2: InkWell(
                        onTap: () {
                          Get.to(() => ResetPasswordPage());
                        },
                        child: Text(
                          "${"click_here".tr}",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.secondaryColor),
                        ),
                      )),
                ),
                GetHeight(height: Get.height * 0.03),
                Column(
                  children: [
                    Text(
                      "or".tr,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.fourthColor),
                    ),
                    Text("login_with".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.fourthColor))
                  ],
                ),
                GetHeight(height: Get.height * 0.02),
                SizedBox(
                  width: Get.width * 0.87,
                  child: CustomButton(
                      buttomColor: AppColors.facebookColor,
                      onpressed: () {
                        controller.facebookLogin();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/Facebook.svg"),
                          GetWidth(width: Get.width * 0.03),
                          Text(
                            "login_with_facebook".tr,
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
                        // controller.googlelogin();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("assets/images/google.svg"),
                          GetWidth(width: Get.width * 0.03),
                          Text(
                            "login_with_google".tr,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.primaryColor),
                          )
                        ],
                      )),
                ),
                GetHeight(height: Get.height * 0.03),
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/signup");
                  },
                  child: CustomRowButton(
                      text1: "dont_have_account".tr,
                      text2: Text(
                        " " + "signup".tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.googleColor),
                      )),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ],
            ),
          ),
        ));
  }
}
