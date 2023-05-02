import 'package:flutter/material.dart';
import 'package:password_manager/src/config/constants/ui_constants.dart';

import 'colors.dart';

class AppTheme {
  static var appTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.backgroundColor,
    primaryColor: AppColors.primaryColor,


    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 16, color: Colors.white),
      displayMedium: TextStyle(fontSize: 14, color: Colors.white),
      displaySmall: TextStyle(fontSize: 12, color: Colors.white),
    ),

    iconTheme: const IconThemeData(
      color: Colors.white,
      size: UiConstants.iconSize,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
    )

  );
}
