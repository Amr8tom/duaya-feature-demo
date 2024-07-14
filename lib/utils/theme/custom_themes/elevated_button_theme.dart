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
      // foregroundColor: Colors.white,
      backgroundColor: ColorRes.greenBlue,
      // disabledForegroundColor: Colors.white,
      // disabledBackgroundColor: Colors.white,
      side: BorderSide(color: ColorRes.white.withOpacity(0.7)),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: TextStyle(
          fontSize: 23.sp, color: Colors.red, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
    ),
  );

  /// -- Dark Theme
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      // foregroundColor: Colors.white,
      backgroundColor: ColorRes.lightGreen.withOpacity(.8),
      // disabledForegroundColor: Colors.white,
      // disabledBackgroundColor: Colors.white,
      side: const BorderSide(color: Colors.white),
      padding: EdgeInsets.symmetric(vertical: 18.h),
      textStyle: TextStyle(
          fontSize: 23.sp, color: Colors.red, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
    ),
  );
}
