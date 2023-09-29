import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/newpassword/new_password_page.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/get_height.dart';

import '../../../utils/colors.dart';
import '../../../utils/widgets/get_width.dart';

// ignore: must_be_immutable
class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  var emailController = TextEditingController();
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
              hinttext: "Your Email",
              controller: emailController,
              validator: () {},
              suffix: Icons.email,
            ),
            GetHeight(height: Get.height * 0.04),
            SizedBox(
              width: Get.width * 0.87,
              child: CustomButton(
                  buttomColor: AppColors.fifthcolor,
                  onpressed: () {
                    Get.to(() => NewPasswordPage());
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
                  ])),
            ),
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
