import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:workout_helper_app/function/initGetX.Getx.dart';
import 'package:workout_helper_app/view/pages/Home.dart';
import 'package:workout_helper_app/app/theme.dart';
import 'package:workout_helper_app/model/TaskTime.dart';
import 'package:workout_helper_app/model/ExerciseModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  Hive.registerAdapter(TaskTimeAdapter());
  Hive.registerAdapter(ExerciseModelAdapter());  
  await Hive.openBox<ExerciseModel>('exercises');
  
  initGetX();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: const Home(),
    );
  }
}
