import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LearnTextfield2 extends StatefulWidget {
  LearnTextfield2({super.key});

  @override
  State<LearnTextfield2> createState() => _LearnTextfield2State();
}

class _LearnTextfield2State extends State<LearnTextfield2> {
  final controllerOne = TextEditingController(text: '');
  final controllerTwo = TextEditingController(text: '');
  final nodeOne = FocusNode();
  final nodeTwo = FocusNode();

  // void _onChanged(String text) {
  //   // print('_onChanged: $text');
  // }
  //
  // void _onEditingComplete() {
  //   print('_onEditingComplete');
  // }
  //
  // void _onSubmitted(String text) {
  //   // nodeOne.nextFocus();
  //   print('_onSubmitted: $text');
  // }
  //
  // void _onTap() {
  //   print('_onTap');
  //   controllerTwo.clear();
  // }
  //
  // void _onListen() {
  //   controllerTwo.text = controllerOne.text.toUpperCase();
  // }

  // void onButtonTap() {
  // controllerOne.value = TextEditingValue(
  //     text: '123456',
  //     selection: TextSelection(baseOffset: 0, extentOffset: 3),
  //     );
  // // controllerOne.text = '12345';
  // controllerOne.addListener(_onListen);
  // controllerOne.removeListener(_onListen);
  // controllerTwo.clear();

  // Node focus
  // add focus to node
  // nodeOne.requestFocus();
  // move focus to next node
  // nodeOne.nextFocus();

  // nodeTwo.addListener(() {
  //   print(nodeTwo.hasFocus);
  // });
  // nodeOne.nextFocus();

  // remove focus from node
  // nodeOne.unfocus();
  // print(nodeOne.hasFocus);
  // print(nodeTwo.hasFocus);
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ElevatedButton(
            // onPressed: onButtonTap,
            // onPressed: () {},
            // child: Text('Click'),
            // ),
            TextField(
              inputFormatters: [
                // FilteringTextInputFormatter.digitsOnly,
                // FilteringTextInputFormatter.allow(RegExp(r'[r,t,y]'))
                // FilteringTextInputFormatter.deny(RegExp(r'[r,t,y]'))
                PhoneInputFormatter(),
              ],
              // onChanged: _onChanged,
              // onEditingComplete: _onEditingComplete,
              // onSubmitted: _onSubmitted,
              // onTap: _onTap,
              decoration: InputDecoration(border: OutlineInputBorder()),
              controller: controllerOne,
              focusNode: nodeOne,
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 40,
            ),
            // TextField(
            //   // onSubmitted: _onSubmitted,
            //   decoration: InputDecoration(border: OutlineInputBorder()),
            //   controller: controllerTwo,
            //   focusNode: nodeTwo,
            //   textInputAction: TextInputAction.next,
            // ),
          ],
        ),
      ),
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,
      TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSpecialSymbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;
    final digitsOnlyChars = digitsOnly.split('');
    final cursorPosition = newValue.selection.start - initialSpecialSymbolCount;
    var finalCursorPosition = cursorPosition;

    if (oldValue.selection.textBefore(oldValue.text).endsWith(' ')) {
      digitsOnlyChars.removeAt(cursorPosition - 1);
      finalCursorPosition  -= 2;
    }

    var newString = <String>[];
    for (var i = 0; i < digitsOnlyChars.length; i++) {
      if (i == 3 || i == 6 || i == 8) {
        newString.add(' ');
        newString.add(digitsOnlyChars[i]);
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else {
        newString.add(digitsOnlyChars[i]);
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}
