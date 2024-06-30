import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/chat/controllers/chat_controller.dart';
import 'package:padilni/utils/colors.dart';

class MessageTextfield extends GetWidget<ChatController> {
  MessageTextfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Row(
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.02),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.12),
                  borderRadius: BorderRadius.circular(12)),
              child: TextFormField(
                onFieldSubmitted: (v) {
                  controller.sendMessage();
                },
                onChanged: (v) {
                  if (v.trim().isNotEmpty) {
                    controller.canSend(true);
                  } else {
                    controller.canSend(false);
                  }
                },
                controller: controller.messageController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: const Color.fromRGBO(0, 0, 0, 0.12),
                  contentPadding:
                      EdgeInsetsDirectional.only(start: Get.width * 0.04),
                  hintText: "type_something".tr,
                ),
              ),
            ),
          ),
          Obx(
            () => Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.12),
                  borderRadius: BorderRadius.circular(12)),
              child: IconButton(
                  onPressed: controller.canSend.isFalse
                      ? null
                      : () {
                          controller.sendMessage();
                        },
                  icon: Obx(() => Icon(
                        Icons.send,
                        color: controller.canSend.isTrue
                            ? AppColors.primaryColor
                            : Color.fromRGBO(85, 19, 19, 1),
                      ))),
            ),
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
    );
  }
}
