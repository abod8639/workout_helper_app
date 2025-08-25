import 'package:flutter/material.dart';
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
                    // const SizedBox(height: 16),
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

                        // const SizedBox(width: 16),

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

                    // const SizedBox(height: 24),

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
              // taskDialogRowButton(
              //   setState,
              //   hoursController,
              //   minutesController,
              //   exerciseNameController,
              //   testStringController,
              // ),
            ],
          );
        },
      );
    },
  );
}
