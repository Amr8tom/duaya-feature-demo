import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class GiftLocalDataSources {
  Future<Map<String, dynamic>> getGift();
  void cacheGift({required String giftBody});
}

class GiftLocalDataSourcesImp implements GiftLocalDataSources {
  @override
  void cacheGift({required String giftBody}) {
    PrefService.putString(key: CacheKeys.gift, value: giftBody);
  }

  @override
  Future<Map<String, dynamic>> getGift() async {
    String? response = await PrefService.getString(key: CacheKeys.gift);
    return jsonDecode(response!);
  }
}
