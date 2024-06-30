import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/chat/controllers/chat_controller.dart';
import 'package:padilni/presentation/chat/widgets/message_widget.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/request_status.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/loader.dart';
import 'package:padilni/utils/widgets/no_data.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChatController());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: BottomAppBar(
          color: Colors.white,
          child: Row(
            children: [
              Flexible(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                  child: TextFormField(
                      controller: controller.messageController,
                      onChanged: (v) {
                        if (v.trim().isNotEmpty) {
                          controller.canSend(true);
                        } else {
                          controller.canSend(false);
                        }
                      },
                      style: TextStyle(fontSize: 15.sp),
                      decoration: InputDecoration(
                        contentPadding: REdgeInsets.all(10),
                        filled: true,
                        fillColor: Colors.grey[200],
                        errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black45),
                            borderRadius: BorderRadius.circular(15)),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: AppColors.eighthColor,
                                fontSize: Get.width * 0.04),
                        hintText: "Message",
                        border: InputBorder.none,
                      )),
                ),
              ),
              Obx(() => IconButton(
                  onPressed: controller.canSend.isFalse
                      ? null
                      : () {
                          controller.sendMessage();
                        },
                  icon: Icon(
                    Icons.send,
                    color: controller.canSend.isTrue
                        ? AppColors.secondaryColor
                        : Colors.grey,
                  )))
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            height: 170.h,
            decoration: const BoxDecoration(
                color: AppColors.secondaryColor,
                boxShadow: [
                  BoxShadow(
                      color: AppColors.secondaryColor,
                      blurRadius: 16,
                      offset: Offset(0, 5))
                ],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(36),
                  bottomLeft: Radius.circular(36),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10.w,
                    ),
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Text(
                      controller.otherUser!.name!,
                      style: TextStyle(color: Colors.white, fontSize: 16.sp),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    CircleAvatar(
                      backgroundImage: controller.otherUser!.image == null
                          ? AssetImage("assets/images/person.png")
                          : NetworkImage(controller.otherUser!.image!)
                              as ImageProvider,
                      // backgroundColor: Colors.grey,
                    ),
                    Spacer(),
                  ],
                ),
              ],
            ),
          ),
          Obx(() {
            switch (controller.status.value) {
              case RequestStatus.loading:
                return SizedBox(height: 200.h, child: Loader());
              case RequestStatus.nodata:
                return SizedBox(height: 200.h, child: NoData());
              case RequestStatus.success:
                return Expanded(
                  child: Obx(() => ListView.builder(
                        reverse: true,
                        // padding: EdgeInsets.only(top: 20.h),
                        shrinkWrap: true,
                        itemCount: controller.messages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MessageWidget(
                            message:
                                controller.messages.reversed.toList()[index],
                          );
                        },
                      )),
                );
              default:
                return SizedBox.shrink();
            }
          })
        ],
      ),
      // appBar: AppBar(
      //   backgroundColor: AppColors.secondaryColor,
      //   toolbarHeight: 130.h,
      //   shadowColor: AppColors.shadowColor,
      //   elevation: 6,
      //   centerTitle: true,
      //   clipBehavior: Clip.hardEdge,
      //   title: Row(
      //     children: [
      //       CircleAvatar(
      //         // backgroundImage: NetworkImage(controller.user!.image!),
      //         backgroundColor: Colors.grey,
      //       ),
      //       SizedBox(
      //         width: 20.w,
      //       ),
      //       Text("Ahmad")
      //     ],
      //   ),
      // ),
    );
  }
}
