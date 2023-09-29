import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/custom_text_form.dart';
import 'package:padilni/utils/widgets/get_height.dart';
import 'package:padilni/utils/widgets/get_width.dart';
import '../../../utils/colors.dart';

// ignore: must_be_immutable
class NewPasswordPage extends StatelessWidget {
   NewPasswordPage({super.key});
 var emailController = TextEditingController();
 var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
    appBar: const CustomAppBar(text: "New Password") ,
    body: SingleChildScrollView(
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [ 
      
          GetHeight(height:Get.height*0.07 ) ,
    
          Center(
            child: Text("Please enter your new password", 
            style: Theme.of(context).textTheme.bodySmall,),
          ) , 
    
          GetHeight(height: Get.height*0.03), 
    
          CustomFormField(hinttext: "Password",
          validator: (){ },
          controller:emailController ,
          suffix: Icons.lock_open,
          ),  
          GetHeight(height: Get.height*0.01),
          CustomFormField(hinttext: "Confirm Password",
          validator: (){ },
          controller:emailController ,
          suffix: Icons.lock,
          ),  
                    
           GetHeight(height: Get.height*0.02),
          SizedBox( 
            width: Get.width*0.87,
            child: CustomButton(
              buttomColor:AppColors.fifthcolor,
              onpressed: (){}, child: Row(
              children:[ 
                GetWidth(width: Get.width*0.3),
              Text("Confirm" , style: Theme.of(context).textTheme.bodyMedium!
        .copyWith(color: AppColors.primaryColor),),
              GetWidth(width: Get.width*0.15), 
               SizedBox( 
                        height: Get.height*0.026,
                        child:const  VerticalDivider(
                          color: AppColors.seventhColor,
                        )),
                        GetWidth(width: Get.width*0.025),
              SvgPicture.asset("assets/images/sign_up_icon.svg")
                 ] )), 
          ) ,
  
    
        ],
      ),
    )
    );
  }
}