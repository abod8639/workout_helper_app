import 'package:flutter/material.dart';
import 'package:workout_helper_app/controller/esp32_controller.dart';
import 'package:workout_helper_app/model/jsonModel.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/AddNewTask.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/TaskList.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFF2C5364), // Deep blue
              const Color(0xFF203A43), // Mid blue
              const Color(0xFF0F2027), // Dark blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Workout Helper',
                  style: TextStyle(
                    shadows: [
                      Shadow(
                        color: Colors.black.withAlpha(150),
                        offset: const Offset(0, 2),
                        blurRadius: 4,
                      ),
                    ],
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const SizedBox(height: 50),
              IPInputField(),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Workout Exercises',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TaskList(),
              const SizedBox(height: 20),
              AddNewTask(),
            ],
          ),
        ),
      ),
    );
  }
}

List<TaskModel> pushUps = [
  TaskModel(name: "Push-ups", time: TaskTime(hour: 1, minute: 30)),
];
