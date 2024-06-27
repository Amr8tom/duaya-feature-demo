import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/features/home/presentation/controller/best_seller_cubit.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../../../../../common/widgets/cached_image/cached_image.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../cart/presentation/widgets/add_miuns_cart_button.dart';

class CustomContainerProduct extends StatelessWidget {
  final String productImage, productName, companyName, price, productID;
  String strockedPrice, discount;
  final double rete;
  bool hasDicount;
  bool removeDiscount;
  double? hight;
  bool isCart;

  CustomContainerProduct({
    Key? key,
    required this.productImage,
    required this.productName,
    this.hight,
    required this.productID,
    required this.companyName,
    this.removeDiscount = false,
    required this.price,
    this.strockedPrice = "",
    required this.rete,
    this.isCart = true,
    required this.hasDicount,
    this.discount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg)),
              child: Column(
                children: [
                  /// Presetage - Heart.
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.spaceBtwTexts),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(AppSizes.borderRadiusLg),
                            color: ColorRes.black),
                        child: hasDicount
                            ? Center(
                                child: Text(
                                    "${removeDiscount ? "" : S.current.discont} ${discount!}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: ColorRes.white,
                                            fontSize: 14.sp)))
                            : null,
                      ),
                      const Spacer(),
                      Icon(Iconsax.tag1, size: 23.sp)
                    ],
                  ),
                  SizedBox(height: AppSizes.spaceBtwTexts),

                  /// Product Image.
                  CachedImage(
                    height: hight ?? AppSizes.productImageSize - 33.sp,
                    link: productImage,
                  ),

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
                          .copyWith(color: ColorRes.grey2, fontSize: 12.sp)),
                  SizedBox(height: AppSizes.spaceBtwTexts),

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
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: 15.sp))
                          : SizedBox(),
                      Text(price,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: ColorRes.error2, fontSize: 15.sp))
                    ],
                  ),
                  Spacer(),

                  /// Add to cart.
                  isCart
                      ? AddMinusCartButton(
                          height: AppSizes.appBarHeight,
                          width: double.infinity,
                          color: ColorRes.lightGreen,
                          borderColor: Colors.transparent,
                          textButtonColor: Colors.white,
                          ID: productID,
                        )
                      : SizedBox(),
                ],
              ),
            ),
    );
  }
}
