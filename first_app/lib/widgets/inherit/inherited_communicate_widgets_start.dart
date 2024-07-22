import 'package:first_app/widgets/inherit/inherited_communicate_widgets_finish.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InheritedCommunicateExample extends StatelessWidget {
  const InheritedCommunicateExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SimpleCalcWidget(),
      ),
    );
  }
}

class SimpleCalcWidget extends StatefulWidget {
  const SimpleCalcWidget({Key? key}) : super(key: key);

  @override
  State<SimpleCalcWidget> createState() => _SimpleCalcWidgetState();
}

class _SimpleCalcWidgetState extends State<SimpleCalcWidget> {
  final _model = SimpleCalcWidgetModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SimpleCalcWidgetProvider(
          model: _model,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FirstNumberWidget(),
              SizedBox(height: 10),
              SecondNumberWidget(),
              SizedBox(height: 10),
              SumButtonWidget(),
              SizedBox(height: 10),
              ResultWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstNumberWidget extends StatelessWidget {
  const FirstNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.firstNumber = value,
    );
  }
}

class SecondNumberWidget extends StatelessWidget {
  const SecondNumberWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(border: OutlineInputBorder()),
      onChanged: (value) =>
          SimpleCalcWidgetProvider.read(context)?.secondNumber = value,
    );
  }
}

class SumButtonWidget extends StatelessWidget {
  const SumButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => SimpleCalcWidgetProvider.read(context)?.sum(),
      child: const Text('Calculate'),
    );
  }
}



// class ResultWidget extends StatefulWidget {
//   const ResultWidget({Key? key}) : super(key: key);
//
//   @override
//   State<ResultWidget> createState() => _ResultWidgetState();
// }
//
// class _ResultWidgetState extends State<ResultWidget> {
//   int _value = -1;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//
//     final model = SimpleCalcWidgetProvider.of(context)?.model;
//     model?.addListener(() {
//       _value = model.sumResult ?? -1;
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Text('$_value');
//   }
// }

class ResultWidget extends StatelessWidget {
  const ResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final sumResult = SimpleCalcWidgetProvider.watch(context)?.sumResult ?? -1;
    return Text('$sumResult');
  }
}


class SimpleCalcWidgetModel extends ChangeNotifier {
  int? _firstNumber;
  int? _secondNumber;
  int? sumResult;

  set firstNumber(String value) => _firstNumber = int.tryParse(value);

  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void sum() {
    int? sumResult;
    if (_firstNumber != null && _secondNumber != null) {
      sumResult = _firstNumber! + _secondNumber!;
    } else {
      sumResult = null;
    }
    if (this.sumResult != sumResult) {
      this.sumResult = sumResult;
      notifyListeners();
    }
  }
}


// class SimpleCalcWidgetProvider extends InheritedNotifier<SimpleCalcWidgetModel> {
  // final SimpleCalcWidgetModel model;
  //
  // const SimpleCalcWidgetProvider({
  //   super.key,
  //   required Widget child,
  //   required this.model,
  // }) : super(child: child, notifier: model);
  //
  // static SimpleCalcWidgetModel? of(BuildContext context) {
  //   return context
  //       .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()?.model;
  // }

  // @override
  // bool updateShouldNotify(SimpleCalcWidgetProvider oldWidget) {
  //   return model != oldWidget.model;
  // }
// }


class SimpleCalcWidgetProvider extends InheritedNotifier<SimpleCalcWidgetModel> {
  const SimpleCalcWidgetProvider({
    super.key,
    required Widget child,
    required SimpleCalcWidgetModel model,
  }) : super(child: child, notifier: model);

  static SimpleCalcWidgetModel? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()?.notifier;
  }

  static SimpleCalcWidgetModel? read(BuildContext context) {
    final widget = context.getElementForInheritedWidgetOfExactType<SimpleCalcWidgetProvider>()?.widget;
    return widget is SimpleCalcWidgetProvider ? widget.notifier : null;
  }

  @override
  bool updateShouldNotify(SimpleCalcWidgetProvider oldWidget) {
    return notifier != oldWidget.notifier;
  }
}
