import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomContainerUpgradePackage extends StatelessWidget {
  const CustomContainerUpgradePackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwTexts * 2),
      child: Card(
        child: Container(
          padding: EdgeInsets.all(AppSizes.spaceBtwItems),
          decoration: BoxDecoration(
            color: ColorRes.white,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg * 1.5),
            border: Border.all( color: ColorRes.error2),
          ),
          child: Row(
            children: [
              const Icon(Iconsax.crown1, color: ColorRes.error2),
              SizedBox(width: AppSizes.spaceBtwTexts * 1.5),
              Text(S.current.upgradePackage, style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorRes.error2)),
              const Spacer(),
              const Icon(Icons.arrow_forward, color: ColorRes.error2),
            ],
          ),
        ),
      ),
    );
  }
}
