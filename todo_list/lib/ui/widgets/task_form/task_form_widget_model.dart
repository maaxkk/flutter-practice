import 'package:flutter/material.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entity/task.dart';

class TaskFormWidgetModel extends ChangeNotifier {
  int groupKey;
  var _taskText = '';
  bool get isValid => _taskText.trim().isNotEmpty;

  set taskText(String value) {
    final isTaskTextEmpty = _taskText.trim().isEmpty;
    _taskText = value;
    if (value.trim().isEmpty != isTaskTextEmpty) {
      notifyListeners();
    }
  }

  TaskFormWidgetModel({required this.groupKey});

  void saveTask(BuildContext context) async {
    final taskText = _taskText.trim();
    if (taskText.isEmpty) return;

    final taskBox = await BoxManager.instance.openTaskBox(groupKey);
    final task = Task(text: taskText, isDone: false);
    await taskBox.add(task);

    // final groupBox = await Hive.openBox<Group>('groups_box');
    // final group = groupBox.get(groupKey);
    // group?.addTask(taskBox, task);

    await BoxManager.instance.closeBox(taskBox);
    Navigator.of(context).pop();
  }
}

class TaskFormWidgetModelProvider extends InheritedNotifier {
  final TaskFormWidgetModel model;
  const TaskFormWidgetModelProvider({
    super.key,
    required Widget child,
    required this.model,
  }) : super(child: child, notifier: model);

  static TaskFormWidgetModelProvider watch(BuildContext context) {
    final TaskFormWidgetModelProvider? result = context.dependOnInheritedWidgetOfExactType<TaskFormWidgetModelProvider>();
    assert(result != null, 'No TaskFormWidgetModelProvider found in context');
    return result!;
  }

  static TaskFormWidgetModelProvider? read(BuildContext context) {
    final Widget? widget = context.getElementForInheritedWidgetOfExactType<TaskFormWidgetModelProvider>()?.widget;
    assert(widget != null, 'No widget found in provider');
    return widget is TaskFormWidgetModelProvider ? widget : null;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
