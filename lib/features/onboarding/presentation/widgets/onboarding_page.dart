import 'package:duaya_app/features/onboarding/managers/onboarding_cubit/onboarding_cubit.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const   OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.defaultSpace),
      child: Column(
        children: [
          SizedBox(height: AppSizes.spaceBtwSections * 2.4),
          // Image.asset(
          //   image,
          //   width: DHelperFunctions.screenWidth(context) * 0.8,
          //   height: DHelperFunctions.screenHeight(context) * 0.5,
          // ),
          // Image(
          //   width: DHelperFunctions.screenWidth(context) * 0.8,
          //   height: DHelperFunctions.screenHeight(context) * 0.5,
          //   image: AssetImage(image),
          // ),
          Lottie.asset(
            image, // Replace 'example.json' with your Lottie animation file
              width: DHelperFunctions.screenWidth(context) * 0.8,
              height: DHelperFunctions.screenHeight(context) * 0.5,
            // Other properties like repeat, reverse, etc., can be set here
          ),
          // Image(
          //   width: OHelperFunctions.screenWidth(context) * 0.8,
          //   height: OHelperFunctions.screenHeight(context) * 0.6,
          //   image: AssetImage(image),
          // ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSizes.spaceBtwItems),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
