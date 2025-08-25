import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/CustomInputField%20.dart';

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
    // Initialize controllers with current values
    _titleController.text = exercise.title;
    _imageUrlController.text = exercise.imageUrl;
    _hoursController.text = exercise.time.hour.toString();
    _minutesController.text = exercise.time.minute.toString();
    _testController.text = exercise.time.test!;

    final exerciseController = Get.find<ExerciseController>();

    return AlertDialog(
      title: const Text('Edit Exercise'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomInputField(
              keyboardType: TextInputType.text,
              controller: _titleController,
              hintText: 'Exercise Title',
              prefixIcon: const Icon(Icons.title, color: Colors.white54),
            ),
            CustomInputField(
              keyboardType: TextInputType.url,
              controller: _imageUrlController,
              hintText: 'Image URL',
              prefixIcon: const Icon(Icons.image, color: Colors.white54),
            ),

            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    keyboardType: TextInputType.number,

                    controller: _hoursController,
                    hintText: 'Hours',
                    prefixIcon: const Icon(
                      Icons.schedule,
                      color: Colors.white54,
                    ),
                  ),
                ),
                // const SizedBox(width: 16),
                Expanded(
                  child: CustomInputField(
                    keyboardType: TextInputType.number,
                    controller: _minutesController,
                    hintText: 'Minutes',
                    prefixIcon: const Icon(Icons.timer, color: Colors.white54),
                  ),
                ),
              ],
            ),
            CustomInputField(
              keyboardType: TextInputType.text,
              controller: _testController,
              hintText: 'test',
              prefixIcon: const Icon(
                Icons.content_paste_go_sharp,
                color: Colors.white54,
              ),
            ),
            // TextField(
            //   controller: _testController,
            //   decoration: const InputDecoration(labelText: 'test'),
            // ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            // Update exercise values
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
