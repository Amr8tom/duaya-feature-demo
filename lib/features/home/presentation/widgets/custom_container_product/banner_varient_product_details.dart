import 'package:duaya_app/features/home/data/model/productModel.dart';
import 'package:duaya_app/features/home/presentation/widgets/details_row.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../generated/l10n.dart';
import '../../controller/best_seller_cubit.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';

import '../filterChips.dart';

class BannerInVarientProduct extends StatelessWidget {
  Map<String, dynamic> map;

  BannerInVarientProduct({Key? key, required Map<String, dynamic> this.map})
      : super(key: key);
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    String remoteName = map["productName"];
    String remotePrice = map["price"];
    String remotEarnPoint = S.current.loading;
    String remotestrokedPrice = map["strockedPrice"];
    String remoteCompany = map["companyName"];
    String remoteImage = map["productImage"];
    String remoteItemsCount = S.current.loading;
    bool hasDicount = map["hasDicount"];
    String remotediscount = map["discount"];
    BestSellerCubit bestSellerController = context.read<BestSellerCubit>();
    bestSellerController.fetchProductData(productID: map["productID"]);
    List<ChoiceOptions> options = [];
    List<Widget> pages = [SizedBox()];
    return FutureBuilder(
        future:
            checkImageNetwork.checkImageStatus(NetworkImageURL: remoteImage),
        builder: (context, snapshot) {
          Widget imageWidget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            imageWidget = Lottie.asset(AssetRes.emptyProduct2, height: 250.sp);
          } else if (snapshot.hasError || !snapshot.data!) {
            imageWidget = Lottie.asset(AssetRes.emptyProduct2, height: 250.sp);
          } else {
            imageWidget = Image.network(
              remoteImage,
              height: 250.sp,
            );
          }
          return BlocConsumer<BestSellerCubit, BestSellerState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is! BestSellerModelloading ||
                  state is! productModelloading) {
                remotEarnPoint = bestSellerController
                    .productModel.data![0].earnPoint!
                    .toString();
                remoteItemsCount = bestSellerController
                    .productModel.data![0].currentStock
                    .toString();
                List<Photos> varients =
                    bestSellerController.productModel.data![0]!.photos!;
                options =
                    bestSellerController.productModel.data![0]!.choiceOptions!;
                pages = List.generate(
                    varients.length,
                    (index) => Center(
                        child: Image.network(varients[index]!.path!,
                            width: AppSizes.imageSize * 4)));
                return SingleChildScrollView(
                  child: Stack(children: [
                    Container(
                      height: screenHeight,
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.spaceBtwItems * 1.5,
                          horizontal: AppSizes.spaceBtwItems),
                      decoration: BoxDecoration(
                        // color: ColorRes.white,
                        borderRadius:
                            BorderRadius.circular(AppSizes.borderRadiusLg),
                      ),
                      child: Column(
                        children: [
                          /// Product Image

                          Stack(children: [
                            // pages[1],
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Spacer(),
                                    Wrap(
                                      direction: Axis.vertical,
                                      spacing: 8.0,
                                      children: options[0].options!.map((size) {
                                        bool isSelected = (size ==
                                            bestSellerController.selectedSize);
                                        return FilterChip(
                                          label: Text(size),
                                          selected: isSelected,
                                          onSelected: (bool onSelect) {
                                            if (onSelect) {
                                              bestSellerController.setSize(
                                                  Size: size);
                                            } else {}
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                                Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 1.0,
                                  children: options[0].options!.map((size) {
                                    bool isSelected = (size ==
                                        bestSellerController.selectedSize);
                                    return FilterChip(
                                      label: Text(size),
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
                              ],
                            ),
                          ]),
                          Container(
                            padding:
                                EdgeInsets.all(AppSizes.spaceBtwTexts * 1.2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppSizes.borderRadiusLg),
                                color: ColorRes.grey2.withOpacity(0.4)),
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 5,
                              effect: WormEffect(
                                  dotHeight: 10.h,
                                  dotWidth: 10.w,
                                  activeDotColor: ColorRes.white,
                                  dotColor: ColorRes.grey),
                            ),
                          ),

                          Padding(
                            child: Column(
                              children: [
                                detailsRow(
                                    title: S.current.productName,
                                    description: remoteName),

                                detailsRow(
                                    title: S.current.company,
                                    description: remoteCompany),

                                detailsRow(
                                    title: S.current.avaliableItemCount,
                                    description: remoteItemsCount),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Text(S.current.numberOfPints,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                  decoration:
                                                      TextDecoration.none,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: ColorRes.primary)),
                                    ),
                                    Spacer(),
                                    Expanded(
                                      flex: 7,
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: AppSizes.spaceBtwItems,
                                            vertical:
                                                AppSizes.spaceBtwTexts * 2),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                AppSizes.borderRadiusLg),
                                            color: ColorRes.primaryBackground
                                                .withOpacity(0.8)),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Image.asset(AssetRes.dollarIcon,
                                                width:
                                                    AppSizes.imageSize / 2.1),
                                            SizedBox(
                                                width: AppSizes.spaceBtwTexts),
                                            Text(S.current.points,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: ColorRes.white,
                                                        fontSize: 15.sp)),
                                            SizedBox(
                                                width: AppSizes.spaceBtwTexts),
                                            Text(remotEarnPoint,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: ColorRes.white)),
                                            SizedBox(
                                                width:
                                                    AppSizes.spaceBtwTexts * 6),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                detailsRow(
                                    title: S.current.priceBeforeOffer,
                                    description: remotestrokedPrice),

                                detailsRow(
                                    title: S.current.priceAfterOffer,
                                    description: remotePrice)

                                /// Make Size
                              ],
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 30.sp, horizontal: 10.sp),
                          ),
                        ],
                      ),
                    ),
                  ]),
                );
              } else {
                return Text("asdasdas");
              }
            },
          );
        });
  }
}
