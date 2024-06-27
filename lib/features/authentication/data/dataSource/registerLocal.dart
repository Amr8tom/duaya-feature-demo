import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';
import '../model/loginModel.dart';

abstract class rigsterLocalDataSource {
  Future<void> cacheRigsterJson({required String rigsterLogin});
  Future<Map<String, dynamic>?> getRigsterJson();
  Future<void> cacheCountryJson({required String countryList});
  Future<void> cacheCityJson({required String CityList});
  Future<void> cacheStateJson({required String stateList});
  Future<Map<String, dynamic>?> getCountryListJson();
  Future<Map<String, dynamic>?> getCityListJson();
  Future<Map<String, dynamic>?> getStateListJson();
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
  Future<void> cacheCityJson({required String CityList}) async {
    PrefService.putString(key: CacheKeys.cityList, value: CityList);
  }

  @override
  Future<void> cacheStateJson({required String stateList}) async {
    PrefService.putString(key: CacheKeys.stateList, value: stateList);
  }

  @override
  Future<Map<String, dynamic>?> getCityListJson() async {
    String? cityList = PrefService.getString(key: CacheKeys.cityList);
    return jsonDecode(cityList!);
  }

  @override
  Future<Map<String, dynamic>?> getStateListJson() async {
    String? stateList = PrefService.getString(key: CacheKeys.stateList);
    return jsonDecode(stateList!);
  }

  @override
  Future<void> cacheCountryJson({required String countryList}) async {
    PrefService.putString(key: CacheKeys.countryList, value: countryList);
  }

  @override
  Future<Map<String, dynamic>?> getCountryListJson() async {
    String? stateList = PrefService.getString(key: CacheKeys.countryList);
    return jsonDecode(stateList!);
  }
}
