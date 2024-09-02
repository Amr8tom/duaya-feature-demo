import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class CustomOrderContanier extends StatelessWidget {
  final String image;
  final String title;
  final bool isDelevied;
  final bool? isRefund;
  final String? topLeftBotton;
  final String? leftBotton;
  final String? rightBotton;
  final String? statusFiled;
  final String? productNumberFiled;
  final String? dateFiled;
  final String? costFiled;
  final String? refundReason;
  final String? deliveryStatusFiled;
  final String body;
  final Color? color;
  final double? divideNum;
  final bool isRowLeftBotton;
  final bool isTopLeftBotton;
  final VoidCallback? onTopLeftButtonTap;
  final VoidCallback? onLeftButtonTap;
  final VoidCallback? onRightButtonTap;

  CustomOrderContanier(
      {super.key,
      required this.image,
      required this.title,
      required this.body,
      required this.isDelevied,
      this.isRefund,
      this.color,
      this.divideNum,
      required this.isRowLeftBotton,
      required this.isTopLeftBotton,
      this.topLeftBotton,
      this.leftBotton,
      this.rightBotton,
      this.onTopLeftButtonTap,
      this.onLeftButtonTap,
      this.onRightButtonTap,
      this.productNumberFiled,
      this.statusFiled,
      this.dateFiled,
      this.costFiled,
      this.deliveryStatusFiled,
      this.refundReason});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Container(
          width: double.infinity,
          height: height / (divideNum ?? 4),
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
            color: color ?? ColorRes.greyGreen,
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: ColorRes.greenBlueLight,
                            borderRadius: BorderRadius.circular(10.r)),
                        padding: EdgeInsets.symmetric(
                            vertical: 25.h, horizontal: 15.w),
                        // child: Image.asset(image),
                        child: Transform.scale(
                          scale: 2.4,
                          child: Lottie.asset(AssetRes.cartAfterFilling2,
                              width: 80.w, height: 50.h),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            isRefund == true
                                ? Text("${S.current.productName}: $title",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: ColorRes.black,
                                            fontWeight: FontWeight.w700))
                                : Text(
                                    "${S.current.orderNumber}: $productNumberFiled",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: ColorRes.black,
                                            fontWeight: FontWeight.w700)),
                            Text("${S.current.status}: $statusFiled",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w700)),
                            isRefund == true
                                ? Text(
                                    "${S.current.refundReason}:$refundReason",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineLarge!
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: ColorRes.black,
                                            fontWeight: FontWeight.w700))
                                : SizedBox(),
                            Text("${S.current.history}: $dateFiled",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(
                                        fontSize: 14.sp,
                                        color: ColorRes.black,
                                        fontWeight: FontWeight.w700)),
                            Text("${S.current.cost}: $costFiled",
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
                  isRowLeftBotton
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              /// RightButton
                              rightBotton == null
                                  ? SizedBox()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorRes
                                              .greenBlueLight, // Background color
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 35.w)),
                                      onPressed: onRightButtonTap ?? () {},
                                      child: Text(rightBotton!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  fontSize: 16.sp,
                                                  color: ColorRes.greenBlue)),
                                    ),

                              /// leftButton
                              leftBotton == null
                                  ? SizedBox()
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: ColorRes
                                              .greenBlue, // Background color
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 18.w)),
                                      onPressed: onLeftButtonTap ?? () {},
                                      child: Text(leftBotton!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge!
                                              .copyWith(
                                                  fontSize: 16.sp,
                                                  color: ColorRes.white)),
                                    )
                            ])
                      : SizedBox()
                ],
              ),
              isRowLeftBotton
                  ? SizedBox()
                  : Positioned(
                      bottom: 10.h,
                      left: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ColorRes.greenBlue, // Background color
                            padding: EdgeInsets.symmetric(horizontal: 18.w)),
                        onPressed: onLeftButtonTap ?? () {},
                        child: Text(leftBotton ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 16.sp, color: ColorRes.white)),
                      )),
              isTopLeftBotton
                  ? Positioned(
                      top: 10.h,
                      left: 0,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                ColorRes.greenBlue, // Background color
                            padding: EdgeInsets.symmetric(horizontal: 18.w)),
                        onPressed: onTopLeftButtonTap ?? () {},
                        child: Text(topLeftBotton!,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                    fontSize: 16.sp, color: ColorRes.white)),
                      ))
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
