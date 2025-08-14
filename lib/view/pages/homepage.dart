import 'package:flutter/material.dart';
import 'virtual_coach_page.dart';
import 'heart_rate_stats_page.dart';
import 'calorie_tracker_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  Widget _buildNavigationButton(
    BuildContext context,
    String title,
    VoidCallback onPressed,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.green[800],
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget taskInput() {
    TextEditingController taskInputController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: taskInputController,
        decoration: InputDecoration(
          labelText: 'Enter your task',
          labelStyle:  TextStyle(color: Colors.green[800]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.green[800]!),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[800]!, Colors.green[600]!],
          ),
        ),
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
              _buildNavigationButton(
                context,
                'Virtual AI Coach',
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VirtualCoachPage(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildNavigationButton(
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
              _buildNavigationButton(
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
