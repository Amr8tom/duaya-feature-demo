import 'package:duaya_app/common/widgets/custom_button/custom_button_with_icon.dart';
import 'package:duaya_app/features/cart/presentation/widgets/add_miuns_cart_button.dart';
import 'package:duaya_app/features/home/presentation/controller/best_seller_cubit.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../cart/presentation/widgets/cart_windows.dart';

class RelatedContainerProduct extends StatelessWidget {
  final String productImage, productName, companyName, price, productID;
  String strockedPrice, discount;
  // final double rete;
  bool hasDicount;
  bool isCart;

  RelatedContainerProduct({
    Key? key,
    required this.productImage,
    required this.productName,
    required this.productID,
    required this.companyName,
    required this.price,
    this.strockedPrice = "",
    this.isCart = true,
    required this.hasDicount,
    this.discount = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future:
            checkImageNetwork.checkImageStatus(NetworkImageURL: productImage),
        builder: (context, snapshot) {
          final bestSellerController = context.read<BestSellerCubit>();
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
                        color: Colors.black.withOpacity(0.2),
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadiusLg)),
                    child: Column(
                      children: [
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
                                      child: Text(
                                          "${S.current.discont} ${discount!}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: ColorRes.lightGreen,
                                                  fontSize: 14.sp)))
                                  : null,
                            ),
                            const Spacer(),
                            Icon(Iconsax.discount_circle, size: 23.sp)
                          ],
                        ),

                        /// Company Name
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.sp),
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15)),
                            child: Text(companyName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: ColorRes.lightGreen,
                                        fontSize: 25.sp,
                                        fontWeight: FontWeight.w900)),
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceBtwTexts),

                        /// Product Name.
                        Text(productName,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: ColorRes.white,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w900)),
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
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontSize: 17.sp,
                                            color: ColorRes.white))
                                : SizedBox(),
                            Text(price,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                        color: Colors.green, fontSize: 17.sp))
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

                        // SizedBox(height: AppSizes.spaceBtwItems / 1.2),
                      ],
                    ),
                  ),
          );
        });
  }
}
