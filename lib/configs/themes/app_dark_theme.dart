import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/app_colors.dart';
import 'package:student_app/configs/themes/sub_theme_data_mixin.dart';
class DarkTheme with SubThemeData {
  ThemeData buildSystemDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
      primaryColor: primaryColorDark,
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorDark,
        displayColor: mainTextColorDark,
      ),
      iconTheme: getIconTheme()
    );
  }
}