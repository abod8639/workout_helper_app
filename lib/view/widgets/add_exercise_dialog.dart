import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/model/TaskTime.dart';

class AddExerciseDialog extends StatelessWidget {
  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();

  AddExerciseDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final exerciseController = Get.find<ExerciseController>();

    return AlertDialog(
      title: const Text('Add New Exercise'),
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
          onPressed: () async {
            if (_titleController.text.isNotEmpty &&
                _imageUrlController.text.isNotEmpty) {
              final hours = int.tryParse(_hoursController.text) ?? 0;
              final minutes = int.tryParse(_minutesController.text) ?? 0;

              await exerciseController.addExercise(
                _titleController.text,
                _imageUrlController.text,
                TaskTime(hour: hours, minute: minutes),
              );

              Get.back();
            }
          },
          child: const Text('Add'),
        ),
      ],
    );
  }
}
