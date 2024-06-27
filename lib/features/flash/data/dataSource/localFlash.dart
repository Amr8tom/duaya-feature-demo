import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class flashLocalDataSource {
  Future<void> cacheFlashLocalData({required String flashJson});
  Future<Map<String, dynamic>> getFlashLocalData();
  Future<void> cacheFlashTodayLocalData({required String flashTodayJson});
  Future<Map<String, dynamic>> getFlashTodayLocalData();
}

class flashLocalDataSourceImp implements flashLocalDataSource {
  @override
  Future<void> cacheFlashLocalData({required String flashJson}) async {
    await PrefService.putString(key: CacheKeys.flash, value: flashJson);
  }

  @override
  Future<Map<String, dynamic>> getFlashLocalData() async {
    final String? flashJson = await PrefService.getString(key: CacheKeys.flash);
    return jsonDecode(flashJson!);
  }

  @override
  Future<void> cacheFlashTodayLocalData(
      {required String flashTodayJson}) async {
    await PrefService.putString(
        key: CacheKeys.flashToday, value: flashTodayJson);
  }

  @override
  Future<Map<String, dynamic>> getFlashTodayLocalData() async {
    final String? flashJson =
        await PrefService.getString(key: CacheKeys.flashToday);
    return jsonDecode(flashJson!);
  }
}
