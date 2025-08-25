
import 'package:workout_helper_app/model/TaskTime.dart';

class TaskModel {
  final String name;
  final TaskTime time;

  TaskModel({required this.name, required this.time});

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'] ?? '',
      time: TaskTime.fromJson(json['time'] ?? {}),
    );
  }
}
