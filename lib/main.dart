import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/app/theme.dart';
import 'package:workout_helper_app/controller/esp32_controller.dart';
import 'package:workout_helper_app/view/pages/Home.dart';

void main() {
    Get.put(ESP32Controller()); // Register once
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const Home(),
    );
  }
}
