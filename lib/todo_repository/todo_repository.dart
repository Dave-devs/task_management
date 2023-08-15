// import 'package:task_management/data_page/db_helper_page/db_helper.dart';
// import 'package:task_management/data_page/todo_model/todo_model.dart';
//
// class TodoRepository{
//
//   Future<dynamic> addTodo(
//       String? title,
//       String? todo,
//       String? date,
//       String? startTime,
//       String? endTime,
//       int? inProgress,
//       int? isCompleted,
//       int? reminder,
//       String? repeat,
//       String? picturePath,
//       String? audioPath,
//       ) async {
//     final data = await DBHelper.createTodoItem(
//         title,
//         todo,
//         date,
//         startTime,
//         endTime,
//         inProgress,
//         isCompleted,
//         reminder,
//         repeat,
//         picturePath,
//         audioPath
//     );
//     return data;
//
//   }
//
//   Future<List<Todo>> getAllTodos() async {
//     final data = await DBHelper.getTodos();
//     final allTodos = data.map((e) => Todo.fromJson(e)).toList();
//     return allTodos;
//   }
//   Future<List<Todo>> refreshTodos() async {
//     final data = await DBHelper.getTodos();
//     final allTodos = data.map((e) => Todo.fromJson(e)).toList();
//     return allTodos;
//   }
//
//   Future<dynamic> getTodo(int id) async {
//     final data = await DBHelper.getTodo(id);
//     final todo = data.map((e) => Todo.fromJson(e)).elementAt(id);
//     return todo;
//   }
//
//   Future<void> deleteTodo(int id) async {
//     await DBHelper.deleteTodo(id);
//     getAllTodos();
//   }
//
//   Future<void> updateTodos(int id,String title,String todo,String date,String startTime,String endTime,int? inProgress,
//       int? isCompleted,int? reminder,String? repeat,String? picturePath,String? audioPath,) async {
//     await DBHelper.updateTodo(id, title, todo, date, startTime, endTime, inProgress, isCompleted, reminder, repeat, picturePath, audioPath);
//     refreshTodos();
//   }
//
//   Future<void> markTodoAsCompleted(int id,String title,String todo,String date,String startTime,String endTime,int? inProgress,
//       int? isCompleted,int? reminder,String? repeat,String? picturePath,String? audioPath,) async {
//     await DBHelper.updateTodo(id, title, todo, date, startTime, endTime, 1, isCompleted, reminder, repeat, picturePath, audioPath);
//     refreshTodos();
//   }
//
//   Future<void> addTodoToInProgress(int id, String title,String todo,String date,String startTime,String endTime,int? inProgress,
//       int? isCompleted,int? reminder,String? repeat,String? picturePath,String? audioPath,) async {
//     await DBHelper.updateTodo(id, title, todo, date, startTime, endTime, inProgress, 0, reminder, repeat, picturePath, audioPath);
//     refreshTodos();
//   }
//
//   bool getCompletedStatus(Todo data) {
//     bool? isCompleted;
//     if(data.isCompleted == 0) {
//       isCompleted = false;
//     } else {
//       isCompleted = true;
//     }
//     return isCompleted;
//   }
//
//   bool getInProgressStatus(Todo data) {
//     bool? inProgress;
//     if(data.inProgress == 0) {
//       inProgress = false;
//     } else {
//       inProgress = true;
//     }
//     return inProgress;
//   }
//
//   String getDate() {
//     DateTime date = DateTime.now();
//     return date.toString().substring(0, 10);
//   }
//
//
//   // Future<List<Todo>> searchTodoByKeyWord(String keyword) async {
//   //   final data = await DBHelper.getTodos();
//   //   return data.where((element) =>)
//   // }
//
//
// }