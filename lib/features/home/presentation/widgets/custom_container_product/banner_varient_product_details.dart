import 'package:duaya_app/features/home/data/model/productModel.dart';
import 'package:duaya_app/features/home/presentation/widgets/details_row.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/l10n.dart';
import '../../controller/best_seller_cubit.dart';
import '../../../../relatedProducts/presentation/relatedProducts.dart';
import '../../../../cart/presentation/widgets/cart_windows.dart';

class BannerInVarientProduct extends StatelessWidget {
  Map<String, dynamic> map;
  BannerInVarientProduct({Key? key, required Map<String, dynamic> this.map})
      : super(key: key);
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    String remotePrice = map["price"];
    String remotEarnPoint = S.current.loading;
    String remotestrokedPrice = map["strockedPrice"];
    String remoteCompany = map["companyName"];
    String discount = map["discount"];
    bool hasDicount = map["hasDicount"];
    String remoteImage = map["productImage"];
    String remoteItemsCount = S.current.loading;
    BestSellerCubit bestSellerController = context.read<BestSellerCubit>();
    List<ChoiceOptions> options = [];
    List<String> colors = [];
    return BlocConsumer<BestSellerCubit, BestSellerState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is productModelSuccess) {
          remotEarnPoint = bestSellerController.productModel.data?[0].earnPoint!
                  .toString() ??
              "";
          options = bestSellerController.productModel.data![0]!.choiceOptions!;
          remoteItemsCount = bestSellerController
                  .productModel.data?[0].currentStock
                  .toString() ??
              "";
          colors = bestSellerController.productModel.data![0]!.colors!;
          map["variant"] = bestSellerController.varient ?? "";
        }

        return Stack(children: [
          Column(
            children: [
              /// number of points
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(S.current.numberOfPints,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                decoration: TextDecoration.none,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w900,
                                color: ColorRes.black)),
                  ),
                  Spacer(),
                  Expanded(
                    flex: 5,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceBtwItems,
                          vertical: AppSizes.spaceBtwTexts * 2),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(AppSizes.borderRadiusLg),
                          color: ColorRes.lightGreen),
                      child: Row(
                        children: [
                          Spacer(),
                          Image.asset(AssetRes.dollarIcon,
                              width: AppSizes.imageSize / 2.1),
                          SizedBox(width: AppSizes.spaceBtwTexts),
                          Text(S.current.points,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: ColorRes.white, fontSize: 15.sp)),
                          SizedBox(width: AppSizes.spaceBtwTexts),
                          Text(remotEarnPoint,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: ColorRes.white)),
                          SizedBox(width: AppSizes.spaceBtwTexts * 6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(),
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
                            child: Text("${S.current.discont} ${discount!}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(
                                        color: ColorRes.white,
                                        fontSize: 14.sp)))
                        : null,
                  ),
                  const Spacer(),
                  Icon(Iconsax.money, size: 23.sp)
                ],
              ),

              /// image and options  in layers
              Stack(
                children: [
                  /// Product Image
                  colors.isNotEmpty
                      ? Column(
                          children: [
                            Text("${bestSellerController.varient}"),
                            Container(
                              height: 260.sp,
                              child: bestSellerController
                                  .getImageArrangeImageByColorAndSize(),
                            ),
                          ],
                        )
                      : SizedBox(
                          child: Center(
                            child: bestSellerController.getNormalImage(
                                imgPath: remoteImage),
                          ),
                        ),

                  /// Product Size and color
                  Column(
                    children: [
                      Row(
                        children: [
                          /// product color
                          SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                colors.length > 0
                                    ? Text(S.current.color,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                    : SizedBox(),
                                // Spacer(),
                                colors.length > 0
                                    ? Wrap(
                                        direction: Axis.vertical,
                                        spacing: 4.0,
                                        children: colors.map((color) {
                                          bool isSelected =
                                              (colors.indexOf(color) ==
                                                  bestSellerController
                                                      .selectedColorbyimage);
                                          return FilterChip(
                                            backgroundColor:
                                                ColorRes.grey.withOpacity(0.3),
                                            label: Container(
                                              width: 20,
                                              height: 20,
                                              decoration: BoxDecoration(
                                                color: Color(int.parse(color
                                                    .replaceAll('#', '0xff'))),
                                                shape: BoxShape.circle,
                                              ),
                                            ),
                                            padding: EdgeInsets.all(1.sp),
                                            selected: isSelected,
                                            onSelected: (bool onSelect) {
                                              if (onSelect) {
                                                bestSellerController.setColor(
                                                    color:
                                                        colors.indexOf(color));
                                              } else {}
                                            },
                                          );
                                        }).toList(),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          ),
                          Spacer(),

                          /// product size
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                options.length > 0
                                    ? Text(S.current.size,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium)
                                    : SizedBox(),
                                options.length > 0
                                    ? Wrap(
                                        direction: Axis.vertical,
                                        spacing: 8.0,
                                        children:
                                            options[0].options!.map((size) {
                                          bool isSelected = (size ==
                                              bestSellerController
                                                  .selectedSize);
                                          return FilterChip(
                                            label: Container(
                                                width: 25.sp,
                                                child: Text(
                                                  size,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10.sp,
                                                      color:
                                                          ColorRes.lightGreen),
                                                )),
                                            selected: isSelected,
                                            onSelected: (bool onSelect) {
                                              if (onSelect) {
                                                bestSellerController.setSize(
                                                    Size: size);
                                              } else {}
                                            },
                                          );
                                        }).toList(),
                                      )
                                    : SizedBox()
                              ],
                            ),
                          )
                        ],
                      ),

                      /// product Color
                    ],
                  ),
                ],
              ),

              /// product info
              Column(
                children: [
                  Padding(
                    child: Column(
                      children: [
                        detailsRow(
                            title: S.current.company,
                            description: remoteCompany),

                        detailsRow(
                            title: S.current.avaliableItemCount,
                            description: remoteItemsCount),

                        detailsRow(
                            title: S.current.priceBeforeOffer,
                            description: remotestrokedPrice),
                        detailsRow(
                            title: S.current.priceAfterOffer,
                            description: remotePrice),

                        /// Make Size
                      ],
                    ),
                    padding: EdgeInsets.symmetric(
                        vertical: 30.sp, horizontal: 10.sp),
                  ),

                  cartWindows(map: map),
                  SizedBox(
                    height: 20.sp,
                  ),

                  /// relatedProduct
                ],
              ),
              Center(
                  child: Text(
                S.current.comparePrice,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: Colors.red),
              )),
              bestSellerController.isRelated
                  ? relatedProducts()
                  : Lottie.asset(AssetRes.search, height: 50),
            ],
          ),
        ]);
      },
    );
  }
}
