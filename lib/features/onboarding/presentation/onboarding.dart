import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/onboarding_next_button.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:duaya_app/features/onboarding/presentation/widgets/white_background_contanier.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../home/presentation/controller/best_seller_cubit.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // final besSellerController = context.read<BestSellerCubit>();
    final cubit = context.read<OnBoardingCubit>();
    // try {
    //   besSellerController.fetchBestSellerData();
    // } catch (e) {}
    return Scaffold(
      body: Stack(
        children: [
          /// White backGround
          whiteBachGround(),

          /// Horizontal Scrollable Page
          PageView(
            controller: cubit.pageController,
            onPageChanged: cubit.updatePageIndicator,
            children: [
              OnBoardingPage(
                topHight: 65.h,
                image: AssetRes.onBoardingImagePng1,
                title: S.current.onboardingTitle1,
                subTitle: S.current.onboardingBody1,
              ),
              OnBoardingPage(
                topHight: 65.h,
                image: AssetRes.onBoardingImagePng2,
                title: S.current.onboardingTitle3,
                subTitle: S.current.onboardingBody3,
              ),
              OnBoardingPage(
                topHight: 65.h,
                image: AssetRes.onBoardingImagePng3,
                title: S.current.onboardingTitle2,
                subTitle: S.current.onboardingBody2,
              ),
            ],
          ),

          /// Circular Button and Dot Navigation SmoothPageIndicator
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
