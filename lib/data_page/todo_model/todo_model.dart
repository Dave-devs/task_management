class Todo{
  int? id;
  List<String>? todo;
  bool inProgress;
  bool isDone;
  DateTime? date;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? reminder;

  Todo({
    this.id,
    this.todo,
    this.inProgress = false,
    this.isDone = false,
    this.date,
    this.startTime,
    this.endTime,
    this.reminder,
  });

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        id: map["id"],
        todo: map["todo"],
        inProgress: map["inProgress"] == 1,
        isDone: map["isDone"] == 1,
        date: map["date"] != null ? DateTime.fromMillisecondsSinceEpoch(map["date"]) : null,
        startTime: map["startTime"] != null ? DateTime.fromMillisecondsSinceEpoch(map["startTime"]) : null,
        endTime: map["endTime"] != null ? DateTime.fromMillisecondsSinceEpoch(map["endTime"]) : null,
        reminder: map["reminder"] != null ? DateTime.fromMillisecondsSinceEpoch(map["reminder"]) : null
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "todo": todo,
      "inProgress": inProgress? 1 : 0,
      "isDone": isDone? 1 : 0,
      "date": date?.millisecondsSinceEpoch,
      "startTime": startTime?.millisecondsSinceEpoch,
      "endTime": endTime?.millisecondsSinceEpoch,
      "reminder": reminder?.millisecondsSinceEpoch,
    };
  }
}

//Todos
// {
// "id": 0,
// "content": {
//   "A",
//   "B"
// },
// "inProgress": "",
// "isCompleted": 0,
// "date": ""
// "startTime": ""
// "endTime": ""
// "reminder": 0,
// "repeat": "",
// }