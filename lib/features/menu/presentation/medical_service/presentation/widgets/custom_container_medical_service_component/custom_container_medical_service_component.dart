import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../common/widgets/custom_button/custom_button_with_icon.dart';

class CustomContainerMedicalServiceComponent extends StatelessWidget {
  CustomContainerMedicalServiceComponent({Key? key, required this.productImage, required this.description}) : super(key: key);
  String productImage,description;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(vertical: AppSizes.spaceBtwTexts * 2, horizontal: AppSizes.spaceBtwTexts),
        decoration: BoxDecoration(
          color: ColorRes.white,
          borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwTexts),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg),
                      color: ColorRes.error2
                  ),
                  child: Center(child: Text("-15%",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: ColorRes.white),)),
                ),
                const Spacer(),
                const Icon(Icons.favorite_border)
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwTexts),
            Image.asset(productImage),
            Text(description, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: AppSizes.spaceBtwTexts),
            Text("\$355.00", style: Theme.of(context).textTheme.titleSmall!.copyWith(decoration: TextDecoration.lineThrough)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$235.00", style: Theme.of(context).textTheme.titleLarge!.copyWith(color: ColorRes.error2)),
                CircleAvatar(
                  radius: 20.r,
                  backgroundColor: ColorRes.primary,
                  child: Icon(Icons.arrow_forward, color: ColorRes.white, size: 21.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
