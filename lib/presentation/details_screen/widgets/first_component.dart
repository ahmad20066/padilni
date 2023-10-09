import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/onboarding/widget/page_view_widget.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsPageView extends StatefulWidget {
  const DetailsPageView({super.key});

  @override
  State<DetailsPageView> createState() => _DetailsPageViewState();
}

class _DetailsPageViewState extends State<DetailsPageView> {
  int cnt =0 ; 
var controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
          height: Get.height*0.44,
          child: Stack( 
            alignment: Alignment.topCenter,
            children: [  
              SizedBox(  
                height: Get.height*0.4,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    PageView( 
                    onPageChanged: (value) {
                      setState(() {
                        cnt= value;
                      });  },
               controller: controller,
               children: [ 
                     CustomPageWidget(imagePath: "assets/images/onboarding1.png",height: Get.height*0.39,),
                     CustomPageWidget(imagePath: "assets/images/onboarding2.png",height: Get.height*0.39,),
                     CustomPageWidget(imagePath: "assets/images/onboarding3.jpg",height: Get.height*0.39,) 
               ],
           ),  
              Padding(
         padding: EdgeInsets.all(Get.width*0.04),
         child: Column(
           children: [ 
            GetHeight(height: Get.height*0.25) ,
             SmoothPageIndicator(
             controller:controller,
             count:3,
             effect: const WormEffect(
             activeDotColor: AppColors.thirdColor ,
             dotColor: AppColors.primaryColor
        ),),
           ],
         ),)],),) , 
          SizedBox(
            height: Get.height*0.42,
            child: Stack( 
              alignment: Alignment.bottomCenter,
              children: [
                Container( 
                  decoration: BoxDecoration(
                    color: AppColors.secondaryColor,
                    borderRadius: BorderRadius.circular(Get.width*0.1)),
                  height: Get.height*0.1 ,
                  width: Get.width*0.64, 
                  child: Row(children: [ 
                    GetWidth(width: Get.width*0.01),
                    InkWell(
                      onTap: (){ 
                        controller.jumpToPage(0);

                      },
                      child: CircleAvatar( 
                        radius: Get.width*0.1,
                      backgroundImage: AssetImage("assets/images/onboarding1.png"),),
                    ) ,
                       GetWidth(width: Get.width*0.01),

                       InkWell(
                        onTap: (){
                      controller.jumpToPage(1);
                        },
                         child: CircleAvatar(  
                                backgroundImage: AssetImage("assets/images/onboarding2.png"),
                               radius: Get.width*0.1,),
                       ),

                      GetWidth(width: Get.width*0.01),

                       InkWell(
                        onTap: (){
                controller.jumpToPage(2);
                        },
                         child: CircleAvatar( 
                    radius: Get.width*0.1,
                   backgroundImage: AssetImage("assets/images/onboarding3.jpg"),),
                       )
                  ]),
                ),
              ],
            ),
          )
           ] ));
  }
}