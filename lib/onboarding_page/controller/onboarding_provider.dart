import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'onboarding_provider.g.dart';

//flutter pub run build_runner watch
@riverpod
class OnboardingState extends _$OnboardingState {
  @override
  int build() {
    return 0;
  }

  void onboardingPage(int pageIndex) {
    state = pageIndex;
  }

}