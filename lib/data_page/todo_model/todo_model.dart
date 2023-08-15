import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  int? id;
  String? title;
  String? todo;
  String? date;
  String? startTime;
  String? endTime;
  int? inProgress;
  int? isCompleted;
  int? reminder;
  String? repeat;
  String? picturePath;
  String? audioPath;

  Todo({
    this.id,
    this.title,
    this.todo,
    this.date,
    this.startTime,
    this.endTime,
    this.inProgress,
    this.isCompleted,
    this.reminder,
    this.repeat,
    this.picturePath,
    this.audioPath,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    title: json["title"],
    todo: json["todo"],
    date: json["date"],
    startTime: json["startTime"],
    endTime: json["endTime"],
    inProgress: json["inProgress"],
    isCompleted: json["isCompleted"],
    reminder: json["reminder"],
    repeat: json["repeat"],
    picturePath: json["picturePath"],
    audioPath: json["audioPath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "todo": todo,
    "date": date,
    "startTime": startTime,
    "endTime": endTime,
    "inProgress": inProgress,
    "isCompleted": isCompleted,
    "reminder": reminder,
    "repeat": repeat,
    "picturePath": picturePath,
    "audioPath": audioPath,
  };
}