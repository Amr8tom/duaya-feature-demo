import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import '../model/loginModel.dart';

abstract class rigsterLocalDataSource {
  Future<void> cacheRigsterJson({required String rigsterLogin});
  Future<Map<String, dynamic>?> getRigsterJson();
  Future<void> cacheCitiesJson({required String cities});
  Future<Map<String, dynamic>?> getCitiesJson();
}

class rigsterLocalDataSourceImp implements rigsterLocalDataSource {
  @override
  Future<void> cacheRigsterJson({required String rigsterLogin}) async {
    PrefService.putString(key: CacheKeys.rigsterLogin, value: rigsterLogin);
  }

  @override
  Future<Map<String, dynamic>?> getRigsterJson() async {
    String? rigsterLogin = PrefService.getString(key: CacheKeys.rigsterLogin);
    print(rigsterLogin);
    return jsonDecode(rigsterLogin!);
  }

  @override
  Future<void> cacheCitiesJson({required String cities}) async {
    PrefService.putString(key: CacheKeys.cities, value: cities);
  }

  @override
  Future<Map<String, dynamic>?> getCitiesJson() async {
    String? cities = PrefService.getString(key: CacheKeys.cities);
    return jsonDecode(cities!);
  }
}
