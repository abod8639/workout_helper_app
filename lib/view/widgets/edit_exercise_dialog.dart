import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskDialogRowButton.dart';
import 'package:workout_helper_app/view/widgets/ExerciseDialog.dart';

class EditExerciseDialog extends StatefulWidget {
  final ExerciseModel exercise;

  const EditExerciseDialog({super.key, required this.exercise});

  @override
  State<EditExerciseDialog> createState() => _EditExerciseDialogState();
}

class _EditExerciseDialogState extends State<EditExerciseDialog> {
  final _titleController = TextEditingController();

  final _imageUrlController = TextEditingController();

  final _hoursController = TextEditingController();

  final _minutesController = TextEditingController();

  final _testController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.exercise.title;
    _imageUrlController.text = widget.exercise.imageUrl;
    _hoursController.text = widget.exercise.time.hour.toString();
    _minutesController.text = widget.exercise.time.minute.toString();
    _testController.text = widget.exercise.time.test!;

    final exerciseController = Get.find<ExerciseController>();

    return ExerciseDialog(
      titleController: _titleController,
      imageUrlController: _imageUrlController,
      hoursController: _hoursController,
      minutesController: _minutesController,
      testController: _testController,
      title: 'Edit Exercise',
      actions: <Widget>[
        taskDialogRowButton(
          textButton: "Save",
          setState: setState,
          hoursController: _hoursController,
          minutesController: _minutesController,
          titleController: _titleController,
          testStringController: _testController,
          imageUrlController: _imageUrlController,
          onPressed: () async {
            widget.exercise.title = _titleController.text;
            widget.exercise.imageUrl = _imageUrlController.text;
            widget.exercise.time = TaskTime(
              hour:
                  int.tryParse(_hoursController.text) ??
                  widget.exercise.time.hour,
              minute:
                  int.tryParse(_minutesController.text) ??
                  widget.exercise.time.minute,
              test: _testController.text.isNotEmpty
                  ? _testController.text
                  : widget.exercise.time.test,
            );

            widget.exercise.save();

            exerciseController.update();

            Get.back();
            Get.snackbar(
              'Success',
              'Exercise updated successfully',
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 2),
            );
          },
        ),
      ],
    );
  }
}
