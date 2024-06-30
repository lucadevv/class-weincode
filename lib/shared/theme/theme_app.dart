import 'package:curso_weincode/shared/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ThemeApp {
  ThemeApp._();
  static ThemeData themeDark = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: AppColors.brandPrimaryColor,
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
      displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      displaySmall: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      headlineLarge:
          TextStyle(fontSize: 21, color: AppColors.brandPrimaryColor),
      bodyLarge: TextStyle(fontSize: 14),
      bodyMedium: TextStyle(fontSize: 13),
      bodySmall: TextStyle(fontSize: 10),
    ),
  );
}
