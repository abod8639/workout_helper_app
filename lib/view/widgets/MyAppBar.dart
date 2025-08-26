
  import 'package:flutter/material.dart';

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
      title: Text(title, 
        style: TextStyle(
          color: Colors.white,
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
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.settings_outlined, color: Colors.white, size: 20),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

