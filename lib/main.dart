import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_helper_app/controller/theme_controller.dart';
import 'package:workout_helper_app/function/initGetX.Getx.dart';
import 'package:workout_helper_app/test/test2.dart';
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
  await Hive.initFlutter();

  await Future.wait([
    
        Hive.openBox(HabitStorage.boxName),
      // Hive.openBox(ThemeStorageService.themeBox),
      // Hive.openBox(LangStorage.boxName),
    ]);
  
  initGetX();
  SharedPreferences.getInstance().then((prefs) {
    Get.put(ThemeController(prefs));
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const Home(),
    );
  }
}
