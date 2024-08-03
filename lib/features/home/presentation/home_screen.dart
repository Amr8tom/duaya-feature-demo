import 'package:duaya_app/features/search/presentation/controller/search_cubit.dart';
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
import 'controller/best_seller_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BestSellerCubit bestSellerController = context.read<BestSellerCubit>();
    CategoriesByPageCubit categoriesByPageController =
        context.read<CategoriesByPageCubit>();

    TextEditingController searchTextController = TextEditingController();

    return BlocConsumer<CategoriesByPageCubit, CategoriesByPageState>(
      listener: (context, catastate) {},
      builder: (context, catastate) {
        return BlocConsumer<BestSellerCubit, BestSellerState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state);
            if (state is BestSellerInitial) {
              bestSellerController.fetchSlidersData();
              return Center(
                child: Lottie.asset(AssetRes.loadingSliders, height: 150.h),
              );
            } else if (bestSellerController.slidersModel.data == null ||
                bestSellerController.slidersModel?.data?.length == 0) {
              return Center(
                child: Lottie.asset(AssetRes.loadingSliders),
              );
            } else {
              return BlocConsumer<SearchCubit, SearchState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(AppSizes.padding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Make Space
                              SizedBox(height: AppSizes.spaceBtwItems),

                              /// Slider
                              const CustomSlider(),

                              /// see all Button
                              (catastate is CategoriesByPageInitial)
                                  ? Text(S.current.loading)
                                  : Row(
                                      children: [
                                        Text(S.current.categories,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleLarge!
                                                .copyWith(
                                                    color: ColorRes.greenBlue)),
                                        const Spacer(),
                                        IconButton(
                                          onPressed: () {
                                            context.pushNamed(
                                                DRoutesName.categoriesRoute);
                                          },
                                          icon: Text(S.current.seeAll,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color:
                                                          ColorRes.greenBlue)),
                                        ),
                                        Icon(Icons.arrow_forward_ios,
                                            size: 12.sp,
                                            color: ColorRes.greenBlue)
                                      ],
                                    ),

                              /// Make Space
                              SizedBox(height: AppSizes.spaceBtwItems * 1.2),

                              /// categories
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: List.generate(
                                    categoriesByPageController
                                        .categoriesModel.data!.length,
                                    (index) => Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal:
                                              8.0), // Adjust spacing between items
                                      child: CustomCategoryInHome(
                                        categoryImage:
                                            categoriesByPageController
                                                .categoriesModel
                                                .data![index]
                                                .icon!,
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
                                  style:
                                      Theme.of(context).textTheme.titleLarge),

                              /// Make Space
                              SizedBox(height: AppSizes.spaceBtwItems * 1.2),

                              /// Bestseller Products
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 5.h,
                                  childAspectRatio: 1.2 / 2.45,
                                ),
                                shrinkWrap: true,
                                itemCount: bestSellerController
                                    .bestSellerModel.data?.length,
                                itemBuilder: (context, index) {
                                  String? image = bestSellerController
                                      .bestSellerModel
                                      .data?[index]
                                      .thumbnailImage!;
                                  String ID = bestSellerController
                                          .bestSellerModel.data![index].id!
                                          .toString() ??
                                      "";
                                  String shopName = bestSellerController
                                          .bestSellerModel
                                          .data![index]
                                          .shopName! ??
                                      "";
                                  String name = bestSellerController
                                          .bestSellerModel.data![index].name! ??
                                      "";
                                  String discount = bestSellerController
                                          .bestSellerModel
                                          .data![index]
                                          .discount ??
                                      ""!;
                                  String price = bestSellerController
                                          .bestSellerModel
                                          .data![index]
                                          .mainPrice! ??
                                      "";
                                  String strokedPrice = bestSellerController
                                          .bestSellerModel
                                          .data![index]
                                          .strokedPrice! ??
                                      "";
                                  bool hasDiscount = bestSellerController
                                      .bestSellerModel
                                      .data![index]
                                      .hasDiscount!;
                                  // bool isVarient= bestSellerController.bestSellerModel.data![index]
                                  return GestureDetector(
                                    onTap: () {
                                      context.pushNamed(
                                          DRoutesName.detailsProductRoute,
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
                                      color: ColorRes.greyGreen,
                                      productImage: image,
                                      productName: name,
                                      companyName: shopName,
                                      discount: discount,
                                      price: price,
                                      hasDicount: hasDiscount,
                                      strockedPrice: strokedPrice,
                                      rete: 5,
                                      productID: ID,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
