
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/auth/widgets/custom_row_button.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import '../../../utils/colors.dart';
import '../../../utils/widgets/get_height.dart';

// ignore: must_be_immutable
class VerificationPage extends StatefulWidget {
   VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
 var  myvalue = ""; 
  var pincontroller;

 @override
  void initState() {

  pincontroller = TextEditingController(text: myvalue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(text: "Verification"),
      body: SingleChildScrollView(
        child: Column( 
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          GetHeight(height: Get.height*0.06),
            Center(
              child: Text("Please enter your verification code ", 
              style: Theme.of(context).textTheme.bodySmall,),
            ) ,  
            GetHeight(height: Get.height*0.05),  
            Center(
              child: SizedBox( 
                height: Get.height*0.072,
                width: Get.width,
                child: Row(  
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [  
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: pin(),
                  ) , 
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: pin(),
                  ) ,
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: pin(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: pin(),
                  ) 
                  ,
                   Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: pin(),
                  )
                          
                ],),
              ),
            ) ,
           GetHeight(height: Get.height*0.05),
           CustomButton(onpressed: (){}, 
           child: Text("Verify" , style: Theme.of(context).textTheme.bodyMedium!
          .copyWith(color: AppColors.primaryColor),), buttomColor: AppColors.secondaryColor) ,

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
    );
  }


Widget pin()
{
  return Container( 
              height: Get.height*0.07,
              width: Get.width*0.13,
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(Get.width*0.04),
                border: Border.all(color: AppColors.thirdColor.withOpacity(1))
              ), 
              child: Padding(padding:EdgeInsets.all(Get.width*0.02),
              child: TextFormField( 
                controller: pincontroller,
                onChanged: (val){ 
                  if(!val.isEmpty)
                  {  
                    print(val);
                    setState(() {
                            pincontroller = TextEditingController(text: val.split("").first);
                      
                    });
                  }
                  
                },
                textAlign: TextAlign.center,
                showCursor: false,
                
              ),));
}
}