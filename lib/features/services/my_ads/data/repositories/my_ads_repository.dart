import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:duaya_app/features/services/my_ads/data/models/add_ad_model.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../../../../../utils/connection/checkNetwork.dart';
import '../../domain/repositories/my_ads_repository.dart';
import '../datasources/local_data_sources.dart';
import '../datasources/remote_data_sources.dart';

class MyAdsRepositoryImp implements MyAdsRepository {
  final MyAdsLocalDataSources local;
  final MyAdsRemoteDataSources remote;
  final NetworkInfo networkInfo;
  MyAdsRepositoryImp(
      {required this.networkInfo, required this.local, required this.remote});
  @override
  Future<AddAdModel> AddMyAd({required FormData params}) async {
    if (await networkInfo.isConnected) {
      final model = await remote.AddMyAd(params: params);
      return model;
    } else {
      throw ServerFailure(
          message: "=============== server failure ================");
    }
  }

  @override
  Future<Either<Failure, MyAdsListModel>> getMyAdsList() async {
    if (await networkInfo.isConnected) {
      try {
        final myAds = await remote.getMyAds();
        local.cacheMyAds(myAds: myAds);
        return Right(myAds);
      } on ServerFailure {
        return left(
            ServerFailure(message: '======== server failure =========='));
      }
    } else {
      try {
        final myAds = await local.getMyAds();
        print("myAds================>$myAds");
        return right(MyAdsListModel.fromJson(myAds));
      } on CacheFailure {
        return Left(CacheFailure());
      }
    }
  }
}
