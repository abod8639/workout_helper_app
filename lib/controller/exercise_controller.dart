import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';
import 'package:workout_helper_app/model/TaskModel.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/function/SendTask.dart';

class ExerciseController extends GetxController {
  final exerciseBox = Hive.box<ExerciseModel>('exercises');

  Future<void> addExercise(String title, String imageUrl, TaskTime time , ) async {
    final exercise = ExerciseModel(
      title: title,
      imageUrl: imageUrl,
      time: time,
      // test: test
    );
    await exerciseBox.add(exercise);
  }

  List<ExerciseModel> getAllExercises() {
    return exerciseBox.values.toList();
  }

  Future<void> sendExercise(ExerciseModel exercise) async {
    await sendTask([
      TaskModel(name: exercise.title, time: exercise.time),
    ]);
  }

  Future<void> deleteExercise(ExerciseModel exercise) async {
    await exercise.delete();
    update();
  }
}
