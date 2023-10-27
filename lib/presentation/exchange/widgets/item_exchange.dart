import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';

class ItemExchange extends StatefulWidget {
  const ItemExchange({super.key});

  @override
  State<ItemExchange> createState() => _ItemExchangeState();
}

class _ItemExchangeState extends State<ItemExchange> {
    bool ispicked = false; 

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(Get.width*0.04),
      child: Container(   
        width: Get.width*0.8,
        
        child: Stack(alignment: Alignment.centerLeft,
          children: [ 
        
           Container( 
            width: Get.width*0.83,
            height: Get.height*0.13,
             child: Stack( 
              alignment: Alignment.centerRight,
               children:[ Container(
                width: Get.width*0.7,
                decoration: BoxDecoration( 
                   boxShadow: [
                           BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 blurRadius: 10,
                 spreadRadius: 1,
                )], 
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Get.width*0.07),
                    bottomLeft: Radius.circular(Get.width*0.07),
                    topRight: Radius.circular(Get.width*0.025) , 
                    bottomRight: Radius.circular(Get.width*0.025)
                  ) , 
                ),
               ), 
               Container(
                height: Get.width*0.1,
                width: Get.width*0.5,
                
                 child: Row(
                   children: [
                    Text("Food"),
                    Spacer(),
                     InkWell(
                      onTap: (){
                        setState(() {
                          ispicked = !ispicked;
                        });
                      },
                       child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Get.width*0.04),
                         child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          border: Border.all(color: ispicked ?   Colors.green : AppColors.secondaryColor)
                          ),
                         width: Get.width*0.08,
                         height: Get.width*0.08,
                         child: ispicked ? 
                         Icon(Icons.check,color: Colors.green,):null),
                       ),
                     ),
                   ],
                 ),
               )
               ]
             ),
           ) ,
             Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                           BoxShadow(
                 color: Colors.grey.withOpacity(0.5),
                 blurRadius: 12,
                 spreadRadius: 5,
                 offset: Offset(-1, 0)
                )], 
                
    
              ),
               child: CircleAvatar(
                       backgroundColor: Colors.black,
                       radius: Get.width*0.12,
                      ),
             ) , 
            
    
        ]),
      ),
    );
  }
}