import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../../utils/constants/image_strings.dart';

class CustomContainerMenu extends StatelessWidget {
  final IconData iconData;
  final String text;
  CustomContainerMenu({Key? key, required this.text, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace / 2),
      // elevation: 3,
      decoration: BoxDecoration(
          color: ColorRes.black,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          border: Border.all(color: ColorRes.lightGreen)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.spaceBtwTexts),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25.r,
                backgroundColor: ColorRes.white,
                child: Icon(iconData, size: 23.sp, color: ColorRes.lightGreen),
              ),
              SizedBox(height: AppSizes.spaceBtwTexts * 1.2),
              Text(text,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      overflow: TextOverflow.ellipsis, color: ColorRes.white)),
            ],
          ),
        ),
      ),
    );
  }
}
