import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/CustomInputField%20.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskDialogRowButton.dart';

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
    return AlertDialog(
      title: const Text('Add New Exercise'),
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
        taskDialogRowButton(
          setState: setState,
          hoursController: _hoursController,
          minutesController: _minutesController,
          titleController: _titleController,
          testStringController: _testController,
          imageUrlController: _imageUrlController,
        ),
        // TextButton(
        //   onPressed: () => Get.back(),
        //   child: const Text('Cancel'),
        // ),
        // TextButton(

        //   onPressed: () async {
        //     if (_titleController.text.isNotEmpty &&
        //         _imageUrlController.text.isNotEmpty) {
        //       final hours = int.tryParse(_hoursController.text) ?? 0;
        //       final minutes = int.tryParse(_minutesController.text) ?? 0;
        //       final test = _testController.text ;

        //       await exerciseController.addExercise(
        //         _titleController.text,
        //         _imageUrlController.text,
        //         TaskTime(hour: hours, minute: minutes,test: test),
        //       );

        //       Get.back();
        //     }
        //   },
        //   child: const Text('Add'),
        // ),
      ],
    );
  }
}
