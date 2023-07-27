import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'note_list_event.dart';
part 'note_list_state.dart';

class NoteListBloc extends Bloc<NoteListEvent, NoteListState> {
  NoteListBloc() : super(NoteListInitial()) {
    on<NoteListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
