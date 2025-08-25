
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';
import 'package:workout_helper_app/function/SendTask.dart';
import 'package:workout_helper_app/model/TaskModel.dart';
import 'package:workout_helper_app/model/TaskTime.dart';

Builder taskDialogRowButton( {
    required StateSetter setState,
    required TextEditingController hoursController,
    required TextEditingController minutesController,
    required TextEditingController titleController,
    required TextEditingController testStringController,
    required TextEditingController imageUrlController}) {
  return Builder(

    builder: (context) {
          final exerciseController = Get.find<ExerciseController>();

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
                                .replaceAll("am", "")
                                .replaceAll("pm", "")
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
                          onPressed: ()async {
                            final taskName = titleController.text.trim();
                            final hours =
                                int.tryParse(hoursController.text.trim()) ?? 0;
                            final minutes =
                                int.tryParse(minutesController.text.trim()) ?? 0;
                            final testString = testStringController.text.trim();
      
                            // if (taskName.isNotEmpty) {
                            //   sendTask([
                            //     TaskModel(
                            //       name: taskName,
                            //       time: TaskTime(
                            //         hour: hours,
                            //         minute: minutes,
                            //         test: testString,
                            //       ),
                            //     ),
                            //   ]);
                            //   Get.back();
                            // }
                                        if (titleController.text.isNotEmpty &&
                imageUrlController.text.isNotEmpty) {
              final hours = int.tryParse(hoursController.text) ?? 0;
              final minutes = int.tryParse(minutesController.text) ?? 0;
              final test = testStringController.text ;

              await exerciseController.addExercise(
                titleController.text,
                imageUrlController.text,
                TaskTime(
                  hour: hours,
                   minute: minutes,
                   test: test,
                    )

                    // test: test
              );

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
