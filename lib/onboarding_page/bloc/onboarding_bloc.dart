import 'package:bloc/bloc.dart';
part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  OnboardingBloc() : super(OnboardingState()) {

    on<OnOnboardingEvent>((event, emit) {
      emit(OnboardingState(pageIndex: event.pageIndex));
    });
  }
}
