class Note{
  int? id;
  String? title;
  String? content;
  bool inProgress;
  bool isDone;
  DateTime? date;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? reminder;
  String? picturePath;
  String? audioPath;

  Note({
    this.id,
    this.title,
    this.content,
    this.inProgress = false,
    this.isDone = false,
    this.date,
    this.startTime,
    this.endTime,
    this.reminder,
    this.picturePath,
    this.audioPath,
  });

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map["id"],
      title: map["title"],
      content: map["content"],
      inProgress: map["inProgress"] == 1,
      isDone: map["isDone"] == 1,
      date: map["date"] != null ? DateTime.fromMillisecondsSinceEpoch(map["date"]) : null,
      startTime: map["startTime"] != null ? DateTime.fromMillisecondsSinceEpoch(map["startTime"]) : null,
      endTime: map["endTime"] != null ? DateTime.fromMillisecondsSinceEpoch(map["endTime"]) : null,
      reminder: map["reminder"] != null ? DateTime.fromMillisecondsSinceEpoch(map["reminder"]) : null,
      picturePath: map["picturePath"],
      audioPath: map["audioPath"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "inProgress": inProgress? 1 : 0,
      "isDone": isDone? 1 : 0,
      "date": date?.millisecondsSinceEpoch,
      "startTime": startTime?.millisecondsSinceEpoch,
      "endTime": endTime?.millisecondsSinceEpoch,
      "reminder": reminder?.millisecondsSinceEpoch,
      "picturePath": picturePath,
      "audioPath": audioPath,
    };
  }
}

//Note
// {
//   "id": 0,
//   "title": "",
//   "content": "",
//   "inProgress": "",
//   "isCompleted": 0,
//   "date": ""
//   "startTime": ""
//   "endTime": ""
//   "reminder": 0,
//   "repeat": "",
//   "picturePath": "",
//   "audioPath": ""
// }