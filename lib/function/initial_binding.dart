import 'package:get/get.dart';
// import 'package:shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workout_helper_app/controller/theme_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    final prefs = await SharedPreferences.getInstance();
    Get.put(ThemeController(prefs));
  }
}
