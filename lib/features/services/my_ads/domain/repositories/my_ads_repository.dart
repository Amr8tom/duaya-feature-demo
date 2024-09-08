import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/services/my_ads/data/models/add_ad_model.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';

import '../../../../../utils/error/failure.dart';

abstract class MyAdsRepository {
  Future<AddAdModel> AddMyAd({required FormData params});
  Future<Either<Failure, MyAdsListModel>> getMyAdsList();
}
