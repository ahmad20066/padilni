import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/exchange/controllers/exchange_via_item_controller.dart';
import 'package:padilni/presentation/exchange/widgets/my_item_widget.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/custom_toasts.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class ExchangeViaItemScreen extends StatelessWidget {
  const ExchangeViaItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ExchangeViaItemController controller =
        Get.put(ExchangeViaItemController());
    return Scaffold(
      appBar: CustomAppBar(
        text: "my_items".tr,
        hasHomeIcon: false,
      ),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
                width: double.infinity,
              ),
              Align(
                alignment: Alignment(-0.5, 1),
                child: SizedBox(
                  width: 200.w,
                  child: Text(
                    "select_an_item".tr,
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              GetBuilder<ExchangeViaItemController>(builder: (_) {
                return Obx(() {
                  switch (controller.myItemsStatus.value) {
                    case RequestStatus.loading:
                      return CircularProgressIndicator();
                    case RequestStatus.nodata:
                      return NoData();
                    case RequestStatus.success:
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.myItems.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MyItemWidget(
                              item: controller.myItems[index],
                              isSelected: controller.selectedItem == null
                                  ? false
                                  : controller.selectedItem!.id ==
                                      controller.myItems[index].id);
                        },
                      );
                    default:
                      return SizedBox.shrink();
                  }
                });
              }),
              SizedBox(
                height: 30.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 45.sp),
                child: TextFormField(
                    controller: controller.extraMoneyController,
                    validator: (v) {},
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                      hintText: "ask_extra".tr,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: AppColors.secondaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: AppColors.secondaryColor)),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: Get.width * 0.04),
                      border: InputBorder.none,
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 45.sp),
                child: TextFormField(
                    controller: controller.offerMoneyController,
                    validator: (v) {},
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: Get.width * 0.04),
                    decoration: InputDecoration(
                      hintText: "offer_money".tr,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: AppColors.secondaryColor)),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.red)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                              BorderSide(color: AppColors.secondaryColor)),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: Get.width * 0.04),
                      border: InputBorder.none,
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              Obx(() => controller.exchangeStatus.value == RequestStatus.loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: REdgeInsets.symmetric(horizontal: 35.w),
                      child: CustomButton(
                          onpressed: () {
                            if (controller.formKey.currentState!.validate()) {
                              if (controller.selectedItem == null) {
                                CustomToasts.ErrorDialog(
                                    "Please select an item");
                                return;
                              }
                              controller.exchangeItem();
                            }
                          },
                          child: Text(
                            "next".tr,
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.sp),
                          ),
                          buttomColor: AppColors.secondaryColor),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
