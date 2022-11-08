import 'package:flutter/material.dart';
import 'package:student_app/configs/themes/app_dark_theme.dart';
import 'package:student_app/configs/themes/app_light_theme.dart';
import 'package:student_app/configs/themes/ui_parameters.dart';

const onSurfaceTextColor = Colors.white;

const Color primaryColorLight = Color(0xFF3ac3cb);
const Color primaryLightColorLight = Color(0xFFf85187);
const Color mainTextColorLight = Color.fromARGB(255, 40, 40, 40);

const Color primaryDarkColorDark = Color(0xFF2e3c62);
const Color primaryColorDark = Color(0xFF99ace1);
const Color mainTextColorDark = Colors.white;

const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryLightColorLight, primaryColorLight]);

const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDarkColorDark, primaryColorDark]);

LinearGradient mainGradient(BuildContext context) =>
    UIParameters.isDarkMode(context) ? mainGradientDark : mainGradientLight;
