import 'package:flutter/material.dart';

// class Example extends StatelessWidget {
//   const Example({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//         child: DataOwnerStatefull(),
//       ),
//     );
//   }
// }

// class DataOwnerStatefull extends StatefulWidget {
//   const DataOwnerStatefull({Key? key}) : super(key: key);
//
//   @override
//   _DataOwnerStatefullState createState() => _DataOwnerStatefullState();
// }
//
// class _DataOwnerStatefullState extends State<DataOwnerStatefull> {
//   var _value = 0;
//
//   void _incriment() {
//     _value += 1;
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         ElevatedButton(
//           onPressed: _incriment,
//           child: const Text('Жми'),
//         ),
//         DataProviderInherited(
//           value: _value,
//           child: const DataConsumerStateless(),
//         ),
//       ],
//     );
//   }
// }

// class DataConsumerStateless extends StatelessWidget {
//   const DataConsumerStateless({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text('${DataProviderInherited.of(context)?.value ?? 0}'),
//           const DataConsumerStatefull(),
//         ],
//       ),
//     );
//   }
// }

// class DataConsumerStatefull extends StatefulWidget {
//   const DataConsumerStatefull({Key? key}) : super(key: key);
//
//   @override
//   _DataConsumerStatefullState createState() => _DataConsumerStatefullState();
// }

// class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
//   @override
//   Widget build(BuildContext context) {
//     return Text('${DataProviderInherited.of(context)?.value ?? 0}');
//   }
// }

