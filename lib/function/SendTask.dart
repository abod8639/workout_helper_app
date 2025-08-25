import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:workout_helper_app/controller/esp32_controller.Getx.dart';
import 'package:workout_helper_app/model/jsonModel.dart';

Future<bool> sendTask(List<TaskModel> tasks) async {
  final controller = Get.find<ESP32Controller>();

  try {
    final jsonData = tasks
        .map(
          (e) => {
            "name": e.name,
            "time": {
              "hour": e.time.hour,
              "minute": e.time.minute,
              "test": e.time.test,
            },
          },
        )
        .toList();

    final response = await http.post(
      Uri.parse('http://${controller.fullIP}/tasks'),
      headers: {"Content-Type": "application/json"},
      body: json.encode(jsonData),
    );

    return response.statusCode == 200;
  } catch (e) {
    print("Error: $e");
    return false;
  }
}
