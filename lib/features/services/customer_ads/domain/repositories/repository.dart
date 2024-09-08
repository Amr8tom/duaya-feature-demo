import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/ad_details_model.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/get_all_customer_ads.dart';
import 'package:duaya_app/utils/error/failure.dart';

abstract class CustomerAdsRepository {
  Future<Either<Failure, GetAllCustomerAds>> getAllCustomerAds();
  Future<Either<Failure, AdDetailsModel>> getAdDetails({required String ID});
}
