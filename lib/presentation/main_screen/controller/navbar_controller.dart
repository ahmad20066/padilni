import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/presentation/home/screen/home_page.dart';
import 'package:padilni/presentation/my_items/screens/my_items_screen.dart';
import 'package:padilni/presentation/profile/profile_screen.dart';
import 'package:padilni/presentation/search/screens/search_screen.dart';

class NavbarController extends GetxController {
  Rx<int> currentIndex = 0.obs;
  List<Widget> pages = [
    HomePage(),
    SearchScreen(),
    MyItemsScreen(),
    ProfileScreen(),
  ];
}
