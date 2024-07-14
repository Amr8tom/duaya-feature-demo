import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({
    super.key,
    required this.image,
    this.isLottie = false,
    required this.title,
    required this.subTitle,
    required this.topHight,
    this.imgHight,
    this.imgWidth,
  });

  final String image, title, subTitle;
  bool isLottie;
  double? imgWidth, imgHight, topHight;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(
            height: topHight,
          ),
          Container(
              child: isLottie
                  ? Lottie.asset(
                      image,
                      width: imgWidth ??
                          DHelperFunctions.screenWidth(context) * 0.8,
                      height: imgHight ??
                          DHelperFunctions.screenHeight(context) * 0.5,
                    )
                  : Image.asset(
                      image,
                      width: imgWidth ??
                          DHelperFunctions.screenWidth(context) * 0.8,
                      height: imgHight ??
                          DHelperFunctions.screenHeight(context) * 0.5,
                    )),
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                  color: ColorRes.greenBlue),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Container(
            child: Text(
              subTitle,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: ColorRes.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Spacer(),
          Spacer(),
        ],
      ),
    );
  }
}
