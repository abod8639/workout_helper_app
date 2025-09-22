import 'package:workout_helper_app/model/TaskTime.dart';

class HabitModel {
  final String id;
  bool isCompleted;
  String name;
  final DateTime createdAt;
  DateTime? completedAt;
  TaskTime taskTime;

  HabitModel({
    String? id,
    required this.name,
    required this.isCompleted,
    required this.createdAt,
    this.completedAt,
    required this.taskTime,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  factory HabitModel.fromMap(Map<String, dynamic> map) {
    return HabitModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      taskTime: TaskTime.fromJson(map['task_time']),
      isCompleted: map['isCompleted'] ?? false,
      createdAt:
          map['created_at'] != null
              ? DateTime.parse(map['created_at'])
              : DateTime.now(),
      completedAt:
          map['completed_at'] != null
              ? DateTime.parse(map['completed_at'])
              : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      // 'name': name,
      'task_time': taskTime.toJson(),
      'isCompleted': isCompleted,
      'created_at': createdAt.toIso8601String(),
      'completed_at': completedAt?.toIso8601String(),
    };
  }

  // Convert to the current format used in the app
  List<dynamic> toLocalFormat() {
    return [isCompleted, taskTime.toJson()];
  }

  // Create from the current list format used in the app
  factory HabitModel.fromLocalFormat(List<dynamic> data) {
    return HabitModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      taskTime: TaskTime.fromJson(data[0]),
      isCompleted: data[1],
      name: data[2],
      createdAt: DateTime.now(),
    );
  }
}
