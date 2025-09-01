import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/testcontroller.dart';
import 'package:workout_helper_app/test/test.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/TaskList.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/homePageTitle.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final HabitController controller = Get.put(HabitController());

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Theme.of(context).primaryColor.withOpacity(0.05),
          //     Theme.of(context).primaryColor.withOpacity(0.1),
          //   ],
          // ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const SizedBox(height: 24),
            homePageTitle(),
            // const SizedBox(height: 32),
            // Middle: Monthly Summary
            Center(
              child: Expanded(
                flex: 2,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: SingleChildScrollView(
                    reverse: true,
                    key: ValueKey<String>(controller.getStartDay()),
                    scrollDirection: Axis.horizontal,
                    child: MonthlySummary(
                      datasets: controller.db.heatmapDateSet,
                    ),
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 32),
            titleCard(context, "Workout Exercises"),
            const SizedBox(height: 24),
            Expanded(child: const TaskList()),
            const SizedBox(height: 24),
            // AddNewTask(),
          ],
        ),
      ),
    );
  }

  Padding titleCard(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.2),
            width: 1,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              Icons.fitness_center,
              // color: Colors.white.withOpacity(0.9),
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                // color: Colors.white.withOpacity(0.9),
                fontSize: 22,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
