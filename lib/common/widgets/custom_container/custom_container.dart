import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final String titleContainer1, titleContainer2, number1, number2;
  const CustomContainer(
      {Key? key,
      required this.titleContainer1,
      required this.titleContainer2,
      required this.number1,
      required this.number2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: 20.w, vertical: AppSizes.spaceBtwItems * 1.5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        color: ColorRes.lightGreen.withOpacity(0.4),
        boxShadow: [
          BoxShadow(
            color: ColorRes.black.withOpacity(.3),
            blurRadius: 2,
            spreadRadius: 1,
            offset: Offset(1.w, 1.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(titleContainer1,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20.sp, color: ColorRes.white)),
              SizedBox(height: AppSizes.spaceBtwItems * 1.2),
              Text(number1,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20.sp, color: ColorRes.white)),
            ],
          ),
          Spacer(),
          Column(
            children: [
              Text(titleContainer2,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20.sp, color: ColorRes.white)),
              SizedBox(height: AppSizes.spaceBtwItems * 1.2),
              Text(number2,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontSize: 20.sp, color: ColorRes.white)),
            ],
          ),
        ],
      ),
    );
  }
}
