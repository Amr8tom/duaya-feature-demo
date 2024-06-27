import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class SettingLocalDataSource {
  Future<void> cahceProfileModel({required String profileJson});
  Future<Map<String, dynamic>> getPofileModel();
}

class SettingLocalDataSourceImp implements SettingLocalDataSource {
  @override
  Future<void> cahceProfileModel({required String profileJson}) async {
    await PrefService.putString(key: CacheKeys.profile, value: profileJson);
  }

  @override
  Future<Map<String, dynamic>> getPofileModel() async {
    String? response = PrefService.getString(key: CacheKeys.profile);
    return jsonDecode(response!);
  }
}
