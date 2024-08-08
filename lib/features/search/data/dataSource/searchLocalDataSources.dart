import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class search {
  Future<void> cacheSearchData(
      {required String searchData, required String name});
  Future<Map<String, dynamic>> getSearchData({required String name});
}

class searchLocalDataSourcesImp implements search {
  @override
  Future<void> cacheSearchData(
      {required String searchData,
      required String name,
      int page = 0,
      String? companyID}) async {
    // await PrefService.putString(key: CacheKeys.search, value: searchData);
    await PrefService.putStringbyString(
        key: "${CacheKeys.search.name}$name$page$companyID", value: searchData);
  }

  @override
  Future<Map<String, dynamic>> getSearchData(
      {required String name, int page = 0, String? companyID}) async {
    // String? reponse = await PrefService.getString(key: CacheKeys.search);
    String? reponse = await PrefService.getStringByString(
        key: "${CacheKeys.search.name}$name$page$companyID");
    Map<String, dynamic> searchJson = jsonDecode(reponse!);
    return searchJson;
  }
}
