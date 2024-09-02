import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/common/widgets/appbar/appbar.dart';
import 'package:duaya_app/features/home/presentation/widgets/custom_container_product/custom_container_product.dart';
import 'package:duaya_app/features/service_locator/serrvice_locator.dart';
import 'package:duaya_app/routing/routes_name.dart';
import 'package:duaya_app/utils/constants/image_strings.dart';
import 'package:duaya_app/utils/constants/sizes.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/connection/checkNetwork.dart';
import '../../../../../utils/dio/dio_helper.dart';
import '../data/datasources/local_data_sources.dart';
import '../data/datasources/remote_data_sources.dart';
import '../data/repositories/repositories.dart';
import '../domain/usecases/add_favourite_item_usecase.dart';
import '../domain/usecases/check_favourite_item_usecase.dart';
import '../domain/usecases/get_wishlist_items_usecase.dart';
import '../domain/usecases/remove_favourite_item_usecase.dart';
import 'controller/favourite_cubit.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<FavouriteCubit>(),
      child: Builder(builder: (context) {
        final favouriteController = context.read<FavouriteCubit>();
        favouriteController.getAllFavouriteItem();
        return Scaffold(
            appBar: DAppBar(
              title: Text(S.current.favorite),
              centerTitle: true,
              showBackArrow: true,
            ),
            body: BlocBuilder<FavouriteCubit, FavouriteState>(
              builder: (context, state) {
                print(state);
                print(state);
                print(state);
                if (state is FavouriteWishListSuccess) {
                  if (state.wishlist?.data?.length == 0) {
                    return Center(child: CustomUI.noData());
                  } else {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: AppSizes.spaceBtwItems),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10.h,
                          childAspectRatio: 1 / 1.8,
                        ),
                        shrinkWrap: true,
                        itemCount: state.wishlist!.data!.length,
                        itemBuilder: (context, index) {
                          final String? ID = state
                              .wishlist?.data?[index].product?.id
                              .toString();
                          final String? name = state
                              .wishlist?.data?[index].product?.name
                              .toString();
                          final String? cost = state
                              .wishlist?.data?[index].product?.basePrice
                              .toString();
                          final String? image = state
                              .wishlist?.data?[index].product?.thumbnailImage
                              .toString();
                          final String? rate = state
                              .wishlist?.data?[index].product?.rating
                              .toString();
                          return GestureDetector(
                              onTap: () {
                                context
                                    .pushNamed(DRoutesName.detailsProductRoute);
                              },
                              child: CustomContainerProduct(
                                productID: ID!,
                                productImage: image!,
                                productName: name!,
                                companyName: "",
                                rete: 5,
                                hasDicount: false,
                                price: cost!,
                              ));
                        },
                      ),
                    );
                  }
                } else {
                  return CustomUI.simpleLoader();
                }
              },
            ));
      }),
    );
  }
}
