// import 'package:task_management/data_page/db_helper_page/db_helper.dart';
// import '../data_page/note_model/note_model.dart';
//
// class NoteRepository {
//
//   Future<dynamic> addNote(
//       String title,
//       String description,
//       String? date,
//       String? startTime,
//       String? endTime,
//       int? inProgress,
//       int? isCompleted,
//       int? reminder,
//       String? repeat,
//       String? picturePath,
//       String? audioPath
//       ) async {
//     final data = await DBHelper.createNoteItem(
//       title,
//       description,
//       date,
//       startTime,
//       endTime,
//       inProgress,
//       isCompleted,
//       reminder,
//       repeat,
//     );
//     return data;
//
//   }
//
//   Future<List<Note>> getAllNotes() async {
//     final data = await DBHelper.getNotes();
//     final allNotes = data.map((e) => Note.fromJson(e)).toList();
//     return allNotes;
//   }
//   Future<List<Note>> refreshNotes() async {
//     final data = await DBHelper.getNotes();
//     final allNotes = data.map((e) => Note.fromJson(e)).toList();
//     return allNotes;
//   }
//
//   Future<dynamic> getNote(int id) async {
//     final data = await DBHelper.getNote(id);
//     final note = data.map((e) => Note.fromJson(e)).elementAt(id);
//     return note;
//   }
//
//   Future<void> deleteNote(int id) async {
//     await DBHelper.deleteNote(id);
//     getAllNotes();
//   }
//
//   Future<void> updateNotes(int id,String title,String description,String date,String startTime,String endTime,int? inProgress,
//       int? isCompleted,int? reminder,String? repeat,String? picturePath,String? audioPath,) async {
//     await DBHelper.updateNote(id, title, description, date, startTime, endTime, inProgress, isCompleted, reminder, repeat, picturePath, audioPath);
//     refreshNotes();
//   }
//
//   Future<void> markNoteAsCompleted(int id,String title,String description,String date,String startTime,String endTime,int? inProgress,
//       int? isCompleted,int? reminder,String? repeat,String? picturePath,String? audioPath,) async {
//     await DBHelper.updateNote(id,title,description,date, startTime, endTime, 1, isCompleted, reminder, repeat, picturePath, audioPath);
//     refreshNotes();
//   }
//
//   Future<void> addNoteToInProgress(int id,String title,String description,String date,String startTime,String endTime,int? inProgress,
//       int? isCompleted,int? reminder,String? repeat,String? picturePath,String? audioPath,) async {
//     await DBHelper.updateNote(id,title,description, date, startTime, endTime, inProgress, 0, reminder, repeat, picturePath, audioPath);
//     refreshNotes();
//   }
//
//   bool getCompletedStatus(Note data) {
//     bool? isCompleted;
//     if(data.isCompleted == 0) {
//       isCompleted = false;
//     } else {
//       isCompleted = true;
//     }
//     return isCompleted;
//   }
//
//   bool getInProgressStatus(Note data) {
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
// // Future<List<Note>> searchNoteByKeyWord(String keyword) async {
// //   final data = await DBHelper.getTodos();
// //   return data.where((element) =>)
// // }
// }