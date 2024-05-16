import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/exports.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/device/device_utility.dart';
import 'package:duaya_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OSearchContainer extends StatelessWidget {
  const OSearchContainer({
    super.key, required this.text,
    this.icon,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.height = 200,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final dark = DHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: DDeviceUtils.getScreenWidth(context),
        height: height,
        padding: EdgeInsets.all(AppSizes.md),
        decoration: BoxDecoration(
          color: showBackground ? dark ? ColorRes.dark : ColorRes.light : Colors.transparent,
          borderRadius: BorderRadius.circular(AppSizes.cardRadiusLg),
          border: showBorder ? Border.all(color: dark ? ColorRes.dark : ColorRes.grey) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: dark ? ColorRes.lightGrey : ColorRes.darkGrey),
            SizedBox(width: AppSizes.spaceBtwItems),
            Text(text, style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}