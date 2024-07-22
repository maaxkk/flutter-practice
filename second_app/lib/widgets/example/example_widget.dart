import 'package:flutter/material.dart';
import 'package:second_app/widgets/example/example_widget_model.dart';

class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: model.doSome,
                child: const Text('Click me'),
              ),
              ElevatedButton(
                onPressed: model.setup,
                child: const Text('Setup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}