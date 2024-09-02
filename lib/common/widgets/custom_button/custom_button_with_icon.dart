import 'package:duaya_app/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/constants/sizes.dart';

class CustomButtonWithIcon2 extends StatelessWidget {
  final VoidCallback onTap;
  final String textButton;
  double? width = 300.w;
  double? height = AppSizes.imageSize / 1.6;
  final Widget? widget;
  final Color? color;
  final Color borderColor, textButtonColor;
  final bool isAddToCart;

  CustomButtonWithIcon2(
      {Key? key,
      required this.onTap,
      required this.textButton,
      this.widget,
      this.width,
      this.height,
      this.color,
      required this.borderColor,
      required this.textButtonColor,
      required this.isAddToCart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          // padding: EdgeInsets.all(isAddToCart ? 0 : 20.sp),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg * 2),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textButton,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: textButtonColor,
                          height: .5.h,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                          overflow: TextOverflow
                              .ellipsis, // Handle overflow with ellipsis
                        )),
                // SizedBox(width: AppSizes.spaceBtwTexts),
                // SizedBox(child: widget)
              ],
            ),
          )),
    );
  }
}
