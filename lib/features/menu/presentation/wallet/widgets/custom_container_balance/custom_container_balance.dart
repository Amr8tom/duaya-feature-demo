import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerBalance extends StatelessWidget {
  const CustomContainerBalance({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: height/4,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        color: ColorRes.primary.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: ColorRes.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(1.w, 1.h),
          ),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AssetRes.appLogo,width: AppSizes.padding * 7),
              Text(S.current.appName, style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 16.sp, color: ColorRes.white)),
            ],
          ),
          SizedBox(height: AppSizes.spaceBtwItems * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(S.current.reCharge, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16.sp, color: ColorRes.white)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(S.current.yourBalance, style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16.sp, color: ColorRes.white)),
                  SizedBox(height: AppSizes.spaceBtwTexts),
                  Text('237.00', style: Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 16.sp, color: ColorRes.white)),
                ],
              ),
            ],
          ),


          // /// Make Space
          // SizedBox(height: AppSizes.defaultSpace / 2),


        ],
      ),
    );
  }
}
