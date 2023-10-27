import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/favourites/widgets/favourite_item.dart';
import 'package:padilni/utils/widgets/auth_appbar.dart';
import 'package:padilni/presentation/favourites/widgets/custom_search_bar.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: CustomAppBar(
        text: "Favourites".tr ,
        showHomeIcon: false,), 
      body: SingleChildScrollView(
        child: 
        SizedBox( 
          width: Get.width,
          child: Column( 
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [  

              SizedBox(height: Get.height*0.03,),

        const CustomSearchBar() ,   

        SizedBox(height: Get.height*0.02,),

        ListView.builder( 
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: ((context, index) => const FavouriteItem())) , 

          SizedBox(height: Get.height*0.02,),
            ],
          ),
        ),
      ),


    );
  }
}