import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/data/local/sharedhelper.dart';
import 'package:padilni/utils/colors.dart';

ThemeData gettheme(context) {
  return ThemeData(
    fontFamily: Shared.getstring("lang") == "ar" ? "Cairo" : "Poppins",
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.secondaryColor,
    ),
    useMaterial3: true,
    textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: AppColors.fourthColor,
          fontSize: MediaQuery.sizeOf(context).width * 0.06,
        ),
        bodyMedium: TextStyle(
            color: AppColors.fourthColor,
            fontSize: MediaQuery.sizeOf(context).width * 0.045,
            fontWeight: FontWeight.normal),
        bodySmall: TextStyle(
            color: AppColors.fourthColor,
            fontSize: MediaQuery.sizeOf(context).width * 0.04,
            fontWeight: FontWeight.normal)),
  );
}
