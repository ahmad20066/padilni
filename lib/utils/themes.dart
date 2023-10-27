import 'package:flutter/material.dart';
import 'package:padilni/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
  ThemeData gettheme(context) {
return ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondaryColor,
    ),
    //  useMaterial3: true, 
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          color: AppColors.fourthColor,
          fontSize:MediaQuery.sizeOf(context).width*0.06,
        ),
        bodyMedium: GoogleFonts.poppins(
            color: AppColors.fourthColor,
            fontSize:MediaQuery.sizeOf(context).width*0.05,
            fontWeight: FontWeight.normal),
        bodySmall: GoogleFonts.poppins(
            color: AppColors.fourthColor,
            fontSize: MediaQuery.sizeOf(context).width*0.04,
            fontWeight: FontWeight.normal)));
  }