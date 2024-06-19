import 'package:first_app/widgets/buttons.dart';
import 'package:first_app/widgets/example_widget.dart';
import 'package:first_app/widgets/simple_widget.dart';
import 'package:first_app/widgets/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MaterialApp(home: UserProfile()));
  // runApp(MaterialApp(home: Scaffold(body: SimpleWidget())));

  // Without scaffold
  // runApp(MaterialApp(home: ExampleWidget()));

  // With scaffold
  // runApp(MaterialApp(home: Scaffold(body: ExampleWidget())));

  runApp(MaterialApp(home: Scaffold(body: Buttons())));
}
