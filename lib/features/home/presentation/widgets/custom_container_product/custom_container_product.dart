import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/l10n.dart';

class CustomContainerProduct extends StatelessWidget {
  final String productImage, productName, companyName, price;
  String strockedPrice, discount;
  final double rete;
  bool hasDicount;

  CustomContainerProduct({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.companyName,
    required this.price,
    this.strockedPrice = "",
    required this.rete,
    required this.hasDicount,
    this.discount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future:
            checkImageNetwork.checkImageStatus(NetworkImageURL: productImage),
        builder: (context, snapshot) {
          Widget imageWidget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            imageWidget = Center(
              child: Lottie.asset(AssetRes.circleLoading),
            );
          } else if (snapshot.hasError || !snapshot.data!) {
            // Image loading failed, display fallback asset image
            imageWidget = Lottie.asset(AssetRes.emptyProduct2);
          } else {
            // Image loaded successfully, display network image
            imageWidget = Image.network(
              productImage,
              height: AppSizes.productImageSize,
            );
          }

          return Card(
            elevation: 5,
            child: productName == null
                ? Center(
                    child: Lottie.asset(AssetRes.normalLoading),
                  )
                : Container(
                    padding: EdgeInsets.symmetric(
                        vertical: AppSizes.spaceBtwTexts * 2,
                        horizontal: AppSizes.spaceBtwTexts),
                    decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadiusLg)),
                    child: Column(
                      children: [
                        /// Presetage - Heart.
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: AppSizes.spaceBtwTexts),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      AppSizes.borderRadiusLg),
                                  color: ColorRes.black),
                              child: hasDicount
                                  ? Center(
                                      child: Text(discount!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: ColorRes.white,
                                                  fontSize: 14.sp)))
                                  : null,
                            ),
                            const Spacer(),
                            Icon(Iconsax.heart, size: 23.sp)
                          ],
                        ),
                        SizedBox(height: AppSizes.spaceBtwTexts),

                        /// Product Image.
                        imageWidget,

                        /// Product Name.
                        Text(productName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(overflow: TextOverflow.ellipsis)),
                        SizedBox(height: AppSizes.spaceBtwTexts),

                        /// Company Name
                        Text(companyName,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: ColorRes.grey2, fontSize: 12.sp)),
                        SizedBox(height: AppSizes.spaceBtwTexts),

                        /// Ratting.
                        SizedBox(height: AppSizes.spaceBtwTexts * 2),

                        Spacer(),

                        /// Price
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            hasDicount
                                ? Text(strockedPrice,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 15.sp))
                                : SizedBox(),
                            Text(price,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: ColorRes.error2,
                                        fontSize: 15.sp))
                          ],
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems / 1.2),

                        /// Add to cart.
                        CustomButtonWithIcon(
                          onTap: () {},
                          textButton: S.current.addToCart,
                          widget: const Icon(Iconsax.shopping_cart,
                              color: ColorRes.white),
                          width: double.infinity,
                          // height: AppSizes.imageSize * 1.1,
                          color: ColorRes.primary,
                          borderColor: Colors.transparent,
                          textButtonColor: Colors.white,
                          isAddToCart: true,
                        ),

                        // SizedBox(height: AppSizes.spaceBtwItems / 1.2),
                      ],
                    ),
                  ),
          );
        });
  }
}
