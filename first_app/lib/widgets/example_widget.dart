import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ExampleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ExampleN13();
  }
}

// Parent gives min constraints for first container, so even if we set 100x100
// sizes, it will follow parent constraints, which are size of mobile screen
class ExampleN1 extends StatelessWidget {
  const ExampleN1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.red,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    );
  }
}

// Center
// Center takes all space from parent and passes to child new constraints
// which lets us to position his child in the center of available space
class ExampleN2 extends StatelessWidget {
  const ExampleN2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    );
  }
}

// Align
// Like center but more flexible
class ExampleN3 extends StatelessWidget {
  const ExampleN3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        width: 50,
        height: 50,
        color: Colors.blue,
      ),
    );
  }
}

// Example with padding
// With padding parent container calculate his width and height now not only
// by his child's sizes but also adding padding sizes to it, e.g 20+30+20
class ExampleN4 extends StatelessWidget {
  const ExampleN4({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.red,
        padding: EdgeInsets.all(20.0),
        child: Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        ),
      ),
    );
  }
}

// UnconstrainedBox
// Scrollable widget has something common with it
class ExampleN5 extends StatelessWidget {
  const ExampleN5({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        width: 30,
        height: 300000, // no constraints will cause overflowed error
        color: Colors.blue,
      ),
    );
  }
}

// Row + Expanded
class ExampleN6 extends StatelessWidget {
  const ExampleN6({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Expanded(
            child: Container(
                color: Colors.red,
                child: Text(
                  'Hellofasdfasdfsadfsadfdsafasdfsdaffsdfsdfsdfsdfsdfsddfdf!',
                  textDirection: TextDirection.ltr,
                )),
          ),
          Expanded(
            flex: 3,
            child: Container(
                color: Colors.blue,
                child: Text(
                  'fdsjfkshdfkjsadhckdfskjfldsjfjksdfjkls!',
                  textDirection: TextDirection.ltr,
                )),
          ),
          Expanded(
            child: Container(
                color: Colors.green,
                child: Text(
                  'fdsjfkshdfkjsadhckdfskjfldsjfjksdfjkls!',
                  textDirection: TextDirection.ltr,
                )),
          )
        ],
      ),
    );
  }
}

class ExampleN7 extends StatelessWidget {
  const ExampleN7({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Flexible(
            child: Container(
                color: Colors.blue,
                child: Text(
                  'Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!Hello World!',
                  textDirection: TextDirection.ltr,
                )),
          ),
          Flexible(
            child: Container(
                color: Colors.red,
                child: Text(
                  'Bye world!',
                  textDirection: TextDirection.ltr,
                )),
          ),
        ],
      ),
    );
  }
}

// Single child layout delegate
class ExampleN8 extends StatelessWidget {
  const ExampleN8({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: CustomSingleChildLayout(
          delegate: OwnSingleChildLayoutDelegate(),
          child: Container(
            width: 100,
            height: 100,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}

class OwnSingleChildLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return true;
  }

  @override
  Size getSize(BoxConstraints constraints) =>
      Size(constraints.biggest.width, 100);

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    final yoffset = size.height / 2 - childSize.height / 2;
    return Offset(childSize.width, yoffset);
  }

  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) =>
      BoxConstraints.tight(Size(100, 50));
}

class ExampleN9 extends StatelessWidget {
  const ExampleN9({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blue,
        child: CustomMultiChildLayout(
          delegate: OwnMultiChildLayoutDelegate(),
          children: [
            LayoutId(
              id: 1,
              child: Text('left '),
            ),
            LayoutId(
              id: 2,
              child: Text('|middle|middle|middle|middle|middle|middle|'),
            ),
            LayoutId(
              id: 3,
              child: Text('right '),
            ),
          ],
        ),
      ),
    );
  }
}

class OwnMultiChildLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    return Size(constraints.biggest.width, 100);
  }

  @override
  bool shouldRelayout(covariant MultiChildLayoutDelegate oldDelegate) {
    return true;
  }

  @override
  void performLayout(Size size) {
    if (hasChild(1) && hasChild(2) && hasChild(3)) {
      const minOtherElementWidth = 50;

      final firstElementMaxWidth = size.width - minOtherElementWidth * 2;
      final firstElementSize = layoutChild(
          1, BoxConstraints.loose(Size(firstElementMaxWidth, size.height)));

      final thirdElementMaxWidth =
          size.width - firstElementSize.width - minOtherElementWidth;
      final thirdElementSize = layoutChild(
          3, BoxConstraints.loose(Size(thirdElementMaxWidth, size.height)));

      final secondElementMaxWidth =
          size.width - firstElementSize.width - thirdElementSize.width;
      final secondElementSize = layoutChild(
          2, BoxConstraints.loose(Size(secondElementMaxWidth, size.height)));

      final firstElementYOffset = size.height / 2 - firstElementSize.height / 2;
      positionChild(1, Offset(0, firstElementYOffset));

      final thirdElementXOffset = size.width - thirdElementSize.width;
      final thirdElementYOffset = size.height / 2 - thirdElementSize.height / 2;
      positionChild(3, Offset(thirdElementXOffset, thirdElementYOffset));

      var secondElementXOffset = size.width / 2 - secondElementSize.width / 2;
      if (firstElementSize.width > secondElementXOffset) {
        secondElementXOffset = firstElementSize.width;
      } else if (thirdElementXOffset <
          secondElementXOffset + secondElementSize.width) {
        secondElementXOffset = thirdElementXOffset - secondElementSize.width;
      }
      final secondElementYOffset =
          size.height / 2 - secondElementSize.height / 2;
      positionChild(2, Offset(secondElementXOffset, secondElementYOffset));
    }
  }
}

class ExampleN10 extends StatelessWidget {
  const ExampleN10({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          Positioned(
            top: 10,
            left: 10,
            bottom: 10,
            right: 10,
            child: Container(
              width: 100,
              height: 100,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class ExampleN11 extends StatelessWidget {
  const ExampleN11({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 300,
            height: 300,
            color: Colors.red,
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Text('Change'),
          ),
        ],
      ),
    );
  }
}

// Scrolling
class ExampleN12 extends StatefulWidget {
  ExampleN12({super.key});

  @override
  State<ExampleN12> createState() => _ExampleN12State();
}

class _ExampleN12State extends State<ExampleN12> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) {
      controller.animateTo(1000,
          duration: Duration(seconds: 1), curve: Curves.easeInOut);
    });
    // controller.addListener(() {
    //   print('${controller.position}');
    // });
  }

  @override
  Widget build(BuildContext context) {
    var items = <Widget>[];
    for (var i = 0; i <= 200; i++) {
      final widget = Text('$i');
      items.add(widget);
    }
    return SingleChildScrollView(
      controller: controller,
      child: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: items,
        ),
      ),
    );
  }
}

// ListView
class ExampleN13 extends StatelessWidget {
  const ExampleN13({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: ListView.separated(
          itemCount: 100,
          addAutomaticKeepAlives: false,
          itemBuilder: (BuildContext context, int index) {
            return SomeTextField(text: '$index');
            // print('$index');
            // return Container(
            //   color: index % 2 == 0 ? Colors.red : Colors.blue,
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 100.0, bottom: 100.0),
            //     child: Column(
            //       children: [
            //         Text('$index'),
            //         BlackSquare(),
            //       ],
            //     ),
            //   ),
            // );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 3,
              color: Colors.black,
            );
          }),
    );
  }
}

class SomeTextField extends StatefulWidget {
  final String text;

  const SomeTextField({super.key, required this.text});

  @override
  State<SomeTextField> createState() => _SmallContainerState();
}

class _SmallContainerState extends State<SomeTextField> with AutomaticKeepAliveClientMixin {
  late final controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class BlackSquare extends StatelessWidget {
  const BlackSquare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 20,
      height: 20,
    );
  }
}
