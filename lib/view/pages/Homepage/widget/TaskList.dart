import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/esp32_controller.dart';
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
              controller.sendTask([
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
              controller.sendTask ([
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
              controller.sendTask([
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
              controller.sendTask([
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
        ],
      ),
    );
  }
}
