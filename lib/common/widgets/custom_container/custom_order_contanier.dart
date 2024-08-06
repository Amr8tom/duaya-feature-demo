import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CustomOrderContanier extends StatelessWidget {
  final String image;
  final String title;
  final bool isDelevied;
  final String? leftBotton;
  final String? rightBotton;
  final String body;
  final Color? color;
  final VoidCallback? onLeftButtonTap;
  final VoidCallback? onRightButtonTap;

  CustomOrderContanier(
      {super.key,
      required this.image,
      required this.title,
      required this.body,
      required this.isDelevied,
      this.color,
      this.leftBotton,
      this.rightBotton,
      this.onLeftButtonTap,
      this.onRightButtonTap});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Card(
      child: Container(
        width: double.infinity,
        height: height / 4,
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
          color: color ?? ColorRes.greyGreen,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: ColorRes.greenBlueLight,
                      borderRadius: BorderRadius.circular(10.r)),
                  padding:
                      EdgeInsets.symmetric(vertical: 25.sp, horizontal: 20.sp),
                  child: Image.asset(image),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${S.current.orderNumber}:",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w700)),
                      Text("${S.current.company}:",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w700)),
                      Text("${S.current.history}:",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w700)),
                      Text("${S.current.cost}:",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: ColorRes.black,
                                  fontWeight: FontWeight.w700)),
                      Text(
                          isDelevied
                              ? "${S.current.Delivered}"
                              : "${S.current.underDelivery}",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 14.sp,
                                  color: ColorRes.greenBlue,
                                  fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              /// RightButton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor:
                        ColorRes.greenBlueLight, // Background color
                    padding: EdgeInsets.symmetric(horizontal: 35.w)),
                onPressed: onRightButtonTap ?? () {},
                child: Text(rightBotton ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16.sp, color: ColorRes.greenBlue)),
              ),

              /// leftButton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: ColorRes.greenBlue, // Background color
                    padding: EdgeInsets.symmetric(horizontal: 18.w)),
                onPressed: onLeftButtonTap ?? () {},
                child: Text(leftBotton ?? "",
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(fontSize: 16.sp, color: ColorRes.white)),
              )
            ])
          ],
        ),
      ),
    );
  }
}
