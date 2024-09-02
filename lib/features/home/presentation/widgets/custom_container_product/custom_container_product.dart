import 'dart:ui';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../cart/presentation/widgets/add_miuns_cart_button.dart';
import '../../../../services/customer_ads/presentation/widget/custom_contatct_whatsup_contanier.dart';
import '../../../../settings/subfeatures/favorites/presentation/widget/custom_favourite_contanier.dart';

class CustomContainerProduct extends StatelessWidget {
  final String productName, companyName, price, productID;
  final String strockedPrice, discount;
  int? phone;
  final double rete;
  VoidCallback? onFavorite;
  final bool hasDicount;
  String? productImage;
  bool removeDiscount;
  double? hight;
  bool isCart;
  bool isAds;
  Color? color;
  CustomContainerProduct({
    Key? key,
    this.productImage,
    required this.productName,
    this.hight,
    this.phone,
    this.isAds = false,
    this.color,
    this.onFavorite,
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
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwTexts),
        decoration: BoxDecoration(
            color: color ?? ColorRes.white,
            borderRadius: BorderRadius.circular(AppSizes.borderRadiusLg)),
        child: Column(
          children: [
            /// favourite compnant
            CustomFavouriteContanier(
              productID: productID,
              hight: hight,
              discount: discount,
              hasDicount: hasDicount,
              removeDiscount: removeDiscount,
              productImage: productImage,
              onFavorite: onFavorite,
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
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 15.sp))
                    : SizedBox(),
                Text(price,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: ColorRes.error2, fontSize: 15.sp))
              ],
            ),
            const Spacer(),

            /// Add to cart.
            isCart
                ? AddMinusCartButton(
                    height: AppSizes.appBarHeight,
                    width: double.infinity,
                    color: ColorRes.greenBlueLight,
                    borderColor: ColorRes.greenBlue,
                    textButtonColor: Colors.white,
                    ID: productID,
                  )
                : SizedBox(),

            /// message whatsup other customers in app for unsalled Ads products
            isAds ? CustomContatctWhatsupContanier(Phone: phone) : SizedBox(),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
