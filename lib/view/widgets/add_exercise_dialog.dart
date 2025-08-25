import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskDialogRowButton.dart';
import 'package:workout_helper_app/view/widgets/ExerciseDialog.dart';

class AddExerciseDialog extends StatefulWidget {
  AddExerciseDialog({super.key});

  @override
  State<AddExerciseDialog> createState() => _AddExerciseDialogState();
}

class _AddExerciseDialogState extends State<AddExerciseDialog> {
  final _titleController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _hoursController = TextEditingController();
  final _minutesController = TextEditingController();
  final _testController = TextEditingController();

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
          setState: setState,
          hoursController: _hoursController,
          minutesController: _minutesController,
          titleController: _titleController,
          testStringController: _testController,
          imageUrlController: _imageUrlController,
        ),],
    );
   
  }
}
