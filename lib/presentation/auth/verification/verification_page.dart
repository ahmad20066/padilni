import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/widgets/custom_pin_put.dart';
import 'package:padilni/presentation/auth/widgets/custom_row_button.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/get_height.dart';

// ignore: must_be_immutable
class VerificationPage extends StatelessWidget {
   VerificationPage({super.key});
   
   var verifyTextController  = TextEditingController();
   var verifykey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "Verification"),
      body: SingleChildScrollView(
        child: Form(
          key: verifykey,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            GetHeight(height: Get.height*0.06),
              Center(
                child: Text("Please enter your verification code ", 
                style: Theme.of(context).textTheme.bodySmall,),
              ) ,   
              GetHeight(height: Get.height*0.05),
             CustomPinPut(validator: (val){
              return;
             
             }, controller: verifyTextController,),
             GetHeight(height: Get.height*0.05),
            CustomButton( 

              onpressed: (){ 
              if(verifykey.currentState!.validate() && verifyTextController.text.length==4)
              {  
                  print("zzz");
              }       
               },
                buttomColor: AppColors.secondaryColor, 
               child: Text("Verify" , style: Theme.of(context).textTheme.bodyMedium!
                      .copyWith(color: AppColors.primaryColor),)),
           
            GetHeight(height: Get.height*0.02), 
        
            CustomRowButton(text1: "Didn't receive the OTP ?", 
            text2: Text( "Resend" ,style: Theme.of(context).textTheme.
          bodySmall!.copyWith(color: AppColors.secondaryColor),)) , 
        
          Padding(
                padding:  EdgeInsets.all(Get.width*0.08),
                child:
          Image.asset("assets/images/verification_image.png"))
             
            ],
          ),
        ),
      ),
    );
  }
}
