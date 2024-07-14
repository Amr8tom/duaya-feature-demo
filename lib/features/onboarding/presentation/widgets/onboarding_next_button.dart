import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    final dark = DHelperFunctions.isDarkMode(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
              backgroundColor: ColorRes.greenBlueLight,
              fixedSize: Size(55.w, 55.h),
            ),
            onPressed: () => cubit.nextPage(context: context),
            child: Icon(
              Icons.arrow_forward_ios_sharp,
              size: 24.sp,
              color: ColorRes.greenBlue,
            ),
          ),
          SizedBox(height: 30.h),
          SmoothPageIndicator(
            controller: cubit.pageController,
            onDotClicked: cubit.dotNavigationClick,
            count: 3,
            effect: ExpandingDotsEffect(
                expansionFactor: 1.1,
                dotColor: ColorRes.greenBlueLight,
                activeDotColor: ColorRes.greenBlue,
                dotHeight: 7.sp,
                dotWidth: 6.sp),
          ),
          SizedBox(height: 15.h),
        ],
      ),
    );
  }
}
