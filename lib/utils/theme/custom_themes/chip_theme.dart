import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DChipTheme {
  DChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: Colors.black),
    selectedColor: ColorRes.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    checkmarkColor: Colors.white,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey,
    labelStyle: const TextStyle(color: Colors.white),
    selectedColor: ColorRes.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
    checkmarkColor: Colors.white,
  );
}
