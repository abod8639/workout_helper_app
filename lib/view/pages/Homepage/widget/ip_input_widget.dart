import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/esp32_controller.Getx.dart';

class IPInputField extends StatelessWidget {
  const IPInputField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ESP32Controller>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 5.0),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ESP32 IP Address',
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade300
                ),
                controller: controller.ipInputController,
                onChanged: controller.updateESP32IP,
                decoration: InputDecoration(
                  prefixText: ESP32Controller.ipPrefix,
                  hintText: '  Enter IP address',
                  prefixStyle: TextStyle(
                    fontSize: 20,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
