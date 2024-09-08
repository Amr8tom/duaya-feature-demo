import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';

import '../../../../../utils/error/failure.dart';
import '../../../../../utils/local_storage/cach_keys.dart';
import '../../../../../utils/local_storage/cache_helper.dart';

abstract class MyAdsLocalDataSources {
  Future<Unit> cacheMyAds({required MyAdsListModel myAds});
  Future getMyAds();
}

class MyAdsLocalDataSourcesImp implements MyAdsLocalDataSources {
  MyAdsLocalDataSourcesImp();

  @override
  Future<Unit> cacheMyAds({required MyAdsListModel myAds}) async {
    final chacedMyAds = jsonEncode(myAds);
    await PrefService.putString(key: CacheKeys.myAds, value: chacedMyAds);
    return Future.value(unit);
  }

  @override
  Future getMyAds() async {
    final jsonString = PrefService.getString(key: CacheKeys.myAds);
    if (jsonString != null) {
      final decodedJson = await json.decode(jsonString);
      return decodedJson;
    } else {
      throw CacheFailure();
    }
  }
}
