import 'package:flutter/material.dart';
import 'package:get/get.dart';

Builder taskDialogRowButton({
  required StateSetter setState,
  required TextEditingController hoursController,
  required TextEditingController minutesController,
  required TextEditingController titleController,
  required TextEditingController testStringController,
  required TextEditingController imageUrlController,
  required void Function()? onPressed,
  required String textButton,
}) {
  return Builder(
    builder: (context) {
      TimeOfDay selectedTime;
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
                  hoursController.text = pickedTime.hour.toString().replaceAll(
                    ":",
                    "",
                  );
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
              'Pick Time',
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
                child: const Text('Cancel', style: TextStyle(fontSize: 16)),
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
                onPressed: onPressed,
                child: Text(
                  textButton,
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
    },
  );
}
