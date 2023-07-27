import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'completed_event.dart';
part 'completed_state.dart';

class CompletedBloc extends Bloc<CompletedEvent, CompletedState> {
  CompletedBloc() : super(CompletedInitial()) {
    on<CompletedEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
