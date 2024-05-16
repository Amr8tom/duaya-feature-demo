import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DElevatedButtonTheme {
  DElevatedButtonTheme._();

  /// -- Light Theme
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ColorRes.primary,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: ColorRes.primary),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: TextStyle(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );

  /// -- Dark Theme
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: ColorRes.primary.withOpacity(.8),
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blueGrey),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: TextStyle(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
