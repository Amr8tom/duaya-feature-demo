import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomEmptyScreen extends StatelessWidget {
  const CustomEmptyScreen(
      {super.key,
      required this.imagePath,
      required this.titleText,
      required this.subTitleText,
      required this.buttonText,
      required this.buttonIsShowedOrNot});

  final String imagePath;
  final String titleText;
  final String subTitleText;
  final String buttonText;
  final bool buttonIsShowedOrNot;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(imagePath),
          SizedBox(height: 36.h),
          Text(titleText, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10.h),
          Text(subTitleText,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: ColorRes.grey2)),
          SizedBox(height: 40.h),
          // buttonIsShowedOrNot ? CustomButtonMajorInApp(text: buttonText) : const SizedBox(),
        ],
      ),
    );
  }
}
