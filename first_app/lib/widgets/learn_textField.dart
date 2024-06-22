import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui show BoxHeightStyle, BoxWidthStyle;

import 'package:flutter/services.dart';

class LearnTextfield extends StatelessWidget {
  const LearnTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: TextField(
          // Part 2

          // can't edit text in input field
          // readOnly: false,

          // light/dark mode for keyboard
          // keyboardAppearance: Brightness.dark,

          // change 'done' button to 'next
          // textInputAction: TextInputAction.next,

          // Opens needed type of keyboard, only numbers for example
          // keyboardType: TextInputType.number,

          // show cursor or not
          // showCursor: false,

          // cursor width
          // cursorWidth: 20.0,

          // cursorHeight: 20.0,

          // radius
          // cursorRadius: Radius.circular(10),

          // color
          // cursorColor: Colors.red,

          // Hide password
          // obscureText: true,
          // Change symbol
          // obscuringCharacter: '*',
          // should autocorrect you
          // autocorrect: true,
          // only on android
          // enableSuggestions: false,

          // opens keyboard with capitalized letters
          // textCapitalization: TextCapitalization.characters,

          // smartDashesType: SmartDashesType.enabled,
          // smartQuotesType: SmartQuotesType.enabled,

          // cant highlight text
          // enableInteractiveSelection: false,

          // Opportunity to add new buttons to context menu, when highlight text
          contextMenuBuilder: (context, editableTextState) {
            final TextEditingValue value = editableTextState.textEditingValue;
            final List<ContextMenuButtonItem> buttonItems = editableTextState.contextMenuButtonItems;
            buttonItems.insert(
              0,
              ContextMenuButtonItem(
                label: 'Send email',
                onPressed: () {
                  print('Email sent!');
                },
              ),
            );
            return AdaptiveTextSelectionToolbar.buttonItems(
              anchors: editableTextState.contextMenuAnchors,
              buttonItems: buttonItems,
            );
          },

          // selectionHeightStyle: ui.BoxHeightStyle.max,

          // Change design of context menu
          // selectionControls: MaterialTextSelectionControls(),

          // maxLines: 3,
          // minLines: 1,

          // handling constraints for textfield(how many characters)
          // maxLength: 10,
          // maxLengthEnforcement: MaxLengthEnforcement.none,

          // expands: true,

          // align it to the end, algo good if you want to write from right to left
          // TextAlign.right
          // textAlign: TextAlign.right,
          // textDirection: TextDirection.rtl,

          style: TextStyle(color: Colors.blue),

          decoration: InputDecoration(
            // Part 1
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),

            // icon before textfield
            // icon: Icon(Icons.ac_unit),
            // label for textfield and also placeholder
            // labelText: 'phone',
            // icon before text
            // prefixIcon: Icon(Icons.phone),
            // prefix icon constraints
            // prefixIconConstraints: BoxConstraints.tight(Size(10,10)),
            // prefix widget
            // prefix: Text('+380'),
            // prefix test
            // prefixText: '+380',
            // filling textfield with our color
            // filled: true,
            // fillColor: Colors.red,

            // probably for web
            // focusColor: Colors.blue,
            // hoverColor: Colors.green,

            // padding, with isCollapsed: true we can use our padding
            // contentPadding: const EdgeInsets.all(3),

            // remove some vertical space
            // isDense: true,

            // behaviours for label
            // floatingLabelBehavior: FloatingLabelBehavior.never,

            // collapse paddings
            // isCollapsed: true,

            // same as prefix but suffix
            // suffixIcon: Icon(Icons.add),
            // suffixIconConstraints: BoxConstraints.tight(Size(10,10)),
            // suffix: Text('678'),

            // all are like labels
            // helperText: 'helperText',
            // labelStyle: TextStyle(color: Colors.amber),
            // hintText: 'hintText',
            // errorText: 'errorText',
            // helperMaxLines: 1,
            // hintTextDirection: TextDirection.rtl,

            // Types of borders, most useful focused + enabled

            // focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue, width: 2),
            //   borderRadius: BorderRadius.circular(10),
            // ),
            // enabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black, width: 2),
            // ),
            // errorText: 'errorText',
            // focusedErrorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.brown, width: 2),
            //   borderRadius: BorderRadius.circular(10),
            // ),
            // errorBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 2),
            // ),
            // disabledBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red, width: 2),
            // ),
            // enabled: true,

            // border: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue, width: 10, style: BorderStyle.solid),
            // )
          ),
        ),
      ),
    );
  }
}
