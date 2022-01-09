import 'package:flutter/material.dart';

import 'package:rick_and_morty_app/constants/colors.dart';

class AppTheme {

   static ThemeData theme() {
      return ThemeData.light().copyWith(
         primaryColor: AppColors.primary,
         appBarTheme: AppBarTheme(
            backgroundColor: AppColors.primary
         ),
         floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.deepPurple
         )
      );
   }

}