import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/AddNewTask.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/TaskList.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/ip_input_widget.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              title(),
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
  Padding title() {
    return Padding(
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
            );
  }
