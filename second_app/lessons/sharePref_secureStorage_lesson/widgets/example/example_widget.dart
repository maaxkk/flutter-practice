import 'package:flutter/material.dart';
import 'package:second_app/widgets/example/example_model.dart';

class ExampleWidget extends StatefulWidget {
  ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  final _model = ExampleWidgetModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: _model.setName,
                child: const Text('Save name'),
              ),
              ElevatedButton(
                onPressed: _model.readName,
                child: const Text('Read name'),
              ),
              ElevatedButton(
                onPressed: _model.setToken,
                child: const Text('Save token'),
              ),
              ElevatedButton(
                onPressed: _model.readToken,
                child: const Text('Read token'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}