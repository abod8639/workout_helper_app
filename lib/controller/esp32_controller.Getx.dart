
import 'package:flutter/material.dart';
import 'package:get/get.dart';


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
      debugPrint(' ESP32 IP updated: ${esp32IP.value}');
    }
  }


}




