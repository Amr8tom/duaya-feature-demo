import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../generated/l10n.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../cached_image/cached_image.dart';

class CustomFavouriteContanier extends StatelessWidget {
  final double? hight;
  final String discount;
  final String? productImage;
  final bool hasDicount;
  final bool removeDiscount;
  final VoidCallback? onFavorite;
  const CustomFavouriteContanier(
      {super.key,
      this.hight,
      required this.discount,
      this.productImage,
      required this.hasDicount,
      required this.removeDiscount,
      this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          /// Product Image.
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: CachedImage(
              height: hight ?? AppSizes.productImageSize - 3.sp,
              link: productImage,
            ),
          ),

          /// Presetage - Heart.
          Row(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: AppSizes.spaceBtwTexts),
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
                                    color: ColorRes.white, fontSize: 14.sp)))
                    : null,
              ),
              const Spacer(),
              IconButton(
                  onPressed: onFavorite ?? () {},
                  icon: Icon(
                    Iconsax.heart_tick,
                    size: 23.sp,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
