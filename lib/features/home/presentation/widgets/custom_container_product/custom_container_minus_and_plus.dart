import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainerMinusAndPlus extends StatelessWidget {
  final Widget widget;
  final double height;
  final VoidCallback onTap;
  final double borderWidth;

  CustomContainerMinusAndPlus(
      {Key? key,
      required this.widget,
      required this.onTap,
      required this.height,
      required this.borderWidth})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 50.sp,
            child: Center(
              child: widget,
            ),
          ),
        ],
      ),
    );
  }
}
