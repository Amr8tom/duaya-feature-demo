import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizer extends StatelessWidget {
  final double? height;
  final double? width;

  const Sizer({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10.sp,
      width: width ?? 10.sp,
    );
  }
}
