import 'package:hive/hive.dart';
import 'TaskTime.dart';

part 'ExerciseModel.g.dart';

@HiveType(typeId: 1)
class ExerciseModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String imageUrl;

  @HiveField(2)
  TaskTime time;

  ExerciseModel({
    required this.title,
    required this.imageUrl,
    required this.time,
  });
}
