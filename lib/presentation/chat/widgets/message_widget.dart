import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:padilni/models/message/message_model.dart';
import 'package:padilni/presentation/chat/controllers/chat_controller.dart';
import 'package:padilni/utils/colors.dart';

class MessageWidget extends StatelessWidget {
  final MessageModel message;
  const MessageWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.h),
        child: Align(
          alignment: message.is_mine
              ? AlignmentDirectional(0.9, 1)
              : AlignmentDirectional(-0.9, 1),
          child: GetBuilder<ChatController>(builder: (controller) {
            return Column(
              crossAxisAlignment: message.is_mine
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  constraints: BoxConstraints(maxWidth: Get.width * 0.6),
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                      color: !message.is_mine
                          ? Colors.grey[300]
                          : !message.sent
                              ? Color.fromRGBO(246, 229, 206, 1)
                              : AppColors.secondaryColor,
                      boxShadow: [
                        if (message.is_mine)
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.22),
                              blurRadius: 14),
                      ],
                      borderRadius: BorderRadius.circular(10)
                      // borderRadius: BorderRadius.only(
                      //   topLeft: Radius.circular(14),
                      //   bottomLeft: !message.is_mine
                      //       ? Radius.circular(0)
                      //       : Radius.circular(14),
                      //   bottomRight: message.is_mine
                      //       ? Radius.circular(0)
                      //       : Radius.circular(14),
                      //   topRight: Radius.circular(14),
                      // ),
                      ),
                  child: Text(
                    message.body,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                if (DateTime.tryParse(message.created_at) != null)
                  Text(
                    intl.DateFormat('MMM d, h:mm a')
                        .format(DateTime.parse(message.created_at)),
                    style: TextStyle(fontSize: 10.sp),
                  )
              ],
            );
          }),
        ),
      ),
    );
  }
}
//Color.fromRGBO(246, 229, 206, 1)