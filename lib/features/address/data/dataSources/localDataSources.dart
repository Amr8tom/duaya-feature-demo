import 'dart:convert';
import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class addressLocalDataSources {
  Future<void> cacheAddreessJson({required String addressJson});
  Future<Map<String, dynamic>?> getAddressJson();
  Future<void> cacheAddreessListJson({required String addressListJson});
  Future<Map<String, dynamic>?> getAddressListJson();
}

class addressLocalDataSourcesImp implements addressLocalDataSources {
  @override
  Future<void> cacheAddreessJson({required String addressJson}) async {
    PrefService.putString(key: CacheKeys.address, value: addressJson);
  }

  @override
  Future<Map<String, dynamic>?> getAddressJson() async {
    String? json = PrefService.getString(key: CacheKeys.address);
    return jsonDecode(json!);
  }

  @override
  Future<void> cacheAddreessListJson({required String addressListJson}) async {
    PrefService.putString(key: CacheKeys.addressList, value: addressListJson);
  }

  @override
  Future<Map<String, dynamic>?> getAddressListJson() async {
    String? json = PrefService.getString(key: CacheKeys.addressList);
    return jsonDecode(json!);
  }
}
