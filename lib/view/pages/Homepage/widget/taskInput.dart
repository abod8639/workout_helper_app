  import 'package:flutter/material.dart';

Widget taskInput() {
    TextEditingController taskInputController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        controller: taskInputController,
        decoration: InputDecoration(
          labelText: 'Enter your task',
          labelStyle:  TextStyle(color: Colors.green[800]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.green[800]!),
          ),
          filled: true,
          fillColor: Colors.white,
        ),
        style: const TextStyle(color: Colors.black),
      ),
    );
  }