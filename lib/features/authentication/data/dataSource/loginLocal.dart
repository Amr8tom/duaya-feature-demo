import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import '../model/loginModel.dart';

abstract class loginLocalDataSource {
  Future<void> cacheLoginJson({required String loginJson});
  Future<Map<String, dynamic>?> getLoginJson();
}

class loginLocalDataSourceImp implements loginLocalDataSource {
  @override
  Future<void> cacheLoginJson({required String loginJson}) async {
    await PrefService.putString(key: CacheKeys.loginJson, value: loginJson);
  }

  @override
  Future<Map<String, dynamic>?> getLoginJson() async {
    String? loginJson = PrefService.getString(key: CacheKeys.loginJson);
    print(loginJson);
    return jsonDecode(loginJson!);
  }
}
