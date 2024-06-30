import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:padilni/presentation/profile/controllers/edit_profile_controller.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(EditProfileController());
    return Scaffold(
      appBar: CustomAppBar(
        text: "edit_profile".tr,
        hasHomeIcon: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            GetBuilder<EditProfileController>(builder: (_) {
              return CircleAvatar(
                radius: 60.r,
                backgroundColor: Colors.transparent,
                backgroundImage: controller.image == null
                    ? AssetImage("assets/images/person.png")
                    : FileImage(controller.image!) as ImageProvider,
              );
            }),
            TextButton.icon(
                onPressed: () {
                  controller.pickImage();
                },
                icon: Icon(Icons.image_outlined),
                label: Text("pick_an_image".tr)),
            SizedBox(
              height: 20.h,
            ),
            CustomFormField(
                hinttext: "name".tr,
                controller: controller.nameController,
                validator: (v) {}),
            CustomFormField(
                hinttext: "phone".tr,
                controller: controller.phoneController,
                type: TextInputType.number,
                validator: (v) {}),
            CustomFormField(
                onTap: () async {
                  final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now());
                  if (date != null) {
                    final formattedDate = DateFormat("yyyy-MM-dd").format(date);
                    controller.birthController.text = formattedDate;
                  }
                },
                hinttext: "birthDate".tr,
                controller: controller.birthController,
                validator: (v) {}),
            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 40.w,
                  ),
                  Flexible(
                    child: RadioListTile<String>(
                      title: Text(
                        'male'.tr,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      value: 'male',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value!;
                      },
                    ),
                  ),
                  Flexible(
                    child: RadioListTile<String>(
                      title: Text(
                        'female'.tr,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                      value: 'female',
                      groupValue: controller.gender.value,
                      onChanged: (value) {
                        controller.gender.value = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    width: 40.w,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Obx(() => controller.status.value == RequestStatus.loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : CustomButton(
                    onpressed: () {
                      controller.updateProfile();
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
