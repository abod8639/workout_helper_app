import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/CustomInputField%20.dart';

class ExerciseDialog extends StatefulWidget {
  final List<Widget>? actions;
  ExerciseDialog({super.key, required this.actions});

  @override
  State<ExerciseDialog> createState() => _ExerciseDialogState();
}

class _ExerciseDialogState extends State<ExerciseDialog> {
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
          ],
        ),
      ),
      actions:widget.actions
    );
  }
}
