import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/exchange/widgets/item_exchange.dart';
import 'package:padilni/utils/colors.dart';
import 'package:padilni/utils/widgets/custom_button.dart';
import 'package:padilni/utils/widgets/get_height.dart';

class ItemEchangeScreen extends StatelessWidget {
  const ItemEchangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Container( 
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [ 
               Container(
                // height: Get.height*0.5,
                  width: Get.width*0.9,
                  decoration: BoxDecoration(
                    color: Color(0xffF7F6F9),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        blurRadius:4,
                        spreadRadius: 0,
                      )],
                  border: Border.all(color: Colors.grey[200]!) ,
                  borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(Get.width*0.08 ),
                  bottomRight: Radius.circular(Get.width*0.08 ))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [   
                      GetHeight(height: Get.height*0.02),
                    Text("My Items" , style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w500  , 
        fontSize: Get.width*0.05
      ),) ,
                GetHeight(height: Get.height*0.03),
      
                    Padding(
                      padding:  EdgeInsets.all(Get.width*0.06),
                      child: Text("Please Select Item you want to exchange",
                      style:Theme.of(context).textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w500  , 
        fontSize: Get.width*0.04) ,),
                    ) , 
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          ItemExchange(), 
                          ItemExchange(), 
                          ItemExchange()

                        ],
                      )) ,  
                      GetHeight(
                        height: Get.height*0.03,

                      ) ,
                        CustomButton(
                    buttomColor: AppColors.secondaryColor,
                    onpressed: (){},
                    child: Text("Next"),
                  ),
        GetHeight(height: Get.height*0.01)
                  ],),
                  ),
                

        
            ],
          ),
        ),
      ),
    );
  }
}