import 'package:flutter/material.dart';

final globalKey = GlobalKey<_ColoredWidgetState>();

class LearnContextWidget extends StatelessWidget {
  LearnContextWidget({Key? key}) : super(key: key);

  static void nextScreen(BuildContext context) {
    Navigator.of(context).push<void>(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const NextScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () => nextScreen(context),
            child: const Text('Transition'),
          ),
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: InheritExample(
          child: ColoredWidget(
            initalColor: Colors.black,
            child: Padding(
              padding: EdgeInsets.all(40),
              child: ColoredWidget(
                key: globalKey,
                initalColor: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.all(40),
                  child: ColorButton(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InheritExample extends InheritedWidget {
  const InheritExample({
    Key? key,
    required Widget child,
  }) : super(
          key: key,
          child: child,
        );

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}

class ColoredWidget extends StatefulWidget {
  final Widget child;
  final Color initalColor;

  const ColoredWidget({
    Key? key,
    required this.initalColor,
    required this.child,
  }) : super(key: key);

  @override
  _ColoredWidgetState createState() => _ColoredWidgetState();
}

class _ColoredWidgetState extends State<ColoredWidget> {
  late Color color;

  @override
  void initState() {
    color = widget.initalColor;
    super.initState();
  }

  void changeColor(Color color) {
    setState(() {
      this.color = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: widget.child,
    );
  }
}

class ColorButton extends StatelessWidget {
  const ColorButton({Key? key}) : super(key: key);

  void _onPressed(BuildContext context) {
    // final a = context.findRenderObject()?.runtimeType;
    // print(a);
    print('---------------\n\n\n');
    context.visitAncestorElements((element) {
      final renderObject = element.renderObject;
      print(element);
      print(renderObject);
      print('--------------\n\n\n');
      return true;
    });
    // print(context.size);
    // context
    //     .findAncestorStateOfType<_ColoredWidgetState>()
    //     ?.changeColor(Colors.purpleAccent);
    // context
    //     .findRootAncestorStateOfType<_ColoredWidgetState>()
    //     ?.changeColor(Colors.yellow);
    // globalKey.currentState?.changeColor(Colors.grey);
  }

  @override
  Widget build(BuildContext context) {
    return ColoredWidget(
      initalColor: Colors.blue,
      child: Center(
        child: ElevatedButton(
          onPressed: () => _onPressed(context),
          child: const Text('Press'),
        ),
      ),
    );
  }
}
