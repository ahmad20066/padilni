import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/models/banner/banner_model.dart';
import 'package:padilni/presentation/home/widgets/carousel/carousel_item.dart';
import 'package:padilni/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeCarousel extends StatefulWidget {
  final List<BannerModel> list;

  HomeCarousel({required this.list});

  @override
  _HomeCarouselState createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final PageController controller = PageController(initialPage: 0);
  int cnt = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            height: Get.height * 0.3,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  cnt = value;
                });
              },
              controller: controller,
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                return CarouselItem(image: widget.list[index].image);
              },
            ),
          ),
          Positioned(
            bottom: Get.height * 0.04,
            child: SmoothPageIndicator(
              controller: controller,
              count: widget.list.length,
              effect: WormEffect(
                activeDotColor: AppColors.thirdColor,
                dotColor: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
