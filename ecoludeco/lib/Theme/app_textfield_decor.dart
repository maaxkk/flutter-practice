import 'package:ecoludeco/Theme/theme_colors.dart';
import 'package:flutter/material.dart';

abstract class TextFieldDecoration {
  static final InputDecoration ordinaryTextField = InputDecoration(
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: ThemeColors.light.pinkColor, width: 2.0),
    ),
    isCollapsed: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    border: const OutlineInputBorder(),
  );
}
