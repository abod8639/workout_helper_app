import 'package:get/get.dart';
import 'package:workout_helper_app/controller/esp32_controller.Getx.dart';
import 'package:workout_helper_app/controller/exercise_controller.dart';

void initGetX() {
  Get.put(ESP32Controller());
  Get.put(ExerciseController());
}
