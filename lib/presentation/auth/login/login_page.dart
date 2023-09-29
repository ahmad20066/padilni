import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/login/controller/login_controller.dart';
import 'package:padilni/presentation/auth/resetpassword/reset_password_page.dart';
import 'package:padilni/presentation/auth/signup/sign_up_page.dart';
import 'package:padilni/presentation/auth/widgets/custom_row_button.dart';
import 'package:padilni/presentation/home/screen/home_page.dart';
import 'package:padilni/presentation/main_screen/screen/main_screen.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import '../../../utils/colors.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var loginController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: "Login"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GetHeight(height: Get.height * 0.07),
              Center(
                child: Text(
                  "Log in with your email and password",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
              GetHeight(height: Get.height * 0.03),
              CustomFormField(
                hinttext: "Your Email",
                validator: (v) {
                  return;
                },
                controller: emailController,
                suffix: Icons.email,
              ),
              GetHeight(height: Get.height * 0.01),
              CustomFormField(
                hinttext: "Password",
                validator: (v) {
                  return;
                },
                controller: emailController,
                suffix: Icons.lock,
              ),
              GetHeight(height: Get.height * 0.005),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                          return const BorderSide(color: AppColors.fourthColor);
                        },
                      ),
                    ),
                  ),
                  Text(
                    "Remember me ",
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
                child: CustomButton(
                    buttomColor: AppColors.fifthcolor,
                    onpressed: () {
                      Get.to(() => MainScreen());
                    },
                    child: Row(children: [
                      GetWidth(width: Get.width * 0.34),
                      Text(
                        "Login",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      GetWidth(width: Get.width * 0.17),
                      SizedBox(
                          height: Get.height * 0.026,
                          child: const VerticalDivider(
                            color: AppColors.seventhColor,
                          )),
                      GetWidth(width: Get.width * 0.025),
                      SvgPicture.asset("assets/images/send_icon.svg")
                    ])),
              ),
              GetHeight(
                height: Get.height * 0.035,
              ),
              Center(
                child: CustomRowButton(
                    text1: "Forgot Your Password?  Click",
                    text2: InkWell(
                      onTap: () {
                        Get.to(() => ResetPasswordPage());
                      },
                      child: Text(
                        " here",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.secondaryColor),
                      ),
                    )),
              ),
              GetHeight(height: Get.height * 0.09),
              Column(
                children: [
                  Text(
                    "Or",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.fourthColor),
                  ),
                  Text("Login With",
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
                    onpressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/Facebook.svg"),
                        GetWidth(width: Get.width * 0.03),
                        Text(
                          "Login With Facebook",
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
                    onpressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/images/google.svg"),
                        GetWidth(width: Get.width * 0.03),
                        Text(
                          "Login With Google",
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
                  Get.to(() => SignUpPage());
                },
                child: CustomRowButton(
                    text1: "Don't have an account ?",
                    text2: Text(
                      "sign up",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.googleColor),
                    )),
              )
            ],
          ),
        ));
  }
}
