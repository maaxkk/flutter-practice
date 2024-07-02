import 'package:flutter/material.dart';

final globalKey = GlobalKey<_AwesomeTextState>();

class GlobalKeyExampeWidget extends StatelessWidget {
  const GlobalKeyExampeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () => globalKey.currentState?._increment(),
            child: Text('Increment'),
          ),
          AwesomeText(key: globalKey),
        ],
      ),
    );
  }
}

class AwesomeText extends StatefulWidget {
  const AwesomeText({super.key});

  @override
  State<AwesomeText> createState() => _AwesomeTextState();
}

class _AwesomeTextState extends State<AwesomeText> {
  int _value = 0;

  void _increment() {
    setState(() {
      _value += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$_value');
  }
}
