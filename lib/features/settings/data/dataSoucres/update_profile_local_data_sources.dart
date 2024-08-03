import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class UpdateProfileLocalDataSource {
  Future<void> cahceUpdateProfileModel({required String updateProfileJson});
  Future<Map<String, dynamic>> getupdatePofileModel();
}

class UpdateProfileLocalDataSourceImp implements UpdateProfileLocalDataSource {
  @override
  Future<void> cahceUpdateProfileModel(
      {required String updateProfileJson}) async {
    await PrefService.putString(
        key: CacheKeys.updateProfile, value: updateProfileJson);
  }

  @override
  Future<Map<String, dynamic>> getupdatePofileModel() {
    String? response = PrefService.getString(key: CacheKeys.updateProfile);
    return jsonDecode(response!);
  }
}
