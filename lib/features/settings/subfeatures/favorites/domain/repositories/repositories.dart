import "package:dartz/dartz.dart";
import "package:duaya_app/features/settings/subfeatures/favorites/data/model/add_item_model.dart";
import "package:duaya_app/features/settings/subfeatures/favorites/data/model/check_item_model.dart";
import "package:duaya_app/features/settings/subfeatures/favorites/data/model/remove_item_model.dart";
import "package:duaya_app/utils/error/failure.dart";

import "../../data/model/wishlist_model.dart";

abstract class FavoriteRepo {
  Future<Either<Failure, WishlistModel>> getWishListModel();
  Future<Either<Failure, AddItemModel>> addItem(
      {required Map<String, dynamic> params});
  Future<Either<Failure, RemoveItemModel>> removeItem(
      {required Map<String, dynamic> params});
  Future<Either<Failure, CheckItemModel>> checkItem(
      {required Map<String, dynamic> params});
}
