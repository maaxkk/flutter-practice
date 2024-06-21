import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static final ButtonStyle linkButton =  ButtonStyle(
      foregroundColor: WidgetStateProperty.all(const Color(0xff01b4e4)),
      textStyle: WidgetStateProperty.all(const TextStyle(fontSize: 16),),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
      padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 8),)
  );
}