import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';
import 'package:workout_helper_app/model/TaskTime.dart';

class EditExerciseDialog extends StatelessWidget {
  final ExerciseModel exercise;
  
  EditExerciseDialog({super.key, required this.exercise});

  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Initialize controllers with current values
    _titleController.text = exercise.title;
    _imageUrlController.text = exercise.imageUrl;
    _hoursController.text = exercise.time.hour.toString();
    _minutesController.text = exercise.time.minute.toString();

    final exerciseController = Get.find<ExerciseController>();

    return AlertDialog(
      title: const Text('Edit Exercise'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Exercise Title'),
            ),
            TextField(
              controller: _imageUrlController,
              decoration: const InputDecoration(labelText: 'Image URL'),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _hoursController,
                    decoration: const InputDecoration(labelText: 'Hours'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: _minutesController,
                    decoration: const InputDecoration(labelText: 'Minutes'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            // Update exercise values
            exercise.title = _titleController.text;
            exercise.imageUrl = _imageUrlController.text;
            exercise.time = TaskTime(
              hour: int.tryParse(_hoursController.text) ?? exercise.time.hour,
              minute: int.tryParse(_minutesController.text) ?? exercise.time.minute,
            );
            
            // Save changes
            exercise.save();
            
            // Update UI
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
