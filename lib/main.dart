import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/function/initGetX.Getx.dart';
import 'package:workout_helper_app/view/pages/Home.dart';
import 'package:workout_helper_app/app/theme.dart';

void main() {
  initGetX();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: const Home(),
    );
  }
}
