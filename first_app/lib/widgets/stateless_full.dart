import 'package:flutter/material.dart';

final superKey = GlobalKey();

class ExampleStateless extends StatelessWidget {
  const ExampleStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return RedBox();
  }
}

class RedBox extends StatefulWidget {
  const RedBox();

  // {
  //   print('RedBox init 🔴');
  // }

  @override
  State<RedBox> createState() => _RedBoxState();
}

class _RedBoxState extends State<RedBox> {
  int number = 102;

  _RedBoxState() {
    print('RebBox state init');
  }

  void _increment() {
    number += 1;
    setState(() {});
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (BuildContext context) => Scaffold(body: ExampleStateless())),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    number = 500;
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    print('RedBox build 🔴');
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: Center(
              child: ElevatedButton(
                onPressed: _increment,
                child: Text('$number'),
              ),
            )),
            const Expanded(child: BlueBox()),
            const SizedBox(height: 30),
            Expanded(
                child: number % 2 == 0 ? GreenBox(key: superKey) : Container()),
          ],
        ),
      ),
    );
  }
}

class BlueBox extends StatelessWidget {
  const BlueBox();

  // {
  //   print('BlueBox init 🟦');
  // }

  @override
  Widget build(BuildContext context) {
    print('BlueBox init 🟦');
    return Container(
      color: Colors.blue,
    );
  }
}

class GreenBox extends StatefulWidget {
  // final controller = TextEditingController();
  const GreenBox({Key? key}) : super(key: key);

  @override
  State<GreenBox> createState() => _GreenBoxState();
}

class _GreenBoxState extends State<GreenBox> {
  _GreenBoxState() {
    print('GreenBox state init');
  }

  var isDeactivate = false;

  @override
  void initState() {
    super.initState();
    final number = context.findAncestorStateOfType<_RedBoxState>()?.number;
    print(number);

    print('GreenBox initState');
  }

  @override
  void didUpdateWidget(covariant GreenBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    final color = Theme.of(context).appBarTheme;
    print(color);
  }

  // {
  @override
  Widget build(BuildContext context) {
    print('GreenBox init 🟩');
    print('is deactivated: $isDeactivate');
    // print(controller.text);
    return Container(
      color: Colors.green,
      child: Column(
        children: [
          Expanded(
              child: Container(
            child: Column(
              children: [
                // Text(text),
                TextField(
                  // controller: controller,
                  onChanged: (value) {
                    // text = value;
                  },
                ),
              ],
            ),
          )),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: PinkBox(),
            ),
          ),
        ],
      ),
    );
  }
}

class PinkBox extends StatelessWidget {
  const PinkBox();

  // {
  // print('PinkBox init 🎀');
  // }

  @override
  Widget build(BuildContext context) {
    print('PinkBox build 🎀');
    return Container(
      color: Colors.pink,
    );
  }
}
