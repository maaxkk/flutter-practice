import 'package:first_app/widgets/ImagesWidget.dart';
import 'package:first_app/widgets/global_key_exampe_widget.dart';
import 'package:first_app/widgets/keys_example_widget.dart';
import 'package:first_app/widgets/loader_widget.dart';
import 'package:first_app/widgets/reorder_widgets.dart';
import 'package:first_app/widgets/stateless_full.dart';
// import 'package:first_app/widgets/buttons.dart';
// import 'package:first_app/widgets/example_widget.dart';
// import 'package:first_app/widgets/learn_textField.dart';
// import 'package:first_app/widgets/learn_textField2.dart';
// import 'package:first_app/widgets/simple_widget.dart';
// import 'package:first_app/widgets/user_profile.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(MaterialApp(home: UserProfile()));
  // runApp(MaterialApp(home: Scaffold(body: SimpleWidget())));

  // Without scaffold
  // runApp(MaterialApp(home: ExampleWidget()));

  // With scaffold
  // runApp(MaterialApp(home: Scaffold(body: ExampleWidget())));

  // runApp(MaterialApp(home: Scaffold(body: Buttons())));

  // runApp(MaterialApp(home: Scaffold(body: LearnTextfield())));

  // runApp(MaterialApp(home: Scaffold(body: LearnTextfield2())));

  // runApp(MaterialApp(home: Scaffold(body: ImagesWidget())));

  // runApp(MaterialApp(home: Scaffold(body: LoaderWidget())));

  // runApp(const MaterialApp(home: Scaffold(body: ExampleStateless())));

  // runApp(const MaterialApp(home: Scaffold(body: KeysExampleWidget())));

  runApp(MaterialApp(home: Scaffold(body: GlobalKeyExampeWidget())));
}
