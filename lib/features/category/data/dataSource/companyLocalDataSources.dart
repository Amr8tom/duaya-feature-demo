import 'dart:convert';

import 'package:duaya_app/utils/local_storage/cach_keys.dart';
import 'package:duaya_app/utils/local_storage/cache_helper.dart';

abstract class companyLocalDataSources {
  Future<void> cacheCompanyLocalDataSources({required String jsonBody});
  Future<Map<String, dynamic>> getCompanyLocalDataSources();
  Future<void> cacheCompanyDetails(
      {required String jsonBody, required String id});
  Future<Map<String, dynamic>> getCompanyDetails({required String id});
  Future<void> cacheNewProductCompany(
      {required String jsonBody, required String id});
  Future<Map<String, dynamic>> getNewProductCompany({required String id});
  Future<void> cacheBestSellerProductCompany(
      {required String jsonBody, required String id});
  Future<Map<String, dynamic>> getBestSellerProductCompany(
      {required String id});
}

class companyLocalDataSourcesImp implements companyLocalDataSources {
  @override
  Future<void> cacheCompanyLocalDataSources({required String jsonBody}) async {
    await PrefService.putString(key: CacheKeys.company, value: jsonBody);
  }

  @override
  Future<Map<String, dynamic>> getCompanyLocalDataSources() async {
    final String? response =
        await PrefService.getString(key: CacheKeys.company);
    return jsonDecode(response!);
  }

  @override
  Future<void> cacheCompanyDetails(
      {required String jsonBody, required String id}) async {
    await PrefService.putStringbyString(
        key: "${CacheKeys.company}$id", value: jsonBody);
  }

  @override
  Future<Map<String, dynamic>> getCompanyDetails({required String id}) async {
    final String? response =
        await PrefService.getStringByString(key: "${CacheKeys.company}$id");
    return jsonDecode(response!);
  }

  @override
  Future<void> cacheNewProductCompany(
      {required String jsonBody, required String id}) async {
    await PrefService.putStringbyString(
        key: "${CacheKeys.newProductCompany}$id", value: jsonBody);
  }

  @override
  Future<Map<String, dynamic>> getNewProductCompany(
      {required String id}) async {
    final String? response = await PrefService.getStringByString(
        key: "${CacheKeys.newProductCompany}$id");
    return jsonDecode(response!);
  }

  @override
  Future<void> cacheBestSellerProductCompany(
      {required String jsonBody, required String id}) async {
    await PrefService.putStringbyString(
        key: "${CacheKeys.bestSellerProductCompany}$id", value: jsonBody);
  }

  @override
  Future<Map<String, dynamic>> getBestSellerProductCompany(
      {required String id}) async {
    final String? response = await PrefService.getStringByString(
        key: "${CacheKeys.bestSellerProductCompany}$id");
    return jsonDecode(response!);
  }
}
