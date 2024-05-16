import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class categoriesByPageLocalDataSources {
  Future<void> cacheCategoriesByPAge({required String categoriesByPageJson});
  Future<Map<String, dynamic>> getCategoriesByPAge();
  Future<void> cacheCategoryByID({required String categoryByIDJson,required String categoryID});
  Future<Map<String,dynamic>> getCategoryByID({required categoryID});
}

class categoriesByPageLocalDataSourcesImp
    implements categoriesByPageLocalDataSources {
  @override
  Future<void> cacheCategoriesByPAge(
      {required String categoriesByPageJson}) async {
    await PrefService.putString(
        key: CacheKeys.categoriesByPage, value: categoriesByPageJson);
  }

  @override
  Future<Map<String, dynamic>> getCategoriesByPAge() async {
    final String? categoriesByPageJson =
        await PrefService.getString(key: CacheKeys.categoriesByPage);
    return jsonDecode(categoriesByPageJson!);
  }

  @override
  Future<void> cacheCategoryByID({required String categoryByIDJson,required String categoryID})async{
   await PrefService.putStringbyString(key:"${CacheKeys.categoriesByPage.name}$categoryID", value:categoryByIDJson);
  }

  @override
  Future<Map<String, dynamic>> getCategoryByID({required categoryID}) async{
    final String? json = await PrefService.getStringByString(key: "${CacheKeys.categoriesByPage.name}$categoryID");
    return jsonDecode(json!);
  }
}
