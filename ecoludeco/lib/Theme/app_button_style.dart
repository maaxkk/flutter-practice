import 'package:ecoludeco/Theme/theme_colors.dart';
import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle ordinaryButton = ButtonStyle(
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.all(ThemeColors.light.pinkColor),
      shape: WidgetStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.0),
      )));
}
