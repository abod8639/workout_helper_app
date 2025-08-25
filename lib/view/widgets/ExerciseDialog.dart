import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/CustomInputField%20.dart';

class ExerciseDialog extends StatefulWidget {
  final TextEditingController titleController;
  final TextEditingController imageUrlController;
  final TextEditingController hoursController;
  final TextEditingController minutesController;
  final TextEditingController testController;
  final List<Widget>? actions;
  final String title;
  ExerciseDialog({
    super.key,
    required this.actions,
    required this.title,
    required this.titleController,
    required this.imageUrlController,
    required this.hoursController,
    required this.minutesController,
    required this.testController,
  });

  @override
  State<ExerciseDialog> createState() => _ExerciseDialogState();
}

class _ExerciseDialogState extends State<ExerciseDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomInputField(
              keyboardType: TextInputType.text,
              controller: widget.titleController,
              hintText: 'Exercise Title',
              prefixIcon: const Icon(Icons.title, color: Colors.white54),
            ),
            CustomInputField(
              keyboardType: TextInputType.url,
              controller: widget.imageUrlController,
              hintText: 'Image URL',
              prefixIcon: const Icon(Icons.image, color: Colors.white54),
            ),

            Row(
              children: [
                Expanded(
                  child: CustomInputField(
                    keyboardType: TextInputType.number,

                    controller: widget.hoursController,
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
                    controller: widget.minutesController,
                    hintText: 'Minutes',
                    prefixIcon: const Icon(Icons.timer, color: Colors.white54),
                  ),
                ),
              ],
            ),
            CustomInputField(
              keyboardType: TextInputType.text,
              controller: widget.testController,
              hintText: 'test',
              prefixIcon: const Icon(
                Icons.content_paste_go_sharp,
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ),
      actions: widget.actions,
    );
  }
}
