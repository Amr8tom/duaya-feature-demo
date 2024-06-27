import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DAppBarTheme {
  DAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: ColorRes.primary,
    surfaceTintColor: ColorRes.primary,
    iconTheme: IconThemeData(color: ColorRes.black, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ColorRes.black, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w600, color: ColorRes.black),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: ColorRes.primary,
    surfaceTintColor: ColorRes.primary,
    iconTheme: IconThemeData(color: ColorRes.white, size: AppSizes.iconMd),
    actionsIconTheme:
        IconThemeData(color: ColorRes.white, size: AppSizes.iconMd),
    titleTextStyle: TextStyle(
        fontSize: 18.sp, fontWeight: FontWeight.w600, color: ColorRes.white),
  );
}
