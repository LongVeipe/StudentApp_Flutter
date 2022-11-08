import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/configs/themes/app_dark_theme.dart';
import 'package:student_app/configs/themes/app_light_theme.dart';

class ThemeController extends GetxController {
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit() {
    initializeThemeData();
    super.onInit();
  }

  void initializeThemeData() {
    _darkTheme = DarkTheme().buildSystemDarkTheme();
    _lightTheme = LightTheme().buildSystemLightTheme();
  }

  ThemeData get darkTheme => _darkTheme;

  ThemeData get lightTheme => _lightTheme;
}
