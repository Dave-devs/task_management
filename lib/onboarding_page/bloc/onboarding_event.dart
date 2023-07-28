part of 'onboarding_bloc.dart';

abstract class OnboardingEvent {
  const OnboardingEvent();
}

class OnOnboardingEvent extends OnboardingEvent{
  final int pageIndex;

  const OnOnboardingEvent(this.pageIndex) : super();
}
