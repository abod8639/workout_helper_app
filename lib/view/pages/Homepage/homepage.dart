import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/buildNavigationButton.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskInput.dart';
import '../heart_rate_stats_page.dart';
import '../calorie_tracker_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});









  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     // colors: [Colors.green[800]!, Colors.green[600]!],
        //   ),
        // ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Workout Helper',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 50),
              taskInput(),
              const SizedBox(height: 20),

              const SizedBox(height: 20),
              buildNavigationButton(
                context,
                'Heart Rate Stats',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HeartRateStatsPage(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              buildNavigationButton(
                context,
                'Calorie Tracker',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CalorieTrackerPage(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
