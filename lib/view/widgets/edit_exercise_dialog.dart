import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/view/widgets/ExerciseDialog.dart';

class EditExerciseDialog extends StatelessWidget {
  final ExerciseModel exercise;

  EditExerciseDialog({super.key, required this.exercise});

  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();
  final _testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = exercise.title;
    _imageUrlController.text = exercise.imageUrl;
    _hoursController.text = exercise.time.hour.toString();
    _minutesController.text = exercise.time.minute.toString();
    _testController.text = exercise.time.test!;

    final exerciseController = Get.find<ExerciseController>();

    return ExerciseDialog(
      titleController: _titleController,
      imageUrlController: _imageUrlController,
      hoursController: _hoursController,
      minutesController: _minutesController,
      testController: _testController,
      title: 'Edit Exercise',
      actions: <Widget>[
        TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            exercise.title = _titleController.text;
            exercise.imageUrl = _imageUrlController.text;
            exercise.time = TaskTime(
              hour: int.tryParse(_hoursController.text) ?? exercise.time.hour,
              minute:
                  int.tryParse(_minutesController.text) ?? exercise.time.minute,
              test: _testController.text.isNotEmpty
                  ? _testController.text
                  : exercise.time.test,
            );

            exercise.save();

            exerciseController.update();

            Get.back();
            Get.snackbar(
              'Success',
              'Exercise updated successfully',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
