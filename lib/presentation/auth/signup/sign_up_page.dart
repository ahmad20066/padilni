import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
  var passwordController = TextEditingController();
  var nameController  = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var signUpKey = GlobalKey<FormState>(); 

  var signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(text: "Create Account"),
        body: SingleChildScrollView(
          child: Form(
            key: signUpKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GetHeight(height: Get.height * 0.05),
                Center(
                  child: Text(
                    "Add your details to sign up",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
                GetHeight(height: Get.height * 0.03),
                CustomFormField(
                  hinttext: "Name",
                  validator: (v) { 
                   if(v!.isEmpty)
                    {
                      return "required feild".tr;
                    } 
                   if(!GetUtils.isUsername(v))
                    {
                    return "unvalid username".tr;
                    }
                    return  null;
                  },
                  controller: nameController,
                  suffix: Icons.person,
                ),
                GetHeight(height: Get.height * 0.01),
                CustomFormField(
                  hinttext: "Email",
                  validator: (v) { 
                    if(v!.isEmpty)
                    { 
                      return "required feild".tr;
                    } 
                    if(!GetUtils.isEmail(v))
                    {
                      return "Invalid email address".tr;
                    } 
                    return null;
                  },

                  controller: emailController,
                  suffix: Icons.email,
                ),
                GetHeight(height: Get.height * 0.01),
                CustomFormField(
                  hinttext: "Password",
                  validator: (v) { 
                  if(v!.isEmpty)
                   {
                    return "required feild".tr;
                   }  
                   return null;
                  },
                  controller:passwordController,
                  suffix: Icons.lock,
                ),
                GetHeight(height: Get.height * 0.01),
                CustomFormField(
                  hinttext: "Confirm Password",
                  validator: (v) { 
                    if(v!.isEmpty)
                    {
                      return "required feild".tr;
                    } 
                    if(v!=passwordController.text)
                    {
                      return "password and this feild does not match".tr;
                    }
                    return null;
                  },
                  controller: confirmPasswordController,
                  suffix: Icons.lock,
                ),
                GetHeight(height: Get.height * 0.02),
                SizedBox(
                  width: Get.width * 0.87,
                  child: Obx(
                    ()=> signUpController.requeststatus.value == RequestStatus.loading ? 
                    const Center(child: CircularProgressIndicator(),) :
                     CustomButton(
                        buttomColor: AppColors.fifthcolor,
                        onpressed: () { 
                          if(signUpKey.currentState!.validate())
                          { 
                           signUpController.
                           userRegister(email: emailController.text,
                            password: passwordController.text, 
                            name: nameController.text)  ;                     
                          } 
                  
                        },
                        child: Row(children: [
                          GetWidth(width: Get.width * 0.3),
                          Text(
                            "Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: AppColors.primaryColor),
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
                      "Or",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.fourthColor),
                    ),
                    Text("Sign up with",
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
                            "Signup With Facebook",
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
                            "Signup With Google",
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
                    text1: "Already have an account?",
                    text2: Text(
                      " Sign in",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.googleColor),
                    ))
              ],
            ),
          ),
        ));
  }
}
