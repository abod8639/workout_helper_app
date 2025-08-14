  import 'package:flutter/material.dart';

Widget taskInput() {
    TextEditingController taskInputController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: taskInputController,
        decoration: InputDecoration(
          labelText: '  Enter your task',
          labelStyle:  TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.black),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }