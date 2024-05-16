import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/onboarding_dot_navigation.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/onboarding_skip.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        final cubit = context.read<OnBoardingCubit>();

        return Scaffold(
          body: Stack(
            children: [
              /// Horizontal Scrollable Page
              PageView(
                controller: cubit.pageController,
                onPageChanged: cubit.updatePageIndicator,
                children: [
                  OnBoardingPage(
                    image: AssetRes.onBoardingImage1,
                    title: S.current.onboardingTitle1,
                    subTitle: S.current.onboardingBody1,
                  ),
                  OnBoardingPage(
                    image: AssetRes.onBoardingImage2,
                    title: S.current.onboardingTitle2,
                    subTitle: S.current.onboardingBody2,
                  ),
                  OnBoardingPage(
                    image: AssetRes.onBoardingImage3,
                    title: S.current.onboardingTitle3,
                    subTitle: S.current.onboardingBody3,
                  ),
                ],
              ),

              /// Skip Button

              /// Dot Navigation SmoothPageIndicator
              Column(
                children: [
                  SizedBox(
                    height: AppSizes.xxl,
                  ),
                  OnBoardingSkip(),
                  Spacer(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const OnBoardingDotNavigation(),

                      /// Circular Button
                      const OnBoardingNextButton(),
                    ],
                  ),
                  SizedBox(
                    height: 40.h,
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
