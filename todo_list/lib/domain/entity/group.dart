import 'package:hive/hive.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group extends HiveObject {
  // Last used HiveField key is 1
  @HiveField(0)
  String name;

  // @HiveField(1)
  // HiveList<Task>? tasks;
  //
  Group(this.name);
  //
  // void addTask(Box<Task> box, Task task) {
  //   tasks ??= HiveList(box);
  //   tasks?.add(task);
  //   save();
  // }
}
