import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
   CustomButton({super.key, required this.buttonText, required this.onPressed,this.width,this.height});
  final VoidCallback onPressed;
  final String buttonText;
  double? width,height;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwTexts),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: ColorRes.primary,
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg *2)),
      child: ElevatedButton(onPressed: onPressed, child: Text(buttonText),
      ),
    );
  }
}
