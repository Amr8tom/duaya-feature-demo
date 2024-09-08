import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/customer_ads/data/data_sources/remote_data_sources.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/ad_details_model.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/get_all_customer_ads.dart';
import 'package:duaya_app/utils/connection/checkNetwork.dart';
import 'package:duaya_app/utils/error/failure.dart';
import '../../domain/repositories/repository.dart';
import '../data_sources/local_data_sources.dart';

class CustomerAdsRepositoryImp implements CustomerAdsRepository {
  final CustomerAdsRemoteDataSources remote;
  final CustomerAdsLocalDataSources local;
  final NetworkInfo networkInfo;
  CustomerAdsRepositoryImp(
      {required this.local, required this.remote, required this.networkInfo});

  @override
  Future<Either<Failure, AdDetailsModel>> getAdDetails(
      {required String ID}) async {
    if (await networkInfo.isConnected) {
      try {
        final adDetails = await remote.getAdDetails(ID: ID);
        print("response =========================== > $adDetails");
        local.cacheAdDetails(CustomerAds: adDetails, ID: ID);
        return right(adDetails);
      } on ServerFailure {
        return left(ServerFailure(message: "Server Failure"));
      }
    } else {
      try {
        final myAds = local.getAdDetails(ID: ID);
        print("myAds =============> $myAds");
        return right(AdDetailsModel.fromJson(myAds));
      } on CacheFailure {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, GetAllCustomerAds>> getAllCustomerAds() async {
    if (await networkInfo.isConnected) {
      try {
        final customerAds = await remote.getCustomerAds();
        print("response =========================== > $customerAds");
        local.cacheCustomerAds(CustomerAds: customerAds);
        return right(customerAds);
      } on ServerFailure {
        return left(ServerFailure(message: "Server Failure"));
      }
    } else {
      try {
        final customerAds = local.getCustomerAds();
        print("customerAds =============> $customerAds");
        return right(GetAllCustomerAds.fromJson(customerAds));
      } on CacheFailure {
        return left(CacheFailure());
      }
    }
  }
}
