import 'package:flutter/material.dart';
import 'package:guruh1/core/theme/app_colors.dart';

class CustomTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.background,
    fontFamily: 'Montserrat',
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: TextTheme(),
    fontFamily: 'Montserrat',
  );
}
