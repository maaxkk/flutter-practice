import 'package:flutter/material.dart';
import 'package:second_app/widgets/example/example_widget_model.dart';

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
          child: ExampleWidgetModelProvider(
            model: _model,
            child: const Column(
              children: [
                _CreateFileButton(),
                _ReadFileButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CreateFileButton extends StatelessWidget {
  const _CreateFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleWidgetModelProvider.read(context)!.model.createFile,
      child: const Text('Create file'),
    );
  }
}

class _ReadFileButton extends StatelessWidget {
  const _ReadFileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: ExampleWidgetModelProvider.read(context)!.model.readFile,
      child: const Text('Read file'),
    );
  }
}
