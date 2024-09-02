import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/datasources/local_data_sources.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/datasources/remote_data_sources.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/add_item_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/check_item_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/remove_item_model.dart';
import 'package:duaya_app/features/settings/subfeatures/favorites/data/model/wishlist_model.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../../../../../../utils/connection/checkNetwork.dart';
import '../../domain/repositories/repositories.dart';

class FavoriteRepoImp implements FavoriteRepo {
  final LocalDataSources localDataSource;
  final RemoteDataSources remoteDataSource;
  final NetworkInfo networkInfo;
  FavoriteRepoImp(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo});
  @override
  Future<Either<Failure, AddItemModel>> addItem(
      {required Map<String, dynamic> params}) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.addItem(params: params);
      print(
          "=======================================================> $response");
      return right(response);
    } else {
      return left(ServerFailure(message: "no network error"));
    }
  }

  @override
  Future<Either<Failure, WishlistModel>> getWishListModel() async {
    if (await networkInfo.isConnected) {
      try {
        final wishlist = await remoteDataSource.getWishlistModel();
        await localDataSource.cacheWishlist(wishlist: wishlist);
        return right(wishlist);
      } on ServerFailure {
        return left(ServerFailure(
            message:
                '======== serever Faluire is working=========================='));
      }
    } else {
      try {
        final wishlist = await localDataSource.getWishlistModel();
        return right(WishlistModel.fromJson(wishlist));
      } on CacheFailure {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, RemoveItemModel>> removeItem(
      {required Map<String, dynamic> params}) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.removeItem(params: params);
      print(
          "=======================================================> $response");
      return right(response);
    } else {
      return left(ServerFailure(message: "no network error"));
    }
  }

  @override
  Future<Either<Failure, CheckItemModel>> checkItem(
      {required Map<String, dynamic> params}) async {
    if (await networkInfo.isConnected) {
      final response = await remoteDataSource.checkItem(params: params);
      print(
          "=======================================================> $response");
      return right(response);
    } else {
      return left(ServerFailure(message: "no network error"));
    }
  }
}
