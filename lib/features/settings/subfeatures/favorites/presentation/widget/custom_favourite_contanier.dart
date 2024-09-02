import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:duaya_app/common/common_snak_bar_widget.dart';
import 'package:duaya_app/common/custom_ui.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/add_favourite_item_usecase.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/check_favourite_item_usecase.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/get_wishlist_items_usecase.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/domain/usecases/remove_favourite_item_usecase.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../../../generated/l10n.dart';
import '../../../../../../../utils/constants/colors.dart';
import '../../../../../../../utils/constants/sizes.dart';
import '../../../../../../../common/widgets/cached_image/cached_image.dart';
import '../../../../../../utils/connection/checkNetwork.dart';
import '../../../../../../utils/dio/dio_helper.dart';
import '../../data/datasources/local_data_sources.dart';
import '../../data/datasources/remote_data_sources.dart';
import '../../data/repositories/repositories.dart';
import '../controller/favourite_cubit.dart';

class CustomFavouriteContanier extends StatelessWidget {
  final double? hight;
  final String discount;
  final String productID;
  final String? productImage;
  final bool hasDicount;
  final bool removeDiscount;
  final VoidCallback? onFavorite;

  const CustomFavouriteContanier(
      {super.key,
      this.hight,
      required this.discount,
      required this.productID,
      this.productImage,
      required this.hasDicount,
      required this.removeDiscount,
      this.onFavorite});

  @override
  Widget build(BuildContext context) {
    final DataConnectionChecker connectionChecker = DataConnectionChecker();
    final dio = DioHelper();
    final LocalDataSources localDataSource = LocalDataSourcesImp();
    final RemoteDataSources remoteDataSource = RemoteDataSourcesImp(dio);
    final NetworkInfo networkInfo = NetworkInfoImpl(connectionChecker);
    FavoriteRepoImp repo = FavoriteRepoImp(
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        networkInfo: networkInfo);
    final GetWishlistItemsUsecase getUsecase = GetWishlistItemsUsecase(repo);
    final AddFavouriteItemUsecase addUsecase = AddFavouriteItemUsecase(repo);
    final RemoveFavouriteItemUsecase RemoveUsecase =
        RemoveFavouriteItemUsecase(repo);
    final CheckFavouriteItemUsecase checkUsecase =
        CheckFavouriteItemUsecase(repo);
    return BlocProvider(
      create: (context) => FavouriteCubit(
          getUsecase: getUsecase,
          addUsecase: addUsecase,
          RemoveUsecase: RemoveUsecase,
          checkUsecase: checkUsecase),
      child: Builder(builder: (context) {
        final favouriteControlelr = context.read<FavouriteCubit>();
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
                    padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.spaceBtwTexts),
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
                                        color: ColorRes.white,
                                        fontSize: 14.sp)))
                        : null,
                  ),
                  const Spacer(),
                  BlocBuilder<FavouriteCubit, FavouriteState>(
                    builder: (context, state) {
                      if (state is FavouriteAddSuccess) {
                        return IconButton(
                            onPressed: () async {
                              await favouriteControlelr.addFavouriteItem(
                                  params: {"product_id": productID});
                            },
                            icon: Icon(
                              Iconsax.heart5,
                              size: 23.sp,
                              color: Colors.red,
                            ));
                      } else {
                        return IconButton(
                            onPressed: () async {
                              await favouriteControlelr.addFavouriteItem(
                                  params: {"product_id": productID});
                            },
                            icon: Icon(
                              Iconsax.heart_tick,
                              size: 23.sp,
                              color: Colors.red,
                            ));
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
