import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    final dark = DHelperFunctions.isDarkMode(context);

    return Positioned(
      bottom: DDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: AppSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: cubit.pageController,
        onDotClicked: cubit.dotNavigationClick,
        count: 3,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? ColorRes.primary : ColorRes.primary,
          dotHeight: 6,
        ),
      ),
    );
  }
}