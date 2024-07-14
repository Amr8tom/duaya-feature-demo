import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomComponentLanguage extends StatelessWidget {
  CustomComponentLanguage(
      {Key? key,
      required this.borderColor,
      required this.language,
      required this.onTap})
      : super(key: key);
  Color borderColor;
  String language;
  VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // width: width / 1.5,
        margin: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwItems / 2),
        padding: EdgeInsets.symmetric(
            horizontal: AppSizes.spaceBtwItems * 2.5,
            vertical: AppSizes.spaceBtwItems / 1.5),
        decoration: BoxDecoration(
          color: ColorRes.greenBlueLight,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Text(language,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: ColorRes.greenBlue,
                fontWeight: FontWeight.w700,
                fontSize: 20.sp)),
      ),
    );
  }
}
