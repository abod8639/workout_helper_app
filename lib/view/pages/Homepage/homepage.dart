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
Widget title() {
  return Builder(
    builder: (context) => Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 16),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor.withOpacity(0.2),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.sports_gymnastics,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 32,
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Workout Helper',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                  shadows: [
                    Shadow(
                      color: Theme.of(context).shadowColor.withOpacity(0.3),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                ),
          ),
        ],
      ),
    ),
  );
}