import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:second_app/example_data.dart';
import 'package:second_app/json_practice/human.dart';

class Example extends StatelessWidget {
  Example({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: JsonExampleProvider(
          coder: JsonExampleCoder(),
          child: const ButtonWidget(),
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () =>
                JsonExampleProvider
                    .read(context)
                    ?.coder
                    .encode(),
            child: const Text('Encode'),
          ),
          ElevatedButton(
            onPressed: () =>
                JsonExampleProvider
                    .read(context)
                    ?.coder
                    .decode(),
            child: const Text('Decode'),
          ),
        ],
      ),
    );
  }
}

class JsonExampleProvider extends InheritedWidget {
  final JsonExampleCoder coder;

  const JsonExampleProvider({
    Key? key,
    required this.coder,
    required Widget child,
  }) : super(
    key: key,
    child: child,
  );

  static JsonExampleProvider? watch(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<JsonExampleProvider>();
  }

  static JsonExampleProvider? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<JsonExampleProvider>()
        ?.widget;
    return widget is JsonExampleProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(JsonExampleProvider oldWidget) {
    return true;
  }
}

class JsonExampleCoder {
  void encode() {
    final jsonStrng = jsonEncode(humans.map((e) => e.toJson()).toList());
    print(jsonStrng);
  }

  void decode() {
    try {
      final json = jsonDecode(jsonString) as List<dynamic>;
      final users = json
          .map<Human>((dynamic e) => Human.fromJson(e as Map<String, dynamic>))
          .toList();
      print(users);
    } catch (error) {
      print(error);
    }
  }
}
