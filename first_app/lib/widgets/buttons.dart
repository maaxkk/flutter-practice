import 'package:flutter/material.dart';

class Buttons extends StatefulWidget {
  Buttons({
    super.key,
  });

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  String text = 'Button is not pressed';

  void printFirst(int number) {
    setState(() {
      text = 'Pressed $number button';
    });
    print('$number button');
  }

  void onLongPressPrint() {
    setState(() {
      text = 'Was long press on one of the buttons';
    });
  }

  @override
  final style = ButtonStyle(
    // backgroundColor: WidgetStateProperty.all(Colors.red),
    // foregroundColor: WidgetStateProperty.all(Colors.black),
    // overlayColor: WidgetStateProperty.all(Colors.green),
    // shadowColor: WidgetStateProperty.all(Colors.blue),
    // elevation: WidgetStateProperty.all(10),
    padding: WidgetStateProperty.all(EdgeInsets.all(0.0)),
    // minimumSize: WidgetStateProperty.all(Size(100, 100)),
    // shape: WidgetStateProperty.all(
    //   RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(50.0),
    //     side: BorderSide(color: Colors.black),
    //   ),
    // ),
    // alignment: Alignment.topCenter,
  );

  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text),
          ElevatedButton(
            clipBehavior: Clip.hardEdge,
            style: style,
            onPressed: () => printFirst(1),
            onLongPress: onLongPressPrint,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.exposure_zero),
                Text('Click me'),
                SizedBox(width: 10),
                Icon(Icons.add),
                // Container(
                //   width: 100,
                //   height: 100,
                //   color: Colors.red,
                // ),
              ],
            ),
          ),
          OutlinedButton(
            // style: style,
            onPressed: () => printFirst(2),
            onLongPress: onLongPressPrint,
            child: Text('Click me'),
          ),
          TextButton(
            // style: style,
            onPressed: () => printFirst(3),
            onLongPress: onLongPressPrint,
            child: Text('Click me'),
          ),
          IconButton(
            disabledColor: Colors.pink,
            color: Colors.blue,
            splashColor: Colors.red,
            // onPressed: null,
            onPressed: () => printFirst(4),
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
