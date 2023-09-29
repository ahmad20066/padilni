import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:padilni/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

var theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondaryColor,
    ),
    //  useMaterial3: true, 
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          color: AppColors.fourthColor,
          fontSize: 25,
        ),
        bodyMedium: GoogleFonts.poppins(
            color: AppColors.fourthColor,
            fontSize: 20,
            fontWeight: FontWeight.normal),
        bodySmall: GoogleFonts.poppins(
            color: AppColors.fourthColor,
            fontSize: 12,
            fontWeight: FontWeight.normal)));
