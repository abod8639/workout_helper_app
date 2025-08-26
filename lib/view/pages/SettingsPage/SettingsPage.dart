import 'package:flutter/material.dart';
import 'package:workout_helper_app/view/pages/Homepage/widget/ip_input_widget.dart';
import 'package:workout_helper_app/view/widgets/MyAppBar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context: context, title: 'Settings'),
      body: ListView(
        children: [
        const SizedBox(height: 50),
         IPInputField(),
         ]),
    );
  }
}
