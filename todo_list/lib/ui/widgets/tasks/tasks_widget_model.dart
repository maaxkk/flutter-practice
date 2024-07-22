import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_list/domain/data_provider/box_manager.dart';
import 'package:todo_list/domain/entity/task.dart';
import 'package:todo_list/ui/navigation/main_navigation.dart';
import 'package:todo_list/ui/widgets/tasks/tasks_widget.dart';

class TasksWidgetModel extends ChangeNotifier {
  TasksWidgetConfiguration configuration;
  ValueListenable<Object>? _listenableBox;

  late final Future<Box<Task>> _box;
  var _tasks = <Task>[];

  List<Task> get tasks => _tasks;

  TasksWidgetModel({required this.configuration}) {
    _setup();
  }

  // Future<void> _readTasks() async {
  //   _tasks = (await _box).values.toList() ?? <Task>[];
  //   notifyListeners();
  // }

  Future<void> deleteTask(int taskIndex) async {
    final box = await _box;
    await box.deleteAt(taskIndex);
  }

  Future<void> doneToggle(int taskIndex) async {
    final box = await _box;
    final task = box.getAt(taskIndex);
    task?.isDone = !task.isDone;
    await task?.save();
  }

  // Future<void> _setupListenTasks() async {
  //   final box = await _groupBox;
  //   _readTasks();
  //   box.listenable(keys: <dynamic>[configuration.groupKey]).addListener(_readTasks);
  // }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed(MainNavigationRouteNames.tasksForm,
        arguments: configuration.groupKey);
  }

  Future<void> _readTasksFromHive() async {
    _tasks = (await _box).values.toList();
    print(tasks);
    notifyListeners();
  }

  void _setup() async {
    _box = BoxManager.instance.openTaskBox(configuration.groupKey);
    await _readTasksFromHive();
    _listenableBox = (await _box).listenable();
    _listenableBox?.addListener(() {
      _readTasksFromHive();
    });
  }

  @override
  Future<void> dispose() async {
    _listenableBox?.removeListener(_readTasksFromHive);
    await BoxManager.instance.closeBox((await _box));
    super.dispose();
  }
}

class TasksWidgetModelProvider extends InheritedNotifier {
  final TasksWidgetModel model;

  const TasksWidgetModelProvider({
    super.key,
    required Widget child,
    required this.model,
  }) : super(child: child, notifier: model);

  static TasksWidgetModelProvider watch(BuildContext context) {
    final TasksWidgetModelProvider? result =
        context.dependOnInheritedWidgetOfExactType<TasksWidgetModelProvider>();
    assert(result != null, 'No TasksWidgetModelProvider found in context');
    return result!;
  }

  static TasksWidgetModelProvider? read(BuildContext context) {
    final Widget? widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelProvider>()
        ?.widget;
    assert(widget != null, 'No TasksWidgetModelProvider found in context');
    return widget is TasksWidgetModelProvider ? widget : null;
  }
}
