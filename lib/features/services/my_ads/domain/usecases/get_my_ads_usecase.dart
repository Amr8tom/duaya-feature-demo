import 'package:dartz/dartz.dart';
import 'package:duaya_app/features/services/my_ads/data/models/my_Ads_list_model.dart';
import 'package:duaya_app/utils/error/failure.dart';

import '../repositories/my_ads_repository.dart';

class GetMyAdsUsecase {
  final MyAdsRepository repository;
  GetMyAdsUsecase(this.repository);
  Future<Either<Failure, MyAdsListModel>> call() {
    return repository.getMyAdsList();
  }
}
