import 'dart:async';
import 'package:bloc/bloc.dart';
part 'bottom_nav_event.dart';
part 'bottom_nav_state.dart';

class BottomNavBloc extends Bloc<BottomNavEvent, BottomNavState> {
  BottomNavBloc() : super(BottomNavState()) {
    on<OnNavEventButtonClick>(onNavEventButtonClick);
  }

  FutureOr<void> onNavEventButtonClick(OnNavEventButtonClick event, Emitter<BottomNavState> emit) {
    emit(BottomNavState(pageIndex: state.pageIndex));
  }
}
