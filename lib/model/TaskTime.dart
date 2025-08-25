
import 'package:hive/hive.dart';

part 'TaskTime.g.dart';

@HiveType(typeId: 0)
class TaskTime extends HiveObject {
  @HiveField(0)
  final int hour;

  @HiveField(1)
  final int minute;

  @HiveField(2)
  final String? test;

  TaskTime({required this.hour, required this.minute, this.test});

  factory TaskTime.fromJson(Map<String, dynamic> json) {
    return TaskTime(
      hour: json['hour'] ?? 0,
      minute: json['minute'] ?? 0,
      test: json['test'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hour': hour,
      'minute': minute,
      if (test != null) 'test': test,
    };
  }
}
