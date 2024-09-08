import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/ad_details_model.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/get_all_customer_ads.dart';

import '../../../../../utils/error/failure.dart';
import '../../../../../utils/local_storage/cach_keys.dart';
import '../../../../../utils/local_storage/cache_helper.dart';

abstract class CustomerAdsLocalDataSources {
  Future<Unit> cacheCustomerAds({required GetAllCustomerAds CustomerAds});
  Future getCustomerAds();
  Future<Unit> cacheAdDetails(
      {required AdDetailsModel CustomerAds, required String ID});
  Future getAdDetails({required String ID});
}

class CustomerAdsLocalDataSourcesImp implements CustomerAdsLocalDataSources {
  @override
  Future<Unit> cacheCustomerAds(
      {required GetAllCustomerAds CustomerAds}) async {
    final chacedCustomerAds = jsonEncode(CustomerAds);
    await PrefService.putString(
        key: CacheKeys.customerAds, value: chacedCustomerAds);
    return Future.value(unit);
  }

  @override
  Future getCustomerAds() async {
    final jsonString = PrefService.getString(key: CacheKeys.customerAds);
    if (jsonString != null) {
      final decodedJson = await json.decode(jsonString);
      return decodedJson;
    } else {
      throw CacheFailure();
    }
  }

  @override
  Future<Unit> cacheAdDetails(
      {required AdDetailsModel CustomerAds, required String ID}) async {
    final chacedAdDetails = jsonEncode(CustomerAds);
    await PrefService.putStringbyString(
        key: "${CacheKeys.customerAdDetails}$ID", value: chacedAdDetails);
    return Future.value(unit);
  }

  @override
  Future getAdDetails({required String ID}) async {
    final jsonString =
        PrefService.getStringByString(key: "${CacheKeys.customerAdDetails}$ID");
    if (jsonString != null) {
      final decodedJson = await json.decode(jsonString);
      return decodedJson;
    } else {
      throw CacheFailure();
    }
  }
}
