import 'package:first_app/widgets/inherit/inherited_pass_data_to_child_finish.dart';
import 'package:flutter/material.dart';

class InheritExampleWidget extends StatelessWidget {
  const InheritExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: DataOwnerStatefull(),
      ),
    );
  }
}

class DataOwnerStatefull extends StatefulWidget {
  const DataOwnerStatefull({Key? key}) : super(key: key);

  @override
  _DataOwnerStatefullState createState() => _DataOwnerStatefullState();
}

class _DataOwnerStatefullState extends State<DataOwnerStatefull> {
  var _valueOne = 0;
  var _valueTwo = 0;

  void _incrimentOne() {
    _valueOne += 1;
    setState(() {});
  }

  void _incrimentTwo() {
    _valueTwo += 1;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: _incrimentOne,
          child: const Text('Click one'),
        ),
        ElevatedButton(
          onPressed: _incrimentTwo,
          child: const Text('Click two'),
        ),
        DataProviderInherited(
          valueOne: _valueOne,
          valueTwo: _valueTwo,
          child: const DataConsumerStateless(),
        ),
      ],
    );
  }
}

class DataConsumerStateless extends StatelessWidget {
  const DataConsumerStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>()?.valueOne ?? 0;
    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'one')?.valueOne ?? 0;
    // final value =
        // context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
        //     0;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$value'),
          const DataConsumerStatefull(),
        ],
      ),
    );
  }
}

class DataConsumerStatefull extends StatefulWidget {
  const DataConsumerStatefull({Key? key}) : super(key: key);

  @override
  _DataConsumerStatefullState createState() => _DataConsumerStatefullState();
}

class _DataConsumerStatefullState extends State<DataConsumerStatefull> {
  @override
  Widget build(BuildContext context) {
    // final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // final dataProvider = element?.widget as DataProviderInherited;
    // final value = dataProvider.value;

    // final value = getInherit<DataProviderInherited>(context)?.value ?? 0;

    // final element = context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
    // if (element != null) {
    //   context.dependOnInheritedElement(element);
    // }
    // final dataProvider = element?.widget as DataProviderInherited;
    // final value = dataProvider.valueTwo;

    final value = context.dependOnInheritedWidgetOfExactType<DataProviderInherited>(aspect: 'two')?.valueTwo ?? 0;

    // final value =
    //     context.findAncestorStateOfType<_DataOwnerStatefullState>()?._value ??
    //         0;
    return Text('$value');
  }
}

class DataProviderInherited extends InheritedModel<String> {
  final int valueOne;
  final int valueTwo;
  const DataProviderInherited({
    Key? key,
    required this.valueOne,
    required this.valueTwo,
    required Widget child,
  }) : super(key: key, child: child);

  static DataProviderInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
  }

  @override
  bool updateShouldNotify(DataProviderInherited oldWidget) {
    return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
  }

  @override
  bool updateShouldNotifyDependent(covariant DataProviderInherited oldWidget, Set<String> aspects) {
    final isValueOneUpdated = valueOne != oldWidget.valueOne && aspects.contains('one');
    final isValueTwoUpdated = valueTwo != oldWidget.valueTwo && aspects.contains('two');
    return isValueOneUpdated || isValueTwoUpdated;
  }
}

// class DataProviderInherited extends InheritedWidget {
//   final int valueOne;
//   final int valueTwo;
//   const DataProviderInherited({
//     Key? key,
//     required this.valueOne,
//     required this.valueTwo,
//     required Widget child,
//   }) : super(key: key, child: child);
//
//   static DataProviderInherited? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<DataProviderInherited>();
//   }
//
//   @override
//   bool updateShouldNotify(DataProviderInherited oldWidget) {
//     return valueOne != oldWidget.valueOne || valueTwo != oldWidget.valueTwo;
//   }
// }

T? getInherit<T>(BuildContext context) {
  final element =
  context.getElementForInheritedWidgetOfExactType<DataProviderInherited>();
  final widget = element?.widget;
  if (widget is T) {
    return widget as T;
  } else {
    return null;
  }
}
