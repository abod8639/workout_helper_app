import 'package:flutter/material.dart';
import 'package:workout_helper_app/function/SendTask.dart';
import 'package:workout_helper_app/model/jsonModel.dart';

class AddNewTask extends StatelessWidget {
  const AddNewTask({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      onPressed: () {
        _showAddTaskDialog(context);
      },
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.add, color: Colors.white),
          SizedBox(width: 8),
          Text(
            "Add New Exercise",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    String taskName = '';
    int hours = 0;
    int minutes = 0;
    String testString = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFF2C5364),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text(
            'Add New Exercise',
            style: TextStyle(color: Colors.white),
          ),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildInputField(
                  keyboardType: TextInputType.text,
                  hintText: 'Exercise Name',
                  onChanged: (value) {
                    taskName = value;
                  },
                ),

                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: buildInputField(
                        hintText: 'Hours',
                        onChanged: (value) {
                          hours = int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: buildInputField(
                        hintText: 'Minutes',
                        onChanged: (value) {
                          minutes = int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                    // const SizedBox(width: 16),
                  ],
                ),
                const SizedBox(height: 16),
                buildInputField(
                  keyboardType: TextInputType.text,
                  hintText: 'test string',
                  onChanged: (value) {
                  testString = value;
                }),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.2),
              ),
              onPressed: () {
                if (taskName.isNotEmpty) {
                  sendTask([
                    TaskModel(
                      name: taskName,
                      time: TaskTime(
                        hour: hours,
                        minute: minutes,
                        test: testString,
                      ),
                    ),
                  ]);
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}

Widget buildInputField({
  onChanged,
  hintText,
  keyboardType = TextInputType.number,
}) {
  return TextField(
    style: const TextStyle(color: Colors.white),
    keyboardType: TextInputType.number,
    decoration: InputDecoration(
      labelText: hintText,
      labelStyle: const TextStyle(color: Colors.white70),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white30),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
    onChanged: onChanged,
  );
}
