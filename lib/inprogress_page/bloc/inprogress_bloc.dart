import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'inprogress_event.dart';
part 'inprogress_state.dart';

class InprogressBloc extends Bloc<InprogressEvent, InprogressState> {
  InprogressBloc() : super(InprogressInitial()) {
    on<InprogressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
