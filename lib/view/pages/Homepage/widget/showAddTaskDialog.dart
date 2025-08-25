import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/function/SendTask.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/model/TaskModel.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/CustomInputField%20.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/taskDialogTitle.dart';

void showAddTaskDialog(BuildContext context) {
  final exerciseNameController = TextEditingController();
  final hoursController = TextEditingController();
  final minutesController = TextEditingController();
  final testStringController = TextEditingController();


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            backgroundColor: const Color(0xFF1E2630),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white.withOpacity(0.1), width: 1),
            ),
            title: taskDialogTitle(),
            contentPadding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            content: Container(
              constraints: const BoxConstraints(maxWidth: 400),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    const Text(
                      'Exercise Details',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 16),

                    CustomInputField(
                      controller: exerciseNameController,
                      hintText: 'Exercise Name',
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.fitness_center,
                        color: Colors.white54,
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Duration',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [

                        Expanded(
                          child: CustomInputField(
                            controller: hoursController,
                            hintText: 'Hours',
                            prefixIcon: const Icon(
                              Icons.schedule,
                              color: Colors.white54,
                            ),
                          ),
                        ),

                        const SizedBox(width: 16),

                        Expanded(
                          child: CustomInputField(
                            controller: minutesController,
                            hintText: 'Minutes',
                            prefixIcon: const Icon(
                              Icons.timer,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Additional Info',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const SizedBox(height: 16),

                    CustomInputField(
                      controller: testStringController,
                      hintText: 'Test String',
                      keyboardType: TextInputType.text,
                      prefixIcon: const Icon(
                        Icons.info_outline,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              taskDialogRowButton(
                setState,
                hoursController,
                minutesController,
                exerciseNameController,
                testStringController,
              ),
            ],
          );
        },
      );
    },
  );
}

Builder taskDialogRowButton( StateSetter setState,  TextEditingController hoursController, TextEditingController minutesController, TextEditingController exerciseNameController, TextEditingController testStringController) {
  return Builder(

    builder: (context) {
      TimeOfDay? selectedTime;
      return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () async {
                        final pickedTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                          hourLabelText: 'Hour',
                          minuteLabelText: 'Minute',
                          builder: (context, child) {
                            return Theme(
                              data: ThemeData.dark().copyWith(
                                colorScheme: const ColorScheme.dark(
                                  primary: Colors.blue,
                                  onPrimary: Colors.white,
                                  surface: Color(0xFF1E2630),
                                  onSurface: Colors.white,
                                ),
                              ),
                              child: child!,
                            );
                          },
                        );
                        if (pickedTime != null) {
                          setState(() {
                            selectedTime = pickedTime;
                            hoursController.text = pickedTime.hour
                                .toString()
                                .replaceAll(":", "");
                            minutesController.text = pickedTime.minute
                                .toString()
                                .replaceAll("AM", "")
                                .replaceAll("PM", "");
                          });
                        }
                      },
                      icon: const Icon(Icons.access_time, color: Colors.blue),
                      label: Text(
                        selectedTime == null
                            ? 'Pick Time'
                            : 'Time: ${selectedTime.format(context)}',
                        style: const TextStyle(color: Colors.blue),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 12,
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            final taskName = exerciseNameController.text.trim();
                            final hours =
                                int.tryParse(hoursController.text.trim()) ?? 0;
                            final minutes =
                                int.tryParse(minutesController.text.trim()) ?? 0;
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
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
    }
  );
}
