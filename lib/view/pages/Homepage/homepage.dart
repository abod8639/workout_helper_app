import 'package:flutter/material.dart';
import 'package:workout_helper_app/function/SendTask.dart';
import 'package:workout_helper_app/model/jsonModel.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskCard.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskInput.dart';

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
              taskInput(),
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
              SizedBox(
                height: 180,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  children: [
                    taskCard(
                      title: "Push-ups",
                      imageUrl:
                          "https://i.pinimg.com/1200x/7d/ab/36/7dab366ba4ec4013637117176b94ebed.jpg",
                      onTap: () {
                        TaskService().sendTasks(
                           [
                            TaskModel(
                              name: "Push-ups",
                              time: TaskTime(
                                hour: 2,
                                minute: 50
                                )),
                          ],
                        );
                      },
                    ),
                    taskCard(
                      title: "Squats",
                      imageUrl:
                          "https://i.pinimg.com/736x/ea/fb/f0/eafbf0d366919fe111f07a6953850ef4.jpg",
                      onTap: () {
                        TaskService().sendTasks(
                           [
                            TaskModel(
                              name: "Squats",
                              time: TaskTime(
                                hour: 4,
                                minute: 20
                                )),
                          ],
                        );
                      },
                    ),
                    taskCard(
                      title: "Planks",
                      imageUrl:
                          "https://i.pinimg.com/1200x/3a/c6/45/3ac64594cc1e62fdae241994f698939d.jpg",
                      onTap: () {
                        TaskService().sendTasks(
                           [
                            TaskModel(
                              name: "Planks",
                              time: TaskTime(
                                hour: 10, 
                                minute: 1
                                )),
                          ],
                        );
                      },
                    ),
                    taskCard(
                      title: "Burpees",
                      imageUrl:
                          "https://i.pinimg.com/736x/b6/3a/84/b63a8478915f80faec51e182c31cf124.jpg",
                      onTap: () {},
                    ),
                    taskCard(
                      title: "Jumping Jacks",
                      imageUrl:
                          "https://i.pinimg.com/736x/ea/fb/f0/eafbf0d366919fe111f07a6953850ef4.jpg",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
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