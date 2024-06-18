import 'package:flutter/material.dart';

class SimpleWidget extends StatelessWidget {
  const SimpleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TwoString> textData = [
      TwoString('1', 'one'),
      TwoString('2', 'two'),
      TwoString('3', 'three'),
      TwoString('4', 'four'),
      TwoString('5', 'five'),
      TwoString('6', 'six'),
      TwoString('100', 'hundred'),
    ];

    List<Widget> testFields = [];

    final List<Widget> newTextData = textData
        .map((TwoString twoString) => TextWrapper(twoString: twoString))
        .toList();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: newTextData,
    );
  }
}

class TwoString {
  final String text;
  final String text2;

  const TwoString(this.text, this.text2);
}

class TextWrapper extends StatelessWidget {
  final TwoString twoString;

  const TextWrapper({super.key, required this.twoString});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          twoString.text,
          style: TextStyle(fontSize: 20),
        ),
        Spacer(),
        Text(
          twoString.text2,
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
