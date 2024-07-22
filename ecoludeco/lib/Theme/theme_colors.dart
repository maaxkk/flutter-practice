import 'package:flutter/material.dart';

class ThemeColors {
  static ThemeColors light = ThemeColors(
    pinkColor: const Color(0xffff9499),
    blueColor: const Color(0xff3161f60),
  );
  final Color pinkColor;
  final Color blueColor;

  ThemeColors({required this.pinkColor, required this.blueColor});
}
