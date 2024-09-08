import 'package:dio/dio.dart';
import 'package:duaya_app/features/services/my_ads/data/models/add_ad_model.dart';
import 'package:duaya_app/features/services/my_ads/domain/repositories/my_ads_repository.dart';

class AddAdsUsecase {
  final MyAdsRepository repository;
  AddAdsUsecase(this.repository);

  Future<AddAdModel> call({required FormData params}) async {
    return repository.AddMyAd(params: params);
  }
}
