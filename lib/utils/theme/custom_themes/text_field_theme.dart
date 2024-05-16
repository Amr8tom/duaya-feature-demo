import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DTextFormFieldTheme {
  DTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14.sp, color: Colors.black),
    hintStyle: const TextStyle().copyWith(fontSize: 14.sp, color: Colors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.black12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 2.w, color: Colors.orange),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: Colors.grey,
    suffixIconColor: Colors.grey,
    labelStyle: const TextStyle().copyWith(fontSize: 14.sp, color: Colors.white),
    hintStyle: const TextStyle().copyWith(fontSize: 14.sp, color: Colors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: Colors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 1.w, color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14.r),
      borderSide: BorderSide(width: 2.w, color: Colors.orange),
    ),
  );
}