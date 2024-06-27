import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();
    final dark = DHelperFunctions.isDarkMode(context);

    return Positioned(
      right: ScreenUtil.defaultSize.width / 3,
      left: ScreenUtil.defaultSize.width / 3,
      bottom: DDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: dark ? ColorRes.medGreen : ColorRes.lightGreen,
          fixedSize: Size(60.w, 62.h),
        ),
        onPressed: () => cubit.nextPage(context: context),
        child: Icon(
          Icons.arrow_forward,
          size: 24.sp,
          color: Colors.white,
        ),
      ),
    );
  }
}
