import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DAppBarTheme {
  DAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: true,
    scrolledUnderElevation: 0,
    backgroundColor: ColorRes.greenBlueLight,
    surfaceTintColor: ColorRes.greenBlueLight,
    shadowColor: ColorRes.greenBlueLight,
    iconTheme: IconThemeData(color: ColorRes.greenBlue, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ColorRes.black, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w700,
        color: ColorRes.greenBlue),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: ColorRes.primary,
    surfaceTintColor: ColorRes.primary,
    shadowColor: ColorRes.primary,
    iconTheme: IconThemeData(color: ColorRes.white, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ColorRes.white, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 32.sp, fontWeight: FontWeight.w700, color: ColorRes.white),
  );
}
