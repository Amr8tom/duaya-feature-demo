import 'dart:async';
import 'package:duaya_app/utils/constants/api_constants.dart';
import 'package:duaya_app/utils/dio/dio_helper.dart';

import '../../../../utils/local_storage/cach_keys.dart';
import '../../../../utils/local_storage/cache_helper.dart';

class categoriesByPageRemoteDataSources {
  categoriesByPageRemoteDataSources();
  Future<Map<String, dynamic>?> getCategoriesByPage({userID = 0}) async {
    DioHelper API = DioHelper();
    final Map<String, dynamic>? response =
        await API.getData(URL: "${URL.categoriesByPageBycity}");
    print(response);
    print("Bearer ${PrefService.getString(key: CacheKeys.token)}");
    print("${URL.categoriesByPageBycity}");
    return response;
  }

  Future<Map<String, dynamic>?> getCategoryByID({CategoryID = 0}) async {
    DioHelper API = DioHelper();
    final Map<String, dynamic>? response =
        await API.getData(URL: "${URL.categoryByID}$CategoryID");
    print(response);
    print("${URL.categoryByID}$CategoryID");
    return response;
  }

  Future<Map<String, dynamic>?> getSubCategoriesByID(
      {required CategoryID}) async {
    DioHelper API = DioHelper();
    final Map<String, dynamic>? response =
        await API.getData(URL: "${URL.subcategories}$CategoryID");
    print(response);
    print("${URL.subcategories}$CategoryID");
    return response;
  }
}
