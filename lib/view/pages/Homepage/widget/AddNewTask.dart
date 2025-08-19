import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      onPressed: () => _showAddTaskDialog(context),
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
    final exerciseNameController = TextEditingController();
    final hoursController = TextEditingController();
    final minutesController = TextEditingController();
    final testStringController = TextEditingController();

    TimeOfDay? selectedTime;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
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
                    CustomInputField(
                      controller: exerciseNameController,
                      hintText: 'Exercise Name',
                      keyboardType: TextInputType.text,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: CustomInputField(
                            controller: hoursController,
                            hintText: 'Hours',
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: CustomInputField(
                            controller: minutesController,
                            hintText: 'Minutes',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      controller: testStringController,
                      hintText: 'Test String',
                      keyboardType: TextInputType.text,
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      hourLabelText: 'Hour',
                      minuteLabelText: 'Minute',
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                        hoursController.text = pickedTime.hour.toString().replaceAll(":", "");
                        minutesController.text = pickedTime.minute.toString().replaceAll("AM", "").replaceAll("PM", "");
                      });
                    }
                  },
                  child: Text(
                    selectedTime == null
                        ? 'Pick Time'
                        : 'Time: ${selectedTime!.format(context)}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.2),
                  ),
                  onPressed: () {
                    final taskName = exerciseNameController.text.trim();
                    final hours = int.tryParse(hoursController.text.trim()) ?? 0;
                    final minutes = int.tryParse(minutesController.text.trim()) ?? 0;
                    final testString = testStringController.text.trim();

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
                      Get.back();
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.number,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: keyboardType,
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
    );
  }
}
