import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class ExampleWidgetModel extends ChangeNotifier {
  void readFile() async {
    // pathProvider.getApplicationDocumentsDirectory();

    // IOS, Android
    // pathProvider.getApplicationSupportDirectory();

    // pathProvider.getTemporaryDirectory();

    // IOS
    // pathProvider.getLibraryDirectory();

    // final directory = await pathProvider.getTemporaryDirectory();
    // final directory = await pathProvider.getDownloadsDirectory();

    final directory = await pathProvider.getDownloadsDirectory();
    final filePath = directory!.path + '/catto.png';
    final file = File(filePath);
    // await file.writeAsString('Hello flutter');
    final isExist = await file.exists();
    if (!isExist) {
      await file.create();
    }
    // final result = await file.readAsBytes();
    final result2 = await file.stat();
    print(result2);
  }

  void createFile() {}
}

class ExampleWidgetModelProvider extends InheritedNotifier {
  final ExampleWidgetModel model;

  const ExampleWidgetModelProvider({
    Key? key,
    required this.model,
    required Widget child,
  }) : super(
          key: key,
          notifier: model,
          child: child,
        );

  static ExampleWidgetModelProvider? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<ExampleWidgetModelProvider>();
  }

  static ExampleWidgetModelProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<ExampleWidgetModelProvider>()
        ?.widget;
    return widget is ExampleWidgetModelProvider ? widget : null;
  }
}
