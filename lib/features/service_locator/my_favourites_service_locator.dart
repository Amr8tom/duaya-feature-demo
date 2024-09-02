import 'package:duaya_app/features/settings/subfeatures/favorites/data/datasources/remote_data_sources.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/repositories/repositories.dart';
import 'package:get_it/get_it.dart';

import '../settings/subfeatures/favorites/data/datasources/local_data_sources.dart';
import '../settings/subfeatures/favorites/domain/repositories/repositories.dart';
import '../settings/subfeatures/favorites/domain/usecases/add_favourite_item_usecase.dart';
import '../settings/subfeatures/favorites/domain/usecases/check_favourite_item_usecase.dart';
import '../settings/subfeatures/favorites/domain/usecases/get_wishlist_items_usecase.dart';
import '../settings/subfeatures/favorites/domain/usecases/remove_favourite_item_usecase.dart';
import '../settings/subfeatures/favorites/presentation/controller/favourite_cubit.dart';

class MyFavouritesServiceLocator {
  static Future<void> execute({required GetIt serviceLocator}) async {
    serviceLocator
        .registerLazySingleton<LocalDataSources>(() => LocalDataSourcesImp());
    serviceLocator.registerLazySingleton<RemoteDataSources>(
        () => RemoteDataSourcesImp(serviceLocator()));
    serviceLocator.registerLazySingleton<FavoriteRepo>(() => FavoriteRepoImp(
        localDataSource: serviceLocator(),
        remoteDataSource: serviceLocator(),
        networkInfo: serviceLocator()));
    serviceLocator.registerLazySingleton<GetWishlistItemsUsecase>(
        () => GetWishlistItemsUsecase(serviceLocator()));
    serviceLocator.registerLazySingleton<AddFavouriteItemUsecase>(
        () => AddFavouriteItemUsecase(serviceLocator()));
    serviceLocator.registerLazySingleton<RemoveFavouriteItemUsecase>(
        () => RemoveFavouriteItemUsecase(serviceLocator()));
    serviceLocator.registerLazySingleton<CheckFavouriteItemUsecase>(
        () => CheckFavouriteItemUsecase(serviceLocator()));
    serviceLocator.registerFactory<FavouriteCubit>(() => FavouriteCubit(
        getUsecase: serviceLocator(),
        addUsecase: serviceLocator(),
        checkUsecase: serviceLocator(),
        RemoveUsecase: serviceLocator()));
  }
}
