import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:padilni/models/categories/categories_model.dart';
import 'package:padilni/presentation/add_item/controllers/add_item_controller.dart';
import 'package:padilni/presentation/add_item/widgets/add_textfield.dart';
import 'package:padilni/presentation/add_item/widgets/area_dropdown.dart';
import 'package:padilni/presentation/add_item/widgets/categories_dropdown.dart';
import 'package:padilni/presentation/add_item/widgets/city_drop_down.dart';
import 'package:padilni/presentation/add_item/widgets/country_drop_down.dart';
import 'package:padilni/presentation/add_item/widgets/images_container.dart';
import 'package:padilni/presentation/add_item/widgets/select_state_widget.dart';
import 'package:padilni/presentation/add_item/widgets/sub_category_dropdown.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';
import 'package:padilni/utils/widgets/home_appbar.dart';

import '../../../utils/widgets/custom_button.dart';

class AddItemScreen extends StatelessWidget {
  AddItemScreen({super.key});
  final AddItemController controller = Get.put(AddItemController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppbar(
        text: !controller.isEdit ? "add_item".tr : "edit_item".tr,
        height: 0.08,
        iconColor: Colors.white,
        hasLeading: true,
        color: controller.color,
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.05,
              ),
              Align(
                alignment: Alignment(-0.7, 1),
                child: SizedBox(
                  width: 228.w,
                  child: Text(
                    "please_add_details".tr,
                    style: TextStyle(fontSize: 13.sp),
                  ),
                ),
              ),
              Divider(
                thickness: 2,
                indent: Get.width * 0.07,
                endIndent: Get.width * 0.07,
              ),
              AddTextField(
                controller: controller.nameController,
                hint: "item_name".tr,
                validator: (v) {
                  if (v!.isEmpty) {
                    return "name is required";
                  }
                },
                height: Get.height * 0.07,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              AddTextField(
                controller: controller.priceController,
                keyboardType: TextInputType.number,
                hint: "item_price".tr,
                height: Get.height * 0.07,
                validator: (v) {
                  // if (v!.isEmpty) {
                  //   return "price is required";
                  // }
                  if (v!.isNotEmpty && double.tryParse(v!) == null) {
                    return "price should be a number";
                  }
                },
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GetBuilder<AddItemController>(builder: (_) {
                return CountryDropDown(countries: controller.countries);
              }),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(
                () => CityDropDown(cities: controller.cities.value),
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Obx(() => AreaDropDown(areas: controller.areas.value)),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CategoriesDropDown(categories: controller.categories),
              SizedBox(
                height: Get.height * 0.02,
              ),
              GetBuilder<AddItemController>(builder: (_) {
                print("aaaaa");
                print(controller.subCategories);
                return SubCategoryDropDown();
              }),
              SizedBox(
                height: Get.height * 0.02,
              ),
              AddTextField(
                controller: controller.descriptionController,
                hint: "description".tr,
                maxLines: 6,
                validator: (v) {
                  // if (v!.isEmpty) {
                  //   return "description is required";
                  // }
                },
                height: Get.height * 0.25,
                // maxLines: 7,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              SelectStateWidget(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Align(
                  alignment: AlignmentDirectional(-0.6, 1),
                  child: Text("image".tr)),
              SizedBox(
                height: Get.height * 0.02,
              ),
              ImagesContainer(),
              SizedBox(
                height: Get.height * 0.05,
              ),
              Obx(
                () => controller.status.value == RequestStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : CustomButton(
                        onpressed: () {
                          if (controller.formKey.currentState!.validate()) {
                            // if (controller.selectedArea.value == null) {
                            //   CustomToasts.ErrorDialog("location_required".tr);
                            //   return;
                            // }
                            if (controller.selectedcategoryId.value == null) {
                              CustomToasts.ErrorDialog("category_required".tr);
                              return;
                            }
                            if (controller.selectedsubCategoryId.value ==
                                null) {
                              CustomToasts.ErrorDialog(
                                  "sub_category_required".tr);
                              return;
                            }
                            if (controller.images.isEmpty) {
                              CustomToasts.ErrorDialog("image_required".tr);
                              return;
                            }
                            !controller.isEdit
                                ? controller.addItem()
                                : controller.editItem();
                          }
                        },
                        buttomColor: controller.color ?? AppColors.fifthcolor,
                        child: Text(
                          !controller.isEdit ? "add_item".tr : "edit_item".tr,
                          style:
                              TextStyle(color: Colors.white, fontSize: 17.sp),
                        )),
              ),
              SizedBox(
                height: Get.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
