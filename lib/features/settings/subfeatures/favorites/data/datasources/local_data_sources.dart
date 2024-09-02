import "dart:convert";

import "package:dartz/dartz.dart";
import "package:duaya_app/features/settings/subfeatures/favorites/data/model/wishlist_model.dart";
import "package:duaya_app/utils/error/failure.dart";
import "package:duaya_app/utils/local_storage/cach_keys.dart";
import "package:duaya_app/utils/local_storage/cache_helper.dart";

abstract class LocalDataSources {
  Future<Unit> cacheWishlist({required WishlistModel wishlist});
  Future<WishlistModel> getWishlistModel();
}

class LocalDataSourcesImp implements LocalDataSources {
  LocalDataSourcesImp();
  @override
  Future<Unit> cacheWishlist({required WishlistModel wishlist}) async {
    final String cachedWishlist = await jsonEncode(wishlist);
    await PrefService.putString(key: CacheKeys.wishList, value: cachedWishlist);
    return Future.value(unit);
  }

  @override
  Future<WishlistModel> getWishlistModel() async {
    final jsonString = await PrefService.getString(key: CacheKeys.wishList);
    if (jsonString != null) {
      final decodedJson = await jsonDecode(jsonString);
      return decodedJson;
    } else {
      throw CacheFailure();
    }
  }
}
