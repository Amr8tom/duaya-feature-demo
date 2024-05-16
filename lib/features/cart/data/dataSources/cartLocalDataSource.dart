import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class cartLocalDataSources {
  Future<void> cacheCartCount({required String jsonBody});
  Future<String> getCartCount();
  Future<void> cacheSummary({required String jsonBody});
  Future<String> getSummary();
  Future<void> cacheCartItems({required String jsonBody});
  Future<String> getCartItems();
}

class cartLocalDataSourcesimp implements cartLocalDataSources {
  @override
  Future<void> cacheCartCount({required String jsonBody}) async {
    await PrefService.putString(key: CacheKeys.cartCount, value: jsonBody);
  }

  @override
  Future<String> getCartCount() async {
    String? response = await PrefService.getString(key: CacheKeys.cartCount);
    return response!;
  }

  @override
  Future<void> cacheSummary({required String jsonBody}) async {
    await PrefService.putString(key: CacheKeys.summary, value: jsonBody);
  }

  @override
  Future<String> getSummary() async {
    String? response = await PrefService.getString(key: CacheKeys.summary);
    return response!;
  }

  @override
  Future<void> cacheCartItems({required String jsonBody}) async {
    await PrefService.putString(key: CacheKeys.summary, value: jsonBody);
  }

  @override
  Future<String> getCartItems() async {
    String? response = await PrefService.getString(key: CacheKeys.cartItems);
    return response!;
  }
}
