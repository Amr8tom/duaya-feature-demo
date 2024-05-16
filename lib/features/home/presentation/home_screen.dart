import 'package:duaya_app/features/home/presentation/widgets/custom_category/custom_category.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_slider/custom_slider.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import '../../category/presentation/category/presentation/controller/companies_by_page_cubit.dart';
import 'controller/best_seller_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BestSellerCubit bestSellerController = context.read<BestSellerCubit>();
    CategoriesByPageCubit categoriesByPageController =
        context.read<CategoriesByPageCubit>();

    return BlocConsumer<CategoriesByPageCubit, CategoriesByPageState>(
      listener: (context, catastate) {
        // TODO: implement listener
      },
      builder: (context, catastate) {
        return BlocConsumer<BestSellerCubit, BestSellerState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is BestSellerInitial ||
                state is BestSellerModelloading ||
                catastate is CategoriesByPageInitial) {
              return Center(
                child: Lottie.asset(AssetRes.circleLoading),
              );
            } else {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(AppSizes.padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// Slider
                      CustomSlider(),

                      /// Make Space
                      SizedBox(height: AppSizes.spaceBtwItems),

                      /// Category
                      Row(
                        children: [
                          Text(S.current.categories,
                              style: Theme.of(context).textTheme.titleLarge),
                          const Spacer(),
                          Text(S.current.seeAll,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: ColorRes.primary)),
                          Icon(Icons.arrow_forward_ios,
                              size: 12.sp, color: ColorRes.grey2)
                        ],
                      ),

                      /// Make Space
                      SizedBox(height: AppSizes.spaceBtwItems * 1.2),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            categoriesByPageController
                                .categoriesModel.data!.length,
                            (index) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      8.0), // Adjust spacing between items
                              child: CustomCategoryInHome(
                                categoryImage: categoriesByPageController
                                    .categoriesModel.data![index].icon!,
                                categoryName: categoriesByPageController
                                    .categoriesModel.data![index].name!,
                                categoryID: categoriesByPageController
                                    .categoriesModel.data![index].id!
                                    .toString(),
                              ),
                            ),
                          ),
                        ),
                      ),

                      /// Make Space
                      SizedBox(height: AppSizes.spaceBtwItems * 2),

                      /// Best Offers
                      Text(S.current.bestOffers,
                          style: Theme.of(context).textTheme.titleLarge),

                      /// Make Space
                      SizedBox(height: AppSizes.spaceBtwItems * 1.2),

                      /// Products
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 1 / 2.2,
                        ),
                        shrinkWrap: true,
                        itemCount:
                            bestSellerController.bestSellerModel.data!.length,
                        itemBuilder: (context, index) {
                          String image = bestSellerController
                              .bestSellerModel.data![index].thumbnailImage!;
                          String ID = bestSellerController
                              .bestSellerModel.data![index].id!
                              .toString();
                          String shopName = bestSellerController
                              .bestSellerModel.data![index].shopName!;
                          String name = bestSellerController
                              .bestSellerModel.data![index].name!;
                          String discount = bestSellerController
                              .bestSellerModel.data![index].discount!;
                          String price = bestSellerController
                              .bestSellerModel.data![index].mainPrice!;
                          String strokedPrice = bestSellerController
                              .bestSellerModel.data![index].strokedPrice!;
                          bool hasDiscount = bestSellerController
                              .bestSellerModel.data![index].hasDiscount!;
                          // bool isVarient= bestSellerController.bestSellerModel.data![index]
                          return GestureDetector(
                            onTap: () async {
                              context.pushNamed(DRoutesName.detailsProductRoute,
                                  arguments: {
                                    "productName": name,
                                    "productID": ID,
                                    "discount": ID,
                                    "productImage": image,
                                    "companyName": shopName,
                                    "discount": discount,
                                    "price": price,
                                    "strockedPrice": strokedPrice,
                                    "hasDicount": hasDiscount,
                                  });
                            },
                            child: CustomContainerProduct(
                              productImage: image,
                              productName: name,
                              companyName: shopName,
                              discount: discount,
                              rete: 4.5,
                              price: price,
                              hasDicount: hasDiscount,
                              strockedPrice: strokedPrice,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
