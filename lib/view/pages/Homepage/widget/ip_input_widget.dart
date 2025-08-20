import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/esp32_controller.Getx.dart';

class IPInputField extends StatelessWidget {
  const IPInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ESP32Controller>();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'ESP32 IP Address',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: controller.ipInputController,
              onChanged: controller.updateESP32IP,
              decoration: InputDecoration(
                prefixText: ESP32Controller.ipPrefix,
                hintText: 'Enter IP address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
      ),
    );
  }
}