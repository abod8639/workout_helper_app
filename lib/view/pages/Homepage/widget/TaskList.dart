import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/esp32_controller.Getx.dart';
import 'package:workout_helper_app/function/SendTask.dart';
import 'package:workout_helper_app/model/jsonModel.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskCard.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ESP32Controller>();

    return SizedBox(
      height: 180,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        children: [
          taskCard(
            title: "LED-TEST",
            imageUrl:
                "https://i.pinimg.com/1200x/a9/85/ea/a985ea59bb63d62feb6ad777c44e6813.jpg",
            onTap: () {
              sendTask([
                TaskModel(
                  name: "LED-toggle",
                  time: TaskTime(hour: 1, minute: 50, test: "LED-toggle"),
                ),
              ]);
              print(controller.esp32IP.value);
              print(controller.fullIP.toString());
            },
          ),
          taskCard(
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
          taskCard(
            title: "Squats",
            imageUrl:
                "https://i.pinimg.com/736x/ea/fb/f0/eafbf0d366919fe111f07a6953850ef4.jpg",
            onTap: () {
              sendTask([
                TaskModel(
                  name: "Squats",
                  time: TaskTime(test: "hello world", hour: 4, minute: 20),
                ),
              ]);
            },
          ),
          taskCard(
            title: "Planks",
            imageUrl:
                "https://i.pinimg.com/1200x/3a/c6/45/3ac64594cc1e62fdae241994f698939d.jpg",
            onTap: () {
              sendTask([
                TaskModel(name: "Planks", time: TaskTime(hour: 10, minute: 1)),
              ]);
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
                    taskCard(
            title: "Puzzer-toggle",
            imageUrl:
                "https://i.pinimg.com/736x/7d/58/ed/7d58ed71e86237abc1f31b67d8f08639.jpg",
            onTap: () {
              Get.showSnackbar(
                GetSnackBar(

                  title: "Send",
                  message: "Task sent successfully!",
                  duration: const Duration(seconds: 1),
                ),
              );
              sendTask([
                TaskModel(
                  name: "Puzzer-toggle",
                  time: TaskTime(hour: 1, minute: 50, test: "puzzer-toggle"),
                ),
              ]);
              print(controller.esp32IP.value);
              print(controller.fullIP.toString());
            },
          ),
        ],
      ),
    );
  }
}
