import 'dart:convert';
import 'package:http/http.dart' as http;

// class TimeModel {
//   int? hour;
//   int? minute;

//   TimeModel({this.hour, this.minute});

//   TimeModel.fromJson(Map<String, dynamic> json) {
//     hour   = json['hour'];
//     minute = json['minute'];
//   }
// }

// class TaskModel {
//   String? id;
//   String? name;
//   TimeModel? time;

//   TaskModel({this.id, this.name, this.time});
//   TaskModel.fromJson(Map<String, dynamic> json) {
//     id   = json['id'];
//     name = json['name'];
//     time = json['time'] != null ? TimeModel.fromJson(json['time']) : null;
//   }
// }

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

class TaskTime {
  final int hour;
  final int minute;

  TaskTime({required this.hour, required this.minute});

  factory TaskTime.fromJson(Map<String, dynamic> json) {
    return TaskTime(hour: json['hour'] ?? 0, minute: json['minute'] ?? 0);
  }
}

class TaskService {
  final String esp32Url = "http://192.168.1.4/tasks";

  // TaskService({required this.esp32Url});

  Future<bool> sendTasks(List<TaskModel> tasks ) async {
    try {
      final jsonData = tasks
          .map(
            (e) => {
              "name": e.name,
              "time": {"hour": e.time.hour, "minute": e.time.minute},
            },
          )
          .toList();

      final response = await http.post(
        Uri.parse(esp32Url),
        headers: {"Content-Type": "application/json"},
        body: json.encode(jsonData),
      );

      return response.statusCode == 200;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
