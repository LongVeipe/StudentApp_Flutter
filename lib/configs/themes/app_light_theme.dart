import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/sub_theme_data_mixin.dart';

import 'app_colors.dart';

class LightTheme with SubThemeData {
  ThemeData buildSystemLightTheme() {
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(
      textTheme: getTextTheme().apply(
        bodyColor: mainTextColorLight,
        displayColor: mainTextColorLight,
      ),
      iconTheme: getIconTheme(),
    );
  }
}
