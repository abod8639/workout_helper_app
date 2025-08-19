import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:workout_helper_app/model/jsonModel.dart';

class ESP32Controller extends GetxController {
  static const String ipPrefix = '192.168.1.';

  final esp32IP = ''.obs;
  final ipInputController = TextEditingController();

  String get fullIP => esp32IP.value;

  @override
  void onInit() {
    super.onInit();
    ipInputController.text = '66'; // Default last octet
    updateESP32IP(ipInputController.text); 
  }

  @override
  void onClose() {
    ipInputController.dispose();
    super.onClose();
  }

  void updateESP32IP(String newIP) {
    if (newIP.isNotEmpty) {
      esp32IP.value = '$ipPrefix$newIP';
      debugPrint('✅ ESP32 IP updated: ${esp32IP.value}');
    }
  }

  Future<bool> sendTask(List<TaskModel> tasks) async {
        try {
      final jsonData = tasks
          .map(
            (e) => {
              "name": e.name,
              "time": {"hour": e.time.hour, "minute": e.time.minute, "test": e.time.test},
            },
              ).toList();

      final response = await http.post(
       Uri.parse('http://$fullIP/tasks'),
        headers: {"Content-Type": "application/json"},
        body: json.encode(jsonData),
      );

      return response.statusCode == 200;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
  //   try {
  //     final url = Uri.parse('http://$fullIP/$tasks');
  //     final response = await http.post(url, body: json.encode(tasks));

  //     if (response.statusCode == 200) {
  //       debugPrint('✅ Task [$tasks] sent successfully');
  //       return true;
  //     } else {
  //       debugPrint('❌ Failed: ${response.statusCode}');
  //       return false;
  //     }
  //   } catch (error) {
  //     debugPrint('⚠️ Error sending request: $error');
  //     return false;
  //   }
  // }
}



class IPInputField extends StatelessWidget {
  const IPInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ESP32Controller>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: controller.ipInputController,
        onChanged: controller.updateESP32IP,
        decoration: InputDecoration(
          labelText: 'ESP32 IP',
          prefixText: ESP32Controller.ipPrefix,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }
}
