import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/onboarding/widget/contine_button.dart';
import 'package:padilni/presentation/onboarding/widget/page_view_widget.dart';
import 'package:padilni/presentation/onboarding/widget/skip_button.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  var controller = PageController(initialPage: 0);
  int cnt = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        body: Column(
          children: [
      Stack( 
        alignment: Alignment.bottomCenter,
       children: [
           SizedBox(
            height: Get.height*0.61,
            child:
            PageView( 
              onPageChanged: (value) {
                setState(() {
                  cnt= value;
                });  },
             controller: controller,
             children: [ 
                  CustomPageWidget(imagePath: "assets/images/onboarding1.png",height: Get.height*0.6,),
                  CustomPageWidget(imagePath: "assets/images/onboarding2.png",height: Get.height*0.6,),
                  CustomPageWidget(imagePath: "assets/images/onboarding3.jpg",height: Get.height*0.6,) 
             ],
         ),) , 
         Padding(
         padding:  EdgeInsets.all(Get.width*0.04),
         child: SmoothPageIndicator(
         controller:controller,
         count:3,
         effect: const WormEffect(
         activeDotColor: AppColors.thirdColor ,
         dotColor: AppColors.primaryColor
        ),),)
        ],
      ) , 
      GetHeight(height: Get.height*0.06), 
      Text("Splash Screen Image Preview",style: Theme.of(context).textTheme.bodyMedium,) ,
      GetHeight(height: Get.height*0.13),  
      cnt ==2 ? CustomButton(
        buttomColor: AppColors.secondaryColor,
        onpressed: (){
        Get.toNamed('/login');
      },
      child:Text("Get Started" , style: Theme.of(context).textTheme.bodyMedium!
      .copyWith(color: AppColors.primaryColor, 
      fontSize: Get.width*0.043,fontWeight: FontWeight.normal),),):
       Row(
        children: [
          SkipButton(image: "assets/images/skip_icon.png", text: "Skip", 
          onTap: (){      
            Get.toNamed("/login");
          }, 
          padding: EdgeInsets.fromLTRB(Get.width*0.13 , 0 , 0 , 0),),

           GetWidth(width: Get.width*0.3,),

           Continuebutton(image: "assets/images/continue_icon.png", text: "Next", 
          onTap: (){ 
          setState(() {
              cnt = cnt+1;
          });
            controller.nextPage(duration: const Duration(milliseconds: 7), curve:Curves.easeInOutBack);
          }, padding: EdgeInsets.fromLTRB(0 , 0 , Get.width*0.13 , 0),),
        ],
      ) 

      
 ],)),
 ); 

  }
}
