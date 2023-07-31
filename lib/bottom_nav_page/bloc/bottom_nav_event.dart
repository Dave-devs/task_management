part of 'bottom_nav_bloc.dart';

class BottomNavEvent {
  const BottomNavEvent();
}

class OnNavEventButtonClick extends BottomNavEvent {
  final int index;

  const OnNavEventButtonClick(this.index) : super();
}
