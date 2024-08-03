import 'package:flutter/material.dart';

class Block extends StatelessWidget {
  

  const Block();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: Offset(0, 2 * 0.5),
          ),
        ],
      ),
      child: const Center(
        child: Text(
          'W',
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            decoration: TextDecoration.none,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}
