import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DOutlinedButtonTheme {
  DOutlinedButtonTheme._();

  /// Light Theme
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      side: const BorderSide(color: ColorRes.greenBlue),
      textStyle: TextStyle(
          fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    ),
  );

  /// Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      side: const BorderSide(color: ColorRes.greenBlue),
      textStyle: TextStyle(
          fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
    ),
  );
}
