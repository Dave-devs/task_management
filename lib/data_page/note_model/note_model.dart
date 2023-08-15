// To parse this JSON data, do
//
//     final note = noteFromJson(jsonString);

import 'dart:convert';

Note noteFromJson(String str) => Note.fromJson(json.decode(str));

String noteToJson(Note data) => json.encode(data.toJson());

class Note {
  int? id;
  String? title;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  int? inProgress;
  int? isCompleted;
  int? reminder;
  String? repeat;
  String? picturePath;
  String? audioPath;

  Note({
    this.id,
    this.title,
    this.description,
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

  factory Note.fromJson(Map<String, dynamic> json) => Note(
    id: json["id"],
    title: json["title"],
    description: json["description"],
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
    "description": description,
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


// Note
// {
//   "id": 0,
//   "title": "",
//   "description": "",
//   "date": ""
//   "startTime": ""
//   "endTime": ""
//   "inProgress": 0,
//   "isCompleted": 0,
//   "reminder": 0,
//   "repeat": "",
//   "picturePath": "",
//   "audioPath": ""
// }