import 'package:duaya_app/common/widgets/cached_image/cached_image.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../cart/presentation/widgets/add_miuns_cart_button.dart';

class MedicalServiceCard extends StatelessWidget {
  MedicalServiceCard(
      {Key? key,
      required this.productImage,
      required this.strockedPrice,
      this.discount,
      required this.id,
      required this.description,
      required this.price})
      : super(key: key);
  String productImage, description, price, strockedPrice;
  String? discount;
  int id;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Card(
      elevation: 5,
      child: Container(
        // margin: EdgeInsets.symmetric(horizontal: 5.w),
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.spaceBtwTexts * 2,
            horizontal: AppSizes.spaceBtwTexts),
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
                  padding:
                      EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwTexts),
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppSizes.borderRadiusLg),
                      color: ColorRes.black),
                  child: Center(
                      child: Text(
                    discount ?? "0",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: ColorRes.white),
                  )),
                ),
                const Spacer(),
                const Icon(Icons.discount)
              ],
            ),
            SizedBox(height: AppSizes.spaceBtwTexts),
            CachedImage(
              link: productImage,
              height: 120.sp,
            ),
            Text(description, style: Theme.of(context).textTheme.titleSmall),
            SizedBox(height: AppSizes.spaceBtwTexts),
            Text(strockedPrice ?? "0.00",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(decoration: TextDecoration.lineThrough)),
            Text(price ?? "0.00",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorRes.error2)),
            AddMinusCartButton(
              height: AppSizes.appBarHeight,
              width: double.infinity,
              color: ColorRes.lightGreen,
              borderColor: Colors.transparent,
              textButtonColor: Colors.white,
              ID: id.toString(),
            )
          ],
        ),
      ),
    );
  }
}
