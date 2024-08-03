import 'dart:convert';

import '../../../../../../utils/local_storage/cach_keys.dart';
import '../../../../../../utils/local_storage/cache_helper.dart';

abstract class walletLocalDAtaSources {
  Future<void> cacheWalletBalance({required String walletJson});
  Future<Map<String, dynamic>?> getWalletBalance();
  Future<void> cacheWalletHistory({required String walletJson});
  Future<Map<String, dynamic>?> getWalletHistory();
}

class walletLocalDataSourcesImp implements walletLocalDAtaSources {
  @override
  Future<void> cacheWalletBalance({required String walletJson}) async {
    // TODO: implement cacheWalletBalance
    await PrefService.putString(
        key: CacheKeys.walletBalance, value: walletJson);
  }

  @override
  Future<Map<String, dynamic>?> getWalletBalance() async {
    String? walletJson =
        await PrefService.getString(key: CacheKeys.walletBalance);
    return jsonDecode(walletJson!);
  }

  @override
  Future<void> cacheWalletHistory({required String walletJson}) async {
    await PrefService.putString(
        key: CacheKeys.walletHistory, value: walletJson);
  }

  @override
  Future<Map<String, dynamic>?> getWalletHistory() async {
    String? walletJson =
        await PrefService.getString(key: CacheKeys.walletHistory);
    return jsonDecode(walletJson!);
  }
}
