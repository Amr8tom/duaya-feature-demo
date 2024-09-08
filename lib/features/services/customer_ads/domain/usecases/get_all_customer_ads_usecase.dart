import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/get_all_customer_ads.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../repositories/repository.dart';

class GetAllCustomerAdsUsecase {
  final CustomerAdsRepository _repository;
  GetAllCustomerAdsUsecase(this._repository);

  Future<Either<Failure, GetAllCustomerAds>> call() async {
    return _repository.getAllCustomerAds();
  }
}
