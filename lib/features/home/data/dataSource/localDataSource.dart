import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class bestSellerLocalDataSource {
  Future<void> cacheBrstSellerJson({required String bestSellerJson});
  Future<Map<String, dynamic>?> getBestSeller();
  Future<void> cacheSlidersJson({required String SlidersJson});
  Future<Map<String, dynamic>?> getSliders();
  Future<void> cacheProductDetails(
      {required String productJson, required String productID});
  Future<Map<String, dynamic>?> getProductJson({required String productID});
  Future<void> cacheRelatedProduct(
      {required String relatedProductJson, required String productID});
  Future<Map<String, dynamic>?> getRelatedProduct({required String productID});
}

class bestSellerLocalDataSourceImpl implements bestSellerLocalDataSource {
  @override
  Future<void> cacheBrstSellerJson({required String bestSellerJson}) async {
    await PrefService.putString(
        key: CacheKeys.bestSeller, value: bestSellerJson);
  }

  @override
  Future<Map<String, dynamic>?> getBestSeller() async {
    String? bestSellerJson =
        await PrefService.getString(key: CacheKeys.bestSeller);
    return jsonDecode(bestSellerJson!);
  }

  @override
  Future<void> cacheSlidersJson({required String SlidersJson}) async {
    await PrefService.putString(key: CacheKeys.sliders, value: SlidersJson);
  }

  @override
  Future<Map<String, dynamic>?> getSliders() async {
    String? slidersJson = await PrefService.getString(key: CacheKeys.sliders);
    return jsonDecode(slidersJson!);
  }

  @override
  Future<void> cacheProductDetails(
      {required String productJson, required String productID}) async {
    await PrefService.putStringbyString(
        key: "${CacheKeys.productDetails}$productID", value: productJson);
  }

  @override
  Future<Map<String, dynamic>?> getProductJson(
      {required String productID}) async {
    String? productJson = await PrefService.getStringByString(
        key: "${CacheKeys.productDetails}$productID");
    return jsonDecode(productJson!);
  }

  @override
  Future<void> cacheRelatedProduct(
      {required String relatedProductJson, required String productID}) async {
    await PrefService.putStringbyString(
        key: "${CacheKeys.relatedProduct}$productID",
        value: relatedProductJson);
  }

  @override
  Future<Map<String, dynamic>?> getRelatedProduct(
      {required String productID}) async {
    // TODO: implement getRelatedProduct
    String? productJson = await PrefService.getStringByString(
        key: "${CacheKeys.relatedProduct}$productID");
    return jsonDecode(productJson!);
  }
}
