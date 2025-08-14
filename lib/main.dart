import 'package:flutter/material.dart';
import 'package:workout_helper_app/app/theme.dart';
import 'package:workout_helper_app/view/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: darkTheme,
      home: const MyHomePage(),
    );
  }
}
