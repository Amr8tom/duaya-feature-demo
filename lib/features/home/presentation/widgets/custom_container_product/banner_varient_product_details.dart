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

        return Column(
          children: [
            SizedBox(
              height: AppSizes.spaceBtwInputFields,
            ),
            Container(
              decoration: BoxDecoration(
                  color: ColorRes.greyGreen,
                  borderRadius: BorderRadius.circular(15.r)),
              child: Column(
                children: [
                  /// discount
                  Center(
                    child: Container(
                      width: 90.w,
                      height: 32.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSizes.spaceBtwTexts),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r)),
                          color: Colors.red),
                      child: hasDicount
                          ? Center(
                              child: Text("${discount!}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(
                                          color: ColorRes.white,
                                          fontSize: 14.sp)))
                          : null,
                    ),
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
                                              bool isSelected = (colors
                                                      .indexOf(color) ==
                                                  bestSellerController
                                                      .selectedColorbyimage);
                                              return FilterChip(
                                                backgroundColor: ColorRes.grey
                                                    .withOpacity(0.3),
                                                label: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    color: Color(int.parse(
                                                        color.replaceAll(
                                                            '#', '0xff'))),
                                                    shape: BoxShape.circle,
                                                  ),
                                                ),
                                                padding: EdgeInsets.all(1.sp),
                                                selected: isSelected,
                                                onSelected: (bool onSelect) {
                                                  if (onSelect) {
                                                    bestSellerController
                                                        .setColor(
                                                            color:
                                                                colors.indexOf(
                                                                    color));
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
                                                          color: ColorRes
                                                              .lightGreen),
                                                    )),
                                                selected: isSelected,
                                                onSelected: (bool onSelect) {
                                                  if (onSelect) {
                                                    bestSellerController
                                                        .setSize(Size: size);
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              children: [
                                detailsRow(
                                    title: S.current.company,
                                    description: remoteCompany),

                                detailsRow(
                                    title: S.current.avaliableItemCount,
                                    description: remoteItemsCount),
                                detailsRow(
                                    title: S.current.numberOfPints,
                                    description: remotEarnPoint),
                                detailsRow(
                                    title: S.current.priceBeforeOffer,
                                    description: remotestrokedPrice),
                                detailsRow(
                                    title: S.current.priceAfterOffer,
                                    description: remotePrice),

                                /// Make Size
                              ],
                            ),
                          ),
                          Expanded(flex: 4, child: cartWindows(map: map)),
                        ],
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// relatedProduct
            Center(
                child: Text(
              S.current.comparePrice,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: ColorRes.greenBlue, fontSize: 32.sp),
            )),
            bestSellerController.isRelated
                ? relatedProducts()
                : Lottie.asset(AssetRes.searchICon, height: 200),
          ],
        );
      },
    );
  }
}
