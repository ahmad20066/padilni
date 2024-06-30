import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:padilni/data/endpoints.dart';
import 'package:padilni/models/item_model/add_item_model.dart';
import 'package:padilni/presentation/onboarding/widget/page_view_widget.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPageView extends StatefulWidget {
  final List<AddImage> images;
  const DetailsPageView({super.key, required this.images});

  @override
  State<DetailsPageView> createState() => _DetailsPageViewState();
}

class _DetailsPageViewState extends State<DetailsPageView> {
  int cnt = 0;
  var controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height * 0.44,
        child: Stack(alignment: Alignment.topCenter, children: [
          SizedBox(
            height: Get.height * 0.4,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                    onPageChanged: (value) {
                      setState(() {
                        cnt = value;
                      });
                    },
                    controller: controller,
                    children: widget.images
                        .map(
                          (e) => CustomPageWidget(
                            imagePath: e.image!,
                            height: Get.height * 0.39,
                          ),
                        )
                        .toList()),
                Padding(
                  padding: EdgeInsets.all(Get.width * 0.04),
                  child: Column(
                    children: [
                      GetHeight(height: Get.height * 0.25),
                      SmoothPageIndicator(
                        controller: controller,
                        count: widget.images.length,
                        effect: const WormEffect(
                            activeDotColor: AppColors.thirdColor,
                            dotColor: AppColors.primaryColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: Get.height * 0.44,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(Get.width * 0.1)),
                  height: 114.h,
                  width: 290.w,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10.w,
                      ),
                      GetWidth(width: Get.width * 0.01),
                      InkWell(
                        onTap: () {
                          controller.jumpToPage(
                              widget.images.indexOf(widget.images.first));
                        },
                        child: CircleAvatar(
                          radius: 47.r,
                          backgroundImage: NetworkImage(
                              imagesBaseUrl + widget.images.first.image!),
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      if (widget.images.length > 1)
                        Row(
                          children: [
                            GetWidth(width: Get.width * 0.01),
                            InkWell(
                              onTap: () {
                                controller.jumpToPage(
                                    widget.images.indexOf(widget.images[1]));
                              },
                              child: CircleAvatar(
                                radius: 47.r,
                                backgroundImage: NetworkImage(
                                    imagesBaseUrl + widget.images[1].image!),
                              ),
                            ),
                          ],
                        ),
                      if (widget.images.length > 2)
                        Row(
                          children: [
                            GetWidth(width: Get.width * 0.01),
                            InkWell(
                              onTap: () {
                                controller.jumpToPage(
                                    widget.images.indexOf(widget.images.last));
                              },
                              child: CircleAvatar(
                                radius: Get.width * 0.1,
                                backgroundImage: NetworkImage(
                                    imagesBaseUrl + widget.images.last.image!),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
