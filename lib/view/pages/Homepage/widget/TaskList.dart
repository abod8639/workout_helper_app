import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/function/SendTask.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/model/TaskModel.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskCard.dart';
import 'package:workout_helper_app/view/widgets/add_exercise_dialog.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 180,
          child: GetBuilder<ExerciseController>(
            builder: (controller) {
              final exercises = controller.getAllExercises();

              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                children: [
                  // Add Exercise Button
                  SizedBox(
                    width: 140,
                    child: Card(
                      child: InkWell(
                        onTap: () {
                          Get.dialog(AddExerciseDialog());
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_circle_outline, size: 40),
                            SizedBox(height: 8),
                            Text(
                              'Add New Exercise',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Predefined exercises
                  TaskCard(
                    title: "LED-TEST",
                    imageUrl:
                        "https://i.pinimg.com/1200x/a9/85/ea/a985ea59bb63d62feb6ad777c44e6813.jpg",
                    onTap: () {
                      sendTask([
                        TaskModel(
                          name: "LED-toggle",
                          time: TaskTime(
                            hour: 1,
                            minute: 50,
                            test: "LED-toggle",
                          ),
                        ),
                      ]);
                    },
                  ),
                  TaskCard(
                    title: "Push-ups",
                    imageUrl:
                        "https://i.pinimg.com/1200x/7d/ab/36/7dab366ba4ec4013637117176b94ebed.jpg",
                    onTap: () {
                      sendTask([
                        TaskModel(
                          name: "Push-ups",
                          time: TaskTime(hour: 1, minute: 50),
                        ),
                      ]);
                    },
                  ),
                  TaskCard(
                    title: "Puzzer-TEST",
                    imageUrl:
                        "https://i.pinimg.com/originals/ee/6e/d5/ee6ed5945d444fb5046149386acec4c8.gif",
                    onTap: () {
                      sendTask([
                        TaskModel(
                          name: "puzzer-toggle",
                          time: TaskTime(hour: 1, minute: 50,test: "puzzer-toggle"),
                        ),
                      ]);
                    },
                  ),
                  ...exercises
                      .map(
                        (exercise) => TaskCard(
                          title: exercise.title,
                          imageUrl: exercise.imageUrl,
                          exercise: exercise, // Pass the exercise object
                          onTap: () => controller.sendExercise(exercise),
                        ),
                      )
                      ,
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
