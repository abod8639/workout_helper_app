import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/controller/theme_controller.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/ip_input_widget.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // bool _notificationsEnabled = true;
  // double textScale = 1.0;

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Theme.of(context).primaryColor),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingCard({
    required String title,
    required Widget child,
    String? subtitle,
    IconData? icon,
    Color? iconColor,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (icon != null)
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: (iconColor ?? Theme.of(context).primaryColor)
                            .withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        icon,
                        color: iconColor ?? Theme.of(context).primaryColor,
                        size: 20,
                      ),
                    ),
                  if (icon != null) const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (subtitle != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              subtitle,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              if (child != const SizedBox()) const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            // color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          _buildSectionTitle('Connection Settings', Icons.wifi),
          _buildSettingCard(
            title: 'ESP32 IP Address',
            subtitle: 'Enter the IP address of your ESP32 device',
            icon: Icons.router,
            iconColor: Colors.blue,
            child: IPInputField(),
          ),
          _buildSectionTitle('App Settings', Icons.settings),
          Obx(
            () => _buildSettingCard(
              title: 'Theme',
              icon: Icons.palette,
              iconColor: Colors.purple,
              child: DropdownButton<String>(
                value: ThemeController.to.currentTheme,
                isExpanded: true,
                items: ['System', 'Light', 'Dark']
                    .map(
                      (String value) => DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      ),
                    )
                    .toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    ThemeController.to.setTheme(newValue);
                  }
                },
              ),
            ),
          ),
          // _buildSettingCard(
          //   title: 'Text Size',
          //   subtitle: 'Adjust the size of text throughout the app',
          //   icon: Icons.text_fields,
          //   iconColor: Colors.green,
          //   child: Slider(
          //     value: textScale,
          //     min: 0.8,
          //     max: 1.4,
          //     divisions: 6,
          //     label: '${(textScale * 100).round()}%',
          //     onChanged: (value) {
          //       setState(() {
          //         textScale = value;
          //       });
          //     },
          //   ),
          // ),
          // _buildSettingCard(
          //   title: 'Notifications',
          //   subtitle: 'Receive workout reminders and updates',
          //   icon: Icons.notifications,
          //   iconColor: Colors.orange,
          //   child: Switch(
          //     value: _notificationsEnabled,
          //     onChanged: (value) {
          //       setState(() {
          //         _notificationsEnabled = value;
          //       });
          //     },
          //   ),
          // ),
          _buildSettingCard(
            title: 'App Version',
            icon: Icons.info,
            iconColor: Colors.grey,
            child: const Text(
              '1.0.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          // const SizedBox(height: 16),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16),
          //   child: ElevatedButton(
          //     onPressed: () {
          //       // TODO: Implement reset settings
          //     },
          //     style: ElevatedButton.styleFrom(
          //       padding: const EdgeInsets.all(16),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(12),
          //       ),
          //     ),
          //     child: const Text('Reset All Settings'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
