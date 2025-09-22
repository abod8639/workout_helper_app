import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskDialogRowButton.dart';
import 'package:workout_helper_app/view/widgets/ExerciseDialog.dart';

class AddExerciseDialog extends StatefulWidget {
  const AddExerciseDialog({super.key});

  @override
  State<AddExerciseDialog> createState() => _AddExerciseDialogState();
}

class _AddExerciseDialogState extends State<AddExerciseDialog> {
  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();
  final _testController = TextEditingController();
  final exerciseController = Get.find<ExerciseController>();

  @override
  Widget build(BuildContext context) {
    return ExerciseDialog(
      titleController: _titleController,
      imageUrlController: _imageUrlController,
      hoursController: _hoursController,
      minutesController: _minutesController,
      testController: _testController,
      title: 'Add New Exercise',
      actions: [
        
        taskDialogRowButton(
          textButton: "Add",
          setState: setState,
          hoursController: _hoursController,
          minutesController: _minutesController,
          titleController: _titleController,
          testStringController: _testController,
          imageUrlController: _imageUrlController,
          onPressed: () async {
            if (_titleController.text.isNotEmpty) {
              final hours = int.tryParse(_hoursController.text) ?? 0;
              final minutes = int.tryParse(_minutesController.text) ?? 0;
              final test = _testController.text;

              await exerciseController.addExercise(
                title: _titleController.text,
                imageUrl: _imageUrlController.text,
                time: TaskTime(hour: hours, minute: minutes, test: test),
              );
              setState(() {});
              Get.back();
            }
          },
        ),
      ],
    );
  }
}
