import 'package:duaya_app/common/text_record_function.dart';
import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_state.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../generated/l10n.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState(0));
  final PageController pageController = PageController();

  // Functions
  void updatePageIndicator(int index) {
    emit(OnBoardingState(index));
  }

  void dotNavigationClick(int index) {
    emit(OnBoardingState(index));
    pageController.jumpTo(index.toDouble());
  }

  void nextPage({required BuildContext context}) {
    final currentState = state;
    if (currentState.currentPageIndex == 2) {
      context.pushNamed(DRoutesName.loginRoute);
      // context.pushNamed(ORoutesName.loginRoute);
    } else if (currentState.currentPageIndex == 1) {
      speak(statements: S.current.onbordingMsg, locale: S.current.localeee);
      final nextPage = currentState.currentPageIndex + 1;
      pageController.jumpToPage(nextPage);
      emit(OnBoardingState(nextPage));
    } else {
      final nextPage = currentState.currentPageIndex + 1;
      pageController.jumpToPage(nextPage);
      emit(OnBoardingState(nextPage));
    }
  }

  void skipPage({required BuildContext context}) {
    context.pushNamed(DRoutesName.loginRoute);
    emit(OnBoardingState(2));
  }
}
