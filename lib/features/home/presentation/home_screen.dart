import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/home/presentation/widgets/bestseller_product_list.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_category/custom_category_banner.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_category/see_all_category_button.dart';
// import 'package:duaya_app/features/home/presentation/widgets/custom_slider/custom_slider.dart';
import 'package:duaya_app/generated/l10n.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../category/presentation/category/presentation/controller/categories_by_page_cubit.dart';
import 'controller/best_seller_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bestSellerController = context.read<BestSellerCubit>();
    return BlocBuilder<CategoriesByPageCubit, CategoriesByPageState>(
      builder: (context, catastate) {
        return BlocConsumer<BestSellerCubit, BestSellerState>(
          listener: (context, state) {},
          builder: (context, state) {
            print(state);
            if (state is BestSellerInitial) {
              bestSellerController.fetchSlidersData();
              return CustomUI.simpleLoader();
            } else if (bestSellerController.slidersModel.data == null ||
                bestSellerController.slidersModel?.data?.length == 0) {
              return CustomUI.simpleLoader();
            } else {
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
                          // const CustomSlider(),

                          /// see all Button
                          (catastate is CategoriesByPageInitial)
                              ? Text(S.current.loading)
                              : const SeeAllCategoryButton(),

                          /// Make Space
                          SizedBox(height: AppSizes.spaceBtwItems * 1.2),

                          /// categories banner
                          const CustomCategoryBanner(),

                          /// Make Space
                          SizedBox(height: AppSizes.spaceBtwItems * 2),

                          /// Best Offers
                          Text(S.current.bestOffers,
                              style: Theme.of(context).textTheme.titleLarge),

                          /// Make Space
                          SizedBox(height: AppSizes.spaceBtwItems * 1.2),

                          /// Bestseller Products
                          const BestsellerProductList()
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        );
      },
    );
  }
}
