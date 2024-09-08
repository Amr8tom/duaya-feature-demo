import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/customer_ads/data/models/ad_details_model.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../repositories/repository.dart';

class GetCustomerAdDetailsUsecase {
  final CustomerAdsRepository _repository;
  GetCustomerAdDetailsUsecase(this._repository);

  Future<Either<Failure, AdDetailsModel>> call({ID}) {
    return _repository.getAdDetails(ID: ID);
  }
}
