import 'package:dio/dio.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';
import 'package:duaya_app/utils/constants/api_constants.dart';

import '../../../../../utils/dio/dio_helper.dart';
import '../models/add_ad_model.dart';

abstract class MyAdsRemoteDataSources {
  Future<AddAdModel> AddMyAd({required FormData params});
  Future<MyAdsListModel> getMyAds();
}

class MyAdsRemoteDataSourcesImp implements MyAdsRemoteDataSources {
  final DioHelper dio;
  MyAdsRemoteDataSourcesImp(this.dio);
  @override
  Future<AddAdModel> AddMyAd({required FormData params}) async {
    final response =
        await dio.postFormData(URL: URL.customerAdsAdd, formData: params);
    // print("response =========================> $response");
    return AddAdModel.fromJson(response);
  }

  @override
  Future<MyAdsListModel> getMyAds() async {
    final response = await dio.getData(URL: URL.customerMyAds);
    // print("response =========================> $response");
    return MyAdsListModel.fromJson(response);
  }
}
