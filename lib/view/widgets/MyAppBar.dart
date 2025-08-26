
  import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workout_helper_app/view/pages/SettingsPage/SettingsPage.dart';

MyAppBar({required BuildContext context,required String title}) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      // leading: IconButton(
      //   icon: Container(
      //     padding: const EdgeInsets.all(8),
      //     decoration: BoxDecoration(
      //       color: Colors.white.withOpacity(0.1),
      //       borderRadius: BorderRadius.circular(12),
      //     ),
      //     child: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
      //   ),
      //   onPressed: () {},// Navigator.pop(context),
      // ),
      title: Text(
        title, 
        style: TextStyle(
          color: Theme.of(context).textTheme.titleLarge?.color,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 16),
          child: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.settings_outlined, color: Theme.of(context).iconTheme.color, size: 25),
            ),
            onPressed: () => Get.to(()=> SettingsPage()), // Implement settings navigation
          ),
        ),
      ],
    );
  }

