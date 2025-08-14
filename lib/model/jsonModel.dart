


class TimeModel{
 int? hour;
 int? minute;
  TimeModel({this.hour, this.minute});
  
  TimeModel.fromJson(Map<String, dynamic> json) {
    hour = json['hour'];
    minute = json['minute'];
  }

}

class TaskModel {
  String? id;
  TimeModel? time;

  TaskModel({this.id, this.time});
  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'] != null ? TimeModel.fromJson(json['time']) : null;
  }
}
