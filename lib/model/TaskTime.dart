
class TaskTime {
  final int hour;
  final int minute;
  final String? test;

  TaskTime({required this.hour, required this.minute, this.test});

  factory TaskTime.fromJson(Map<String, dynamic> json) {
    return TaskTime(
      hour: json['hour'] ?? 0,
      minute: json['minute'] ?? 0,
      test: json['test'] ?? '',
    );
  }
}
