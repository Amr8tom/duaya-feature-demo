import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../common/common_snak_bar_widget.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';

class CustomFawryBodyContainer extends StatelessWidget {
  final String fawryCode;
  const CustomFawryBodyContainer({super.key, required this.fawryCode});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            color: ColorRes.lightGreen.withOpacity(0.3),
            child: Lottie.asset(
              AssetRes.fawry,
            )),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 150.h,
            width: 300.w,
            decoration: BoxDecoration(
              color: ColorRes.greenBlueLight,
              borderRadius: BorderRadius.circular(15.sp),
              border: Border.all(width: 1.sp, color: ColorRes.greenBlue),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  S.current.fawryCode,
                  style: Theme.of(context).textTheme.headlineMedium!,
                ),
                Text(
                  fawryCode,
                  style: Theme.of(context).textTheme.headlineMedium!,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
