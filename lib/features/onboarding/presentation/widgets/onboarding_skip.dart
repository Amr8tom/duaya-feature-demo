import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return Positioned(
      top: DDeviceUtils.getAppBarHeight(),
      right: AppSizes.defaultSpace,
      child: TextButton(
        onPressed: () => cubit.skipPage(),
        child: Text(
          S.current.skip,
          style: TextStyle(fontSize: 20, color: ColorRes.appBarColor),
        ),
      ),
    );
  }
}
