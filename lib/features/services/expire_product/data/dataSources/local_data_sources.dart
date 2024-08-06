import 'dart:convert';
import 'dart:ffi';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class expiredProductLocalDataSource {
  Future<void> cacheExpiredProductsList({required String expiredProductsJson});
  Future<Map<String, dynamic>?> getExpiredProducts();
}

class expiredProductLocalDataSourceImp
    implements expiredProductLocalDataSource {
  @override
  Future<void> cacheExpiredProductsList(
      {required String expiredProductsJson}) async {
    await PrefService.putString(
        key: CacheKeys.expiredProductList, value: expiredProductsJson);
  }

  @override
  Future<Map<String, dynamic>?> getExpiredProducts() async {
    String? response =
        await PrefService.getString(key: CacheKeys.expiredProductList);
    return jsonDecode(response!);
  }
}
